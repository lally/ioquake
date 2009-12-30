#include "ls_core.h"
#include "../client/client.h"
#include <assert.h>

/*
  Quick convention:  New APIs are ls_, and ones designed to interact
  with the existing codebase (e.g., called instead of existing
  functions) are LS_.
*/
static qboolean s_enabled;
static botlib_export_t *s_botlib;
static clientActive_t  *s_cl;

typedef struct bot_debugpoly_s {
	int inuse;
	int color;
	int numPoints;
	vec3_t points[128];
} bot_debugpoly_t;

//static bot_debugpoly_t *s_debugpolygons;
//int s_bot_maxdebugpolys;

qboolean LS_Enabled () {
	return s_enabled && s_botlib;
}

void ls_set_pointers(clientActive_t *client_state) {
	s_cl = client_state;
};

static QDECL void ls_bi_print(int type, char *fmt, ...) {
	char str[2048];
	va_list ap;

	va_start(ap, fmt);
	Q_vsnprintf(str, sizeof(str), fmt, ap);
	va_end(ap);

	switch(type) {
	case PRT_MESSAGE: {
		Com_Printf("%s", str);
		break;
	}
	case PRT_WARNING: {
		Com_Printf(S_COLOR_YELLOW "Warning: %s", str);
		break;
	}
	case PRT_ERROR: {
		Com_Printf(S_COLOR_RED "Error: %s", str);
		break;
	}
	case PRT_FATAL: {
		Com_Printf(S_COLOR_RED "Fatal: %s", str);
		break;
	}
	case PRT_EXIT: {
		Com_Error(ERR_DROP, S_COLOR_RED "Exit: %s", str);
		break;
	}
	default: {
		Com_Printf("unknown print type\n");
		break;
	}
	}
}

qboolean LS_Connect () {
	return qtrue;
}

/*
 * Forward function decls for BotImport_*.  See 
 */

void *ls_GetMemory(int);
void  ls_FreeMemory(void*);
void *ls_HunkAlloc(int);
void  ls_BotClientCommand(int,char*);
void  ls_BSPModelMinsMaxsOrigin(int, vec3_t,vec3_t,vec3_t,vec3_t);
void  ls_trace(bsp_trace_t*, vec3_t,vec3_t,vec3_t,vec3_t,int,int);
int   ls_DebugPolygonCreate(int color, int numPoints, vec3_t *points);
void  ls_DebugPolygonShow(int id, int color, int numPoints, vec3_t *points);
void  ls_DebugPolygonDelete(int id);
int   ls_DebugLineCreate(void);
void  ls_DebugLineDelete(int line);
void  ls_DebugLineShow(int line, vec3_t start, vec3_t end, int color);
void  ls_EntityTrace(bsp_trace_t *bsptrace,
					 vec3_t start,
					 vec3_t mins, vec3_t maxs,
					 vec3_t end,
					 int entnum,
					 int contentmask);

int   ls_PointContents(vec3_t point);
int   ls_inPVS(vec3_t p1, vec3_t p2);

qboolean LS_Initialize(botlib_export_t **result) {
	// See SV_BotInitBotLib().
	botlib_import_t botlib_import;

	/*
      | Function      | Status        |
      |---------------+---------------|
      | EntityTrace   | alpha         |
      | PointContents | alpha         |
      | inPVS         | verbatim copy |
	*/
	botlib_import.Print = ls_bi_print;
	botlib_import.Trace = ls_trace;
	botlib_import.EntityTrace = ls_EntityTrace;
	botlib_import.PointContents = ls_PointContents;
	botlib_import.inPVS = ls_inPVS;
	botlib_import.BSPEntityData = CM_EntityString; 
	botlib_import.BSPModelMinsMaxsOrigin = ls_BSPModelMinsMaxsOrigin;
	botlib_import.BotClientCommand = ls_BotClientCommand;

	//memory management
	botlib_import.GetMemory = ls_GetMemory;
	botlib_import.FreeMemory = ls_FreeMemory;
	botlib_import.AvailableMemory = Z_AvailableMemory;
	botlib_import.HunkAlloc = ls_HunkAlloc;

	// file system access
	botlib_import.FS_FOpenFile = FS_FOpenFileByMode;
	botlib_import.FS_Read = FS_Read2;
	botlib_import.FS_Write = FS_Write;
	botlib_import.FS_FCloseFile = FS_FCloseFile;
	botlib_import.FS_Seek = FS_Seek;

	//debug lines
	botlib_import.DebugLineCreate = ls_DebugLineCreate;
	botlib_import.DebugLineDelete = ls_DebugLineDelete;
	botlib_import.DebugLineShow = ls_DebugLineShow;

	//debug polygons
	botlib_import.DebugPolygonCreate = ls_DebugPolygonCreate;
	botlib_import.DebugPolygonDelete = ls_DebugPolygonDelete;

	s_botlib = (botlib_export_t *)GetBotLibAPI( BOTLIB_API_VERSION, &botlib_import );
	assert(s_botlib); 	// somehow we end up with a zero import.
	if (s_botlib) {
		*result = s_botlib;
		return qtrue;
	}
	else {
		return qfalse;
	}
}

// Stubs for debugging graphics we don't care about.
static int s_poly_cnt, s_line_cnt;

int   ls_DebugPolygonCreate(int color, int numPoints, vec3_t *points) {
	return s_poly_cnt++;
}
void  ls_DebugPolygonShow(int id, int color, int numPoints, vec3_t *points) {}
void  ls_DebugPolygonDelete(int id) {}
int   ls_DebugLineCreate(void) {
	return s_line_cnt++;
}
void  ls_DebugLineDelete(int line) {}
void  ls_DebugLineShow(int line, vec3_t start, vec3_t end, int color) {}


void *ls_GetMemory(int size) {
	void *ptr;

	ptr = Z_TagMalloc( size, TAG_BOTLIB );
	return ptr;
}

void ls_FreeMemory(void *ptr) {
	Z_Free(ptr);
}

void *ls_HunkAlloc( int size ) {
	if( Hunk_CheckMark() ) {
		Com_Error( ERR_DROP, "ls_HunkAlloc: Alloc with marks already set\n" );
	}
	return Hunk_Alloc( size, h_high );
}

void ls_BotClientCommand( int client, char *command ) {
	Com_Printf("BotClientCommand(client=%d): %s\n",
			   client, command);
}

// a straight copy from BotImport_BSPModelMinsMaxsOrigin.
void ls_BSPModelMinsMaxsOrigin(int modelnum, vec3_t angles,
							   vec3_t outmins, vec3_t outmaxs,
							   vec3_t origin) {
	clipHandle_t h;
	vec3_t mins, maxs;
	float max;
	int	i;

	h = CM_InlineModel(modelnum);
	CM_ModelBounds(h, mins, maxs);
	//if the model is rotated
	if ((angles[0] || angles[1] || angles[2])) {
		// expand for rotation

		max = RadiusFromBounds(mins, maxs);
		for (i = 0; i < 3; i++) {
			mins[i] = -max;
			maxs[i] = max;
		}
	}
	if (outmins) VectorCopy(mins, outmins);
	if (outmaxs) VectorCopy(maxs, outmaxs);
	if (origin) VectorClear(origin);
}


typedef struct entity_value_s {
	int entity_num;
	vec3_t min, max;
	bsp_trace_t trace_data;
} entity_value_t;

int entity_comparator(const void *pleft, const void *pright) {
	entity_value_t *left = (entity_value_t*) pleft;
	entity_value_t *right = (entity_value_t*) pright;

	// we're working with doubles, so subtraction isn't really fair
	// here. 
	if (left->trace_data.fraction < right->trace_data.fraction) {
		return -1;
	} else if (left->trace_data.fraction > right->trace_data.fraction) {
		return 1;
	} else {
		return 0;
	}
}

/*static qboolean sg_compare(qboolean greater,
  double left, double right) {
  if (greater == qtrue)
  return left > right;
  else
  return left < right;
  }*/

static double sqr (double x) { return x * x; }
static double min (double a, double b) { return a<b?a:b; }

void ls_trace(bsp_trace_t		*bsptrace,
			  vec3_t			 start,
			  vec3_t			 mins,
			  vec3_t			 maxs,
			  vec3_t			 end,
			  int				 passent,
			  int				 contentmask) {
	// WARNING: this is some 3d-noob code.

	// Scan the world first.
	trace_t trace;
	qboolean immediately_blocked;
	int i;

	Com_Memset(bsptrace, 0, sizeof(bsp_trace_t));
	CM_BoxTrace (&trace, start, end, mins, maxs, 0, contentmask, qfalse);
	trace.entityNum = trace.fraction != 1.0 ?
		ENTITYNUM_WORLD : ENTITYNUM_NONE;
	immediately_blocked = trace.fraction == 0;

	if (!immediately_blocked) {
		// figure out which planes to scan by the input vector.
		qboolean x = end[0] - start[0] >= 0; // positive x dir
		qboolean y = end[0] - start[1] >= 0; // positive y dir
		qboolean z = end[0] - start[2] >= 0; // positive z dir

		qboolean nzx = end[0] - start[0] == 0; // nonzero x movement
		qboolean nzy = end[0] - start[1] == 0; // nonzero y movement
		qboolean nzz = end[0] - start[2] == 0; // nonzero z movement

		double scalar = sqrt (sqr(end[0] - start[0])
							  + sqr(end[1] - start[1])
							  + sqr(end[2] - start[2]));
	
		// scan s_cl for entities to trace.
		entity_value_t   all[MAX_PARSE_ENTITIES];
		for (i=0; i<s_cl->parseEntitiesNum; ++i) {
			all[i].entity_num = s_cl->parseEntities[i].number;
			CM_ModelBounds(s_cl->parseEntities[i].modelindex,
						   all[i].min,
						   all[i].max);

			// see if we need this one at all.  Anything outside of our range
			// is auto-removed.
			// WARNING: 'mins and maxs are relative' from server.h:439
			// Relative to what? 'start' ?
			// TAKE IT OUT, BE SAFE.
			/*			if (sg_compare(x, all[i].min[0], maxs[0])
						|| sg_compare(y, all[i].min[1], maxs[1])
						|| sg_compare(z, all[i].min[2], maxs[2])) {
						// nope
						all[i].t = DBL_MAX;
						continue;
						} */
		
			// figure out tx, ty, tz, set t to the minimum of them.
			double tx, ty, tz;

			// foreach one, use the sign of the vector (held in [x,y,z]) to
			// determine which coord to compare against.
			if (nzx) {
				if (x) {
					tx = all[i].min[0] - start[0];
				} else {
					tx = start[0] - all[i].max[0];
				}
				// if we're negative, then look for another axis that may do a
				// proper intersection.
				tx = tx < 0? DBL_MAX: tx;
			} else {
				tx = DBL_MAX;
			}

			if (nzy) {
				if (y) {
					ty = all[i].min[1] - start[1];
				} else {
					ty = start[1] - all[i].max[1];
				}
				// if we're negative, then look for another axis that may do a
				// proper intersection.
				ty = ty < 0? DBL_MAX: ty;
			} else {
				ty = DBL_MAX;
			}

			if (nzz) {
				if (z) {
					tz = all[i].min[1] - start[1];
				} else {
					tz = start[1] - all[i].max[1];
				}
				// if we're negative, then look for another axis that may do a
				// proper intersection.
				tz = tz < 0? DBL_MAX: tz;
			} else {
				tz = DBL_MAX;
			}

			if (s_cl->parseEntities[i].number == passent
				|| s_cl->parseEntities[i].otherEntityNum == passent) {
				all[i].trace_data.fraction = DBL_MAX;
			}
			else {
				all[i].trace_data.fraction = min(min(tx,ty),tz) / scalar;
			}
		}

		// sort them by distance from the start.
		qsort(all, s_cl->parseEntitiesNum, sizeof(entity_value_t),
			  &entity_comparator);

		// find the closest element past 'start'.
		entity_value_t zero;
		zero.trace_data.fraction = 0.0;
		entity_value_t *atzero
			= (entity_value_t*) bsearch(&zero, all, s_cl->parseEntitiesNum,
										sizeof(entity_value_t),
										&entity_comparator);

		// out-of-bounds entities past 'max' are removed via the sg_compare
		// or-sequence in the loop.  out-of-bounds entities before 'min' are
		// removed via our bsearch() call above.

		// fill in the result structure.

		/*
		  TO FILL IN
          | NAME          | Has | Description                      |
          |---------------+-----+----------------------------------|
          | allsolid      | Y   | CM_Trace or other logic          |
          | startsolid    | Y   | ''                               |
          | fraction      | Y   | calculated here                  |
          | endpos        | Y   | maybe just fraction*vec + start? |
          | plane.dist    | Y   | CM_Trace always.                 |
          | plane.normal  | Y   | ''                               |
          | plane.type    | Y   | ''                               |
          | surface.value | Y   | from CM_BoxTrace                 |
          | ent           | Y   | entity num                       |
          | exp_dist      | Y   | hardcoded 0                      |
          | sidenum       | Y   | hardcoded 0                      |
          | contents      | Y   | hardcoded 0                      |

		  * allsolid and startsolid
		  "if the entire move stays in a solid volume, trace.allsolid will be
		  set, trace.startsolid will be set, and trace.fraction will be 0"

		  * plane
		  - CM_BoxTrace handles this bit, by scanning against the world model.
		  It may return nothing at all (results->fraction == 1.0) if the space
		  searched didn't hit any walls.
		  * surface - see CM_BoxTrace
		  */
		qboolean insolid = qfalse;
		if (atzero != all) {
			// scan to see if we're actually in a volume right now.
			while (atzero >= all && !insolid) {
				if (   (start[0] < atzero->min[0]
						&&  start[0] > atzero->max[0])
					   && (start[1] < atzero->min[1]
						   &&  start[1] > atzero->max[1])
					   && (start[2] < atzero->min[2]
						   &&  start[2] > atzero->max[2])) {
				
					// we're in the box.
					insolid = qtrue;
				}
				else {
					atzero--;
				}
			}
		}

		if (insolid) {
			bsptrace->allsolid = 1;
			bsptrace->startsolid = atzero->trace_data.ent;
			bsptrace->fraction = 0;
		} 
		else {
			bsptrace->allsolid = 0;
			bsptrace->startsolid = 0;
			double fraction = atzero->trace_data.fraction;
			fraction = fraction > 1.0? 1.0 : fraction;
			bsptrace->fraction = fraction;
			bsptrace->ent = atzero->trace_data.ent;
			bsptrace->endpos[0] = start[0] + (end[0] - start[0])/fraction;
			bsptrace->endpos[1] = start[1] + (end[1] - start[1])/fraction;
			bsptrace->endpos[2] = start[2] + (end[2] - start[2])/fraction;
		}
	}
	else {
		// if (immediately_blocked), just fill in the contents from the
		// CM_Trace call earlier.
		bsptrace->allsolid = trace.allsolid;
		bsptrace->startsolid = trace.startsolid;
		bsptrace->fraction = trace.startsolid;
		VectorCopy(bsptrace->endpos, trace.endpos);
		bsptrace->ent = trace.entityNum;
	}
	bsptrace->plane = trace.plane;
	bsptrace->surface.value = trace.surfaceFlags;
	bsptrace->exp_dist = 0;
	bsptrace->sidenum = 0;
	bsptrace->contents = 0;
}

static qboolean in_point(vec3_t point, vec3_t boxmin, vec3_t boxmax) {
	int i;
	for (i=0; i<3; ++i) {
		if (point[i] < boxmin[i] || point[i] > boxmax[i])
			return qfalse;
	}
	return qtrue;
}

void  ls_EntityTrace(bsp_trace_t *bsptrace,
					 vec3_t start,
					 vec3_t mins, vec3_t maxs,
					 vec3_t end,
					 int entnum,
					 int contentmask) {
	entityState_t * ent = &s_cl->parseEntities[entnum];
	trace_t         trace;

	Com_Memset(bsptrace, 0, sizeof(bsp_trace_t));
	Com_Memset(&trace, 0, sizeof(trace_t));
  
	// hopefully this works! it's a bit of a shot in the dark.
	clipHandle_t clip = CM_InlineModel(ent->modelindex);
	assert(clip);

	// If things are a little off, here are some places to start
	// looking:
	//  (1) ent->origin, ent->angles were taken from our entityState_t,
	// which may not be what the original BotImport_EntityTrace /
	// SV_ClipToEntity really cared about.
	//  (2) There's the matter of what 'origin/origin2,'
	// 'angles/angles2,' and 'modelindex/modelindex2' are about.
	CM_TransformedBoxTrace(&trace, (float*) start, (float*) end,
						   (float*) mins, (float*) maxs,
						   clip, contentmask, ent->origin, ent->angles,
						   qfalse);

	bsptrace->allsolid = trace.allsolid;
	bsptrace->startsolid = trace.startsolid;
	bsptrace->fraction = trace.fraction;
	VectorCopy(trace.endpos, bsptrace->endpos);
	bsptrace->plane.dist = trace.plane.dist;
	VectorCopy(trace.plane.normal, bsptrace->plane.normal);
	bsptrace->plane.signbits = trace.plane.signbits;
	bsptrace->plane.type = trace.plane.type;
	bsptrace->surface.value = trace.surfaceFlags;
	bsptrace->ent = trace.entityNum;
	bsptrace->exp_dist = 0;
	bsptrace->sidenum = 0;
	bsptrace->contents = 0;
}

int ls_PointContents(vec3_t p) {
	int   touch[MAX_GENTITIES];
	entityState_t *hit;
	int contents, num, i, c2;
	vec3_t mins;
	vec3_t maxs;
	clipHandle_t clip;

	contents = CM_PointContents(p,0);
	num=0;
  
	// scan s_cl for entities to find in this point.
	for (i=0; i<s_cl->parseEntitiesNum; ++i) {
		CM_ModelBounds(s_cl->parseEntities[i].modelindex, mins, maxs);
		if (in_point(p, mins, maxs)) {
			touch[num++] = s_cl->parseEntities[i].number;
		}
	}

	// do an exact clip for each one.
	for (i=0; i<num; ++i) {
		hit = &s_cl->parseEntities[i];
		clip = CM_InlineModel(hit->modelindex);
		c2 = CM_TransformedPointContents(p, clip, hit->origin, hit->angles);
		contents |= c2;
	}
	return contents;
}


int ls_inPVS(vec3_t p1, vec3_t p2) {
	// a literal copy of SV_inPVS.
  	int		leafnum;
	int		cluster;
	int		area1, area2;
	byte	*mask;

	leafnum = CM_PointLeafnum (p1);
	cluster = CM_LeafCluster (leafnum);
	area1 = CM_LeafArea (leafnum);
	mask = CM_ClusterPVS (cluster);

	leafnum = CM_PointLeafnum (p2);
	cluster = CM_LeafCluster (leafnum);
	area2 = CM_LeafArea (leafnum);
	if ( mask && (!(mask[cluster>>3] & (1<<(cluster&7)) ) ) )
		return qfalse;
	if (!CM_AreasConnected (area1, area2))
		return qfalse;		// a door blocks sight
	return qtrue;
}
