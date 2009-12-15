#include "ls_core.h"
#include <assert.h>

static qboolean s_enabled;
static botlib_export_t *s_botlib;

typedef struct bot_debugpoly_s {
  int inuse;
  int color;
  int numPoints;
  vec3_t points[128];
} bot_debugpoly_t;

static bot_debugpoly_t *s_debugpolygons;
int s_bot_maxdebugpolys;

qboolean LS_Enabled () {
  return s_enabled && s_botlib;
}


static QDECL ls_bi_print(int type, char *fmt, ...) {
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

qboolean LS_Initialize(botlib_export_t **result) {
  botlib_import_T botlib_import;
  
  botlib_import.Print = ls_bi_print;
  botlib_import.Trace = BotImport_Trace;
  botlib_import.EntityTrace = BotImport_EntityTrace;
  botlib_import.PointContents = BotImport_PointContents;
  botlib_import.inPVS = BotImport_inPVS;
  botlib_import.BSPEntityData = BotImport_BSPEntityData;
  botlib_import.BSPModelMinsMaxsOrigin = BotImport_BSPModelMinsMaxsOrigin;
  botlib_import.BotClientCommand = BotClientCommand;

  //memory management
  botlib_import.GetMemory = BotImport_GetMemory;
  botlib_import.FreeMemory = BotImport_FreeMemory;
  botlib_import.AvailableMemory = Z_AvailableMemory;
  botlib_import.HunkAlloc = BotImport_HunkAlloc;

  // file system access
  botlib_import.FS_FOpenFile = FS_FOpenFileByMode;
  botlib_import.FS_Read = FS_Read2;
  botlib_import.FS_Write = FS_Write;
  botlib_import.FS_FCloseFile = FS_FCloseFile;
  botlib_import.FS_Seek = FS_Seek;

  //debug lines
  botlib_import.DebugLineCreate = BotImport_DebugLineCreate;
  botlib_import.DebugLineDelete = BotImport_DebugLineDelete;
  botlib_import.DebugLineShow = BotImport_DebugLineShow;

  //debug polygons
  botlib_import.DebugPolygonCreate = BotImport_DebugPolygonCreate;
  botlib_import.DebugPolygonDelete = BotImport_DebugPolygonDelete;

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
