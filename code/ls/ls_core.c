#include "ls_core.h"
#include "ls_variables.h"
#include "ls_route.h"
#include "../client/client.h"
#include <assert.h>
#include "../game/g_public.h"

/*
  Quick convention:  New APIs are ls_, and ones designed to interact
  with the existing codebase (e.g., called instead of existing
  functions) are LS_.
*/
static qboolean s_enabled, s_queried;
static botlib_export_t *s_botlib;
static clientActive_t  *s_cl;
static clientStatic_t  *s_cls;

static int s_lastpath_time = 0;
static int_vec_t s_path;
static int s_waypoint_number = 0;

//static unsigned s_frame_msec;
//static int              s_old_com_frameTime;

typedef struct bot_debugpoly_s {
  int inuse;
  int color;
  int numPoints;
  vec3_t points[128];
} bot_debugpoly_t;

//static bot_debugpoly_t *s_debugpolygons;
//int s_bot_maxdebugpolys;

qboolean LS_Enabled () {
	if (!s_queried) {
		s_queried = qtrue;
		s_enabled = ls_pref_value(LSP_SIMULATOR);
	}
	return s_enabled; // && s_botlib;
}

qboolean LS_Connect () {
  return qtrue;
}

/*****************************************************************************
 * Client integration
 *****************************************************************************/

/* TODO:
   1) Get Current Position and Orientation
   2) Get desired vector from pathfinding
   3) Subtract, get magnitude and direction.
   4) If Magnitude < threshold, consume path element and goto step 2.
   5)   If path is complete, ask AI for next step, then goto 2.
   6) else, magnitude -> CL.forwardmove.  direction -> CL.rightmove.

   Current position (from CG_Viewpos_f, which is known to work 
   client-side):
   CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
   (int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
   (int)cg.refdefViewAngles[YAW]);
   
*/

static struct position hardcoded_dest_right = {-381, -792, 626 }; // B-2
static struct position hardcoded_dest_left = {-388, 918, 626 }; // B-5
static bool           ls_initialized;
static region_map_t   s_regs;
static waypoint_vec_t s_wmap;

struct region regions[] = {
  // Quad-damage platform (Q)
  { {120, 50, 1290}, {225, 65, 1355}},

  // Railgun platform (R)
  { {2300, -250, 270}, { 2600, 350, 335} },

  // Low jump platform (J)
  { {-372, -300, 15}, {1150, 500, 75} },

  // mid platform (M)
  { {-710, -1200, 305}, {710, 1200, 405} },

  // Note: these two differ across the __Y__ axis.

  // left upper platform (L)
  { {-1500, -1300, 590}, {500, -400, 650} },

  // right upper platform (R)
  { {-1500, 400, 590}, {500, 1300, 650} }
};

/* NOTES 
   =====

   Maybe read up a bit on pathfinding today.  Put a bit in
   waypoint_init (and waypoint) to mark some waypoints as useless for
   dead-reckoning (that is, pathFind() won't consider them for finding
   the nearest nav-point).  That should get rid of the 'walk straight
   to the portal on the wrong edge' problem.
 */

struct waypoint_init points[] = {
  /*
    Nibbles
  
  | Name     | Location               | Bitmap 1 (B1) |                    | B0       |          | Bitmap 0 (B3)  |             | B2       |          | B1          |          | B0       |           |
  |----------+------------------------+---------------+--------------------+----------+----------+----------------+-------------+----------+----------+-------------+----------+----------+-----------|
  | -------- | ---------------------- | Nibble 3      | Nibble 2           | Nibble 1 | Nibble 0 | Nibble 7       | Nibble 6    | Nibble 5 | Nibble 4 | Nibble 3    | Nibble 2 | Nibble 1 | Nibble 0  |
  |          |                        | B-i',B-h'     | B-g',f',B-6', B-1' | B ihgf   | Be,d,c,b | Ba, Ws2,s1,Wr2 | Ws1,G2,1,F3 | F21,e,D5 | D4,3,2,1 | B2-2,1,C6,5 | C4,3,2,1 | B6,5,4,3 | B2,1,A2,1 |
  
                                                                         B210,  B76543210..
  ************************************************************************************|*****/  
  { "A-1",                                 0,  {122,   61,     1330},  {0x000, 0x00000002}},
  { "A-2",                     LPR_ROUTEONLY,  {220,   59,     1330},  {0x000, 0x00040000}},
  /*..............................................................................|...|...*/
  { "B-1",          LPR_JUMP | LPR_ROUTEONLY,  {190,   -900,   378},   {0x000, 0x00040000}},
  { "B-2",                                 0,  {-381,  -792,   626},   {0x000, 0x20004010}},
  { "B-3",          LPR_JUMP | LPR_ROUTEONLY,  {-388,  -425,   626},   {0x000, 0x00000040}},
  { "B-4",          LPR_JUMP | LPR_ROUTEONLY,  {-388,  550,    626},   {0x000, 0x00000008}},
  { "B-5",                                 0,  {-388,  918,    626},   {0x000, 0x40008020}},
  { "B-6",          LPR_JUMP | LPR_ROUTEONLY,  {150,   1052,   378},   {0x000, 0x00040000}},
  /*..............................................................................|...|...*/
  { "C-1",                                 0,  {161,   -921,   626},   {0x000, 0x00014000}},
  { "C-2",          LPR_JUMP | LPR_ROUTEONLY,  {40,    -673,   378},   {0x000, 0x00004000}},
  { "C-3",                                 0,  {189,   -501,   378},   {0x018, 0x00030000}},
  { "C-4",                                 0,  {194,   526,    378},   {0x022, 0x00181000}},
  { "C-5",          LPR_JUMP | LPR_ROUTEONLY,  {40,    800,    378},   {0x000, 0x00008000}},
  { "C-6",                                 0,  {139,   1073,   626},   {0x000, 0x00100000}},
  /*..............................................................................|...|...*/
  { "B2-1",                                0,  {-55,   -771,   626},   {0x000, 0x20000108}},
  { "B2-2",                                0,  {-60,   925,    626},   {0x000, 0x40002040}},
  /*..............................................................................|...|...*/
  { "D-1",                  LPR_SLOWAPPROACH,  {342,   -936,   378},   {0x100, 0x001e0600}},
  { "D-2",                  LPR_SLOWAPPROACH,  {193,   -390,   378},   {0x100, 0x001d0600}},
  { "D-3",                  LPR_SLOWAPPROACH,  {705,   64,     374},   {0x000, 0x003b0000}},
  { "D-4",                  LPR_SLOWAPPROACH,  {202,   517,    378},   {0x200, 0x00171800}},
  { "D-5",                  LPR_SLOWAPPROACH,  {378,   1023,   378},   {0x200, 0x000f1800}},
  /*..............................................................................|...|...*/
  { "E",                       LPR_ROUTEONLY,  {1100,  58,     50},    {0x004, 0x00800000}},
  /*..............................................................................|...|...*/
  { "F-1",          LPR_JUMP | LPR_ROUTEONLY,  {2480,  -205,   306},   {0x000, 0x02020000}},
  { "F-2",                                 0,  {2399,  67,     306},   {0x000, 0x06000000}},
  { "F-3",          LPR_JUMP | LPR_ROUTEONLY,  {2480,  329,    306},   {0x000, 0x04080000}},
  /*..............................................................................|...|...*/
  { "G-1",                  LPR_SLOWAPPROACH,  {2516,  -100,   306},   {0x000, 0x04c00000}},
  { "G-2",                  LPR_SLOWAPPROACH,  {2527,  232,    306},   {0x000, 0x03800000}},
  /*..............................................................................|...|...*/
  { "W-r1",                                0,  {297,   -542,   378},   {0x000, 0x00034404}},
  { "W-r2",                                0,  {304,   679,    378},   {0x000, 0x00181080}},
  { "W-s1",                                0,  {-578,  -1096,  626},   {0x000, 0x00004100}},
  { "W-s2",                                0,  {-570,  1221,   626},   {0x000, 0x0000a000}},
  /*..............................................................................|...|...*/
  { "B-a",                                 0,  { -65,  -201,   50},   {0x0c09, 0x00000000}}, 
  { "B-b",                                 0,  { -42,  320,    50},   {0x1802, 0x80000000}},
  { "B-c",                                 0,  { 450,  331,    50},   {0x300d, 0x00000000}},
  { "B-d",                                 0,  { 402,  63,     50},   {0x200a, 0x00200000}}, // -> e
  { "B-e",                                 0,  { 402,  -185,   50},   {0x2406, 0x80000000}},
  { "B-f",          LPR_JUMP | LPR_ROUTEONLY,  {187,   -100,   63},   {0x0000, 0x00000400}},
  { "B-g",          LPR_JUMP | LPR_ROUTEONLY,  {0,     62,     59},   {0x0000, 0x00000001}},
  { "B-h",          LPR_JUMP | LPR_ROUTEONLY,  { 180,  275,    63},   {0x0003, 0x00000800}},
  { "B-i",          LPR_JUMP | LPR_ROUTEONLY,  {375,   70,     63},   {0x000e, 0x00040000}},
  /*..............................................................................|...|...*/
  { "B-1'",                    LPR_ROUTEONLY,  { 170, -877,   378},   {0x0000, 0x00000004}},
  { "B-6'",                    LPR_ROUTEONLY,  { 165, 1004,   378},   {0x0000, 0x00000080}},
  { "B-f'",                 LPR_SLOWAPPROACH,  { 198, -149,    61},   {0x0062, 0x80000000}},
  { "B-g'",                 LPR_SLOWAPPROACH,  { 450,  331,    50},   {0x00cd, 0x00000000}},
  { "B-h'",                 LPR_SLOWAPPROACH,  { 558,  63,     50},   {0x008a, 0x00200000}},
  { "B-i'",                 LPR_SLOWAPPROACH,  { 402,  -185,   50},   {0x0096, 0x80000000}},
};

#define NR_POINTS (sizeof (points) / sizeof (points[0]))


static char * point_desc(int point) {
    static char buf[128];

    if (point < 0 || point >= NR_POINTS) {
        strcpy(buf, "<not found>");
        return buf;
    }
    strcpy(buf, points[point].comment);
    
    if (GET(s_wmap, point).flags & LPR_ROUTEONLY) {
        strcat(buf, " (rt/o)");
    }
        
    return buf;
}

static void LS_InitPathFinder(void);
static void LS_InitPathFinder(void) {
  ls_initialized = true;
  INIT(s_wmap);
  INIT(s_regs);
  int i;
  for (i=0; i<6; ++i) {
    PUSH_BACK(s_regs, regions[i]);
  }

  makeWaypointTable(&s_wmap, &s_regs, NR_POINTS, points);
}

static int print_counter = 0;

static double sqr(double d) {
    return d*d;
}

static double normalize_dir(double theta) {
    while (theta < -180) {
        theta += 360;
    }
    while (theta > 180) {
        theta -= 360;
    }
    return theta;
}


//
// We're using a discriminated union, with some common distribution
// maintenance variables.

// Union discriminator
typedef enum behavior_type_e {
    PB_CHASE,    // just chase people and shoot
    PB_PLATFORM, // hit a target platform, then shoot there
    PB_HEALTH,   // get the nearest health powerup
    PB_POWERUP,  // get weapons and/or armor
    PB_LAST_VALUE
} behavior_type_t;


// each behavior will have more data, but this at the front.
typedef struct behavior_s {
    behavior_type_t type;
    int count;
    float proportion;
} behavior_t;


static behavior_t s_behavior_map [] = {
    { PB_CHASE,      0.4, 0},
    { PB_PLATFORM,   0.3, 0},
    { PB_HEALTH,     0.1, 0},
    { PB_POWERUP,    0.2, 0},
    { PB_LAST_VALUE, 0.0, 0}
};

static int s_behavior_counter;

//
// Behavior Decision Engine
//
behavior_t next_behavior () {
    // find most underrepresented behavior and return it.
    int i;
    double counter = s_behavior_counter;
    s_behavior_counter++;
    for (i=0; i < PB_LAST_VALUE; ++i) {
        if ( (((double) s_behavior_map[i].count) / counter) 
             < s_behavior_map[i].proportion) {
            s_behavior_map[i].count++;
            return s_behavior_map[i].type;
        }
    }
}


usercmd_t  LS_CreateCmd( void ) {
	usercmd_t cmd;
	vec3_t		oldAngles;
	extern void CL_AdjustAngles(void);
	extern void CL_FinishMove( usercmd_t *cmd );
	
	if (!ls_initialized) {
        Com_Printf("LS: Initializing Path Finder\n");
        LS_InitPathFinder();
        Com_Printf("LS: Done.\n");
	}

	VectorCopy( cl.viewangles, oldAngles );

	// keyboard angle adjustment
	CL_AdjustAngles ();
	Com_Memset( &cmd, 0, sizeof( cmd ) );

    pos_vec_conversion_t here;
    VectorCopy(cl.snap.ps.origin, here.vec);

    /* NOTE: Behavioral code goes here. */

	qboolean go_right = true;
	if (here.pos.y > 500) {
	  go_right = false;
	}
	
    // Our forward velocity.  We may change this, depending upon the
    // destination point, its flags, and our distance from it.    These are
    // proportions, scaled against our desired acceleration vector.
    const float full_forward_scale = 1.0;
    const float slow_forward_scale = 0.2;
    const float jump_forward_scale = 0.1; // forward speed on a jump platform
    
    const float closenuff_to_dest = 30.0; // 50u from the destination is
                                          // close enough.

    const int  repath_interval_ms = 30000;
    float forward_scale = full_forward_scale;

    //
    // Get our current waypoint.
    //

    // refresh the path every 1500 msec, or when we're actually pretty close
    // to our destination.
    pos_vec_conversion_t dest;
    dest.pos = go_right? hardcoded_dest_right : hardcoded_dest_left;
    
    qboolean newpath = qfalse;
    if (s_lastpath_time == 0 || cl.serverTime - repath_interval_ms > s_lastpath_time) 
        newpath = qtrue;

    if (!newpath) {
        if (Distance(here.vec, dest.vec) < closenuff_to_dest)
            newpath = qtrue;
    }


    if (newpath) {
        if (s_lastpath_time == 0) {
            INIT(s_path);
        }
        s_lastpath_time = cl.serverTime;
        Com_Printf("LS: Choosing new path (t=%d)\n", s_lastpath_time);

        // choose our destination

        CLEAR(s_path);
        do {
            pathFind(&s_path, here.pos, dest.pos, &s_wmap, &s_regs);
            go_right ^= 1;
            dest.pos = go_right? hardcoded_dest_right : hardcoded_dest_left;
        } while (SIZE(s_path) < 2);
        s_waypoint_number = 0;
    }

    // for convenience, save our position locally.
    vec3_t position;
    VectorCopy(cl.snap.ps.origin, position);

    int waypoint_index = GET(s_path,s_waypoint_number);
    int waypoint_flags = points[waypoint_index].flags;

    // We may be closer to a further-on waypoint than our current one.
    // >> How does this interact with the 'route-only' flag?  We won't
    // >> skip the old waypoint if the new one is route-only.
    pos_vec_conversion_t wp0, wp1;
    wp0.pos = points[GET(s_path, s_waypoint_number)].p;
    wp1.pos = points[GET(s_path, s_waypoint_number+1)].p;

    if (waypoint_flags & LPR_SLOWAPPROACH) {
        forward_scale = slow_forward_scale;
    }

    if (waypoint_flags & LPR_JUMP)
        forward_scale = jump_forward_scale;
    
    vec3_t next_pos;
    VectorCopy(wp0.vec, next_pos);

    // We may be in between waypoint offsets 0 and 1 right now.  If we're
    // closer to waypoint offset 1 than 0, make 1 our current destination,
    // and adjust our speed.
    float dist_w0 = Distance(wp0.vec, wp1.vec);
    float dist_w1 = Distance(position, wp1.vec);
    while ( s_waypoint_number+1 < SIZE(s_path) 
            && (dist_w0 > dist_w1
                || Distance(position, next_pos) < closenuff_to_dest)) {
        s_waypoint_number++;
        waypoint_index = GET(s_path, s_waypoint_number);
        waypoint_flags = points[waypoint_index].flags;
        VectorCopy(wp1.vec, next_pos);
        Com_Printf("LS: Moving along, we're closer to our next waypoint(%s: %f) "
                   "than current\n",
                   points[waypoint_index].comment, dist_w1);

        wp0.pos = points[GET(s_path, s_waypoint_number)].p;
        wp1.pos = points[GET(s_path, s_waypoint_number+1)].p;
        dist_w0 = Distance(wp0.vec, wp1.vec);
        dist_w1 = Distance(position, wp1.vec);


        // interpolate speeds between the proper speeds of the new
        // waypoint.
        float new_wp_speed = waypoint_flags & LPR_SLOWAPPROACH? 
            slow_forward_scale : full_forward_scale;

        if (waypoint_flags & LPR_JUMP)
            new_wp_speed = jump_forward_scale;

        forward_scale = new_wp_speed
            + ((forward_scale - new_wp_speed) * (dist_w1 / dist_w0));

    }

    // Scale our velocity to minimize the error between our intended route
    // and our actual path.
    double cur_speed = VectorLength(cl.snap.ps.velocity);
    vec3_t route;
    VectorSubtract(next_pos, here.vec, route);
    double projected_route = 
        DotProduct(cl.snap.ps.origin, route) / VectorLength(cl.snap.ps.origin);

    vec3_t velocity;
    double len_origin = VectorLength(cl.snap.ps.origin);
    VectorScale(cl.snap.ps.origin, ((len_origin - projected_route)/len_origin), velocity);
    vec3_t accel;
    VectorSubtract(velocity, cl.snap.ps.origin, accel);

    // now calculate our acceleration across our current heading.
    double forward_speed = 
        DotProduct(accel, cl.snap.ps.origin) / VectorLength(cl.snap.ps.origin);
    

    //
    // Now compare our desired forward velocity with our current velocity,
    // and do the delta. The forwardmove is a proportion [-1..1] (scaled to a
    // granularity of 256) of the full delta-velocity to apply.

    // cl.snap.ps.viewangles[YAW] has the current direction.  Figure out
	// which way I want to go, and go from there.  Scale to 0->2**16-1, and
	// feed in to cmd.angles[1].
	vec3_t move_result;
	vec3_t direction;
	VectorSubtract(next_pos, cl.snap.ps.origin, move_result);
	vectoangles(move_result, direction);

    double yangle = direction[YAW];
    
    // inefficient and sloppy, but it'll work.
    if (yangle < 0.0 || yangle > 360.0) {
        while (yangle <0) yangle += 360.0;
        while (yangle >360.0) yangle -= 360.0;
    }

    double normalized_dir_yaw = normalize_dir(direction[YAW]);

    // a cheap approximation of what I was doing with forward_speed, but I
    // didn't know the units passed by forward_move terribly well.
    if (fabs(normalized_dir_yaw) > 90.0) {
        // we have to turn around, let's slow down and worry about that.
        cmd.forwardmove = 0; 
    } else {
        cmd.forwardmove = 32;
    }
    
    cmd.rightmove = 0; 

    // TODO: add back in after I'm sure the angles are right.
    //    cmd.forwardmove = 32; //ClampChar(1.5 * (forward_scale *
    //    forward_speed));

    cmd.angles[0] = 0;
    cmd.angles[1] = yangle /360.0 * 65536.0;
    cmd.angles[2] = 0;


    if (print_counter % 64 == 0) {
        //        int closest_point = closestWayPoint(here.pos, &s_wmap, &s_regs);

        /*        Com_Printf("\n\nWe are at: (%6.2f, %6.2f, %6.2f), %f from next position\n",
                   here.pos.x, here.pos.y, here.pos.z,
                   Distance(here.vec, next_pos));  
        Com_Printf("cmd: angles(%d,%d,%d), f-%d, r-%d, u-%d\n",
                   cmd.angles[0], cmd.angles[1], cmd.angles[2],
                   cmd.forwardmove, cmd.rightmove, cmd.upmove);
        Com_Printf("At %s, heading for %s.  Current heading: %f, Desired: %f; Path: ",
                   points[closest_point].comment,
                   points[waypoint_index].comment,
                   cl.snap.ps.viewangles[YAW],
                   normalized_dir_yaw);

        int i;
        for (i=0; i<SIZE(s_path); ++i) {
            Com_Printf("%s ", points[GET(s_path, i)].comment);
        }
        Com_Printf("\n"); 

        Com_Printf("Current Theta is %6.2f\n", theta);
        Com_Printf("Current Yaw is %6.2f\n", normalized_dir_yaw); */
        //        Com_Printf("Forward scale: %6.3f;   Speed: %6.3f\n",
        //        forward_scale, forward_speed); 
        //        Com_Printf("
    /*        Com_Printf("Going for (%6.2f,%6.2f,%6.2f)->(%6.2f,%6.2f,%6.2f)\n", 
                   here.pos.x, here.pos.y, here.pos.z,
                   next_pos[0], next_pos[1], next_pos[2]); */
    }

    print_counter++;

	// check to make sure the angles haven't wrapped
	if ( cl.viewangles[PITCH] - oldAngles[PITCH] > 90 ) {
		cl.viewangles[PITCH] = oldAngles[PITCH] + 90;
	} else if ( oldAngles[PITCH] - cl.viewangles[PITCH] > 90 ) {
		cl.viewangles[PITCH] = oldAngles[PITCH] - 90;
	} 

	// store out the final values
    //	CL_FinishMove( &cmd );

    // from CL_FinishMove:
    cmd.weapon = cl.cgameUserCmdValue;
    cmd.serverTime = cl.serverTime;
    if (print_counter & 1) {
        cmd.buttons = 0x801;
    } else {
        cmd.buttons = 0;
    }
	return cmd;	
}

/*****************************************************************************
 * BOTLIB-CLIENT INTEGRATION SUPPORT
 *****************************************************************************/
intptr_t LS_GameSystemCalls(intptr_t *args) {
  return 0;
  /*
  // modeled after SV_GameSystemCalls().
  switch( args[0] ) {
  case G_PRINT:
  Com_Printf( "%s", (const char*)VMA(1) );
  return 0;
  case G_ERROR:
  Com_Error( ERR_DROP, "%s", (const char*)VMA(1) );
  return 0;
  case G_MILLISECONDS:
  return Sys_Milliseconds();
  case G_CVAR_REGISTER:
  Cvar_Register( VMA(1), VMA(2), VMA(3), args[4] ); 
  return 0;
  case G_CVAR_UPDATE:
  Cvar_Update( VMA(1) );
  return 0;
  case G_CVAR_SET:
  Cvar_Set( (const char *)VMA(1), (const char *)VMA(2) );
  return 0;
  case G_CVAR_VARIABLE_INTEGER_VALUE:
  return Cvar_VariableIntegerValue( (const char *)VMA(1) );
  case G_CVAR_VARIABLE_STRING_BUFFER:
  Cvar_VariableStringBuffer( VMA(1), VMA(2), args[3] );
  return 0;
  case G_ARGC:
  return Cmd_Argc();
  case G_ARGV:
  Cmd_ArgvBuffer( args[1], VMA(2), args[3] );
  return 0;
  case G_SEND_CONSOLE_COMMAND:
  Cbuf_ExecuteText( args[1], VMA(2) );
  return 0;

  case G_FS_FOPEN_FILE:
  return FS_FOpenFileByMode( VMA(1), VMA(2), args[3] );
  case G_FS_READ:
  FS_Read2( VMA(1), args[2], args[3] );
  return 0;
  case G_FS_WRITE:
  FS_Write( VMA(1), args[2], args[3] );
  return 0;
  case G_FS_FCLOSE_FILE:
  FS_FCloseFile( args[1] );
  return 0;
  case G_FS_GETFILELIST:
  return FS_GetFileList( VMA(1), VMA(2), VMA(3), args[4] );
  case G_FS_SEEK:
  return FS_Seek( args[1], args[2], args[3] );

  case G_LOCATE_GAME_DATA:
  SV_LocateGameData( VMA(1), args[2], args[3], VMA(4), args[5] );
  return 0;
  case G_DROP_CLIENT:
  SV_GameDropClient( args[1], VMA(2) );
  return 0;
  case G_AREAS_CONNECTED:
  return CM_AreasConnected( args[1], args[2] );

  case G_GET_ENTITY_TOKEN:
  {
  const char    *s;

  s = COM_Parse( &sv.entityParsePoint );
  Q_strncpyz( VMA(1), s, args[2] );
  if ( !sv.entityParsePoint && !s[0] ) {
  return qfalse;
  } else {
  return qtrue;
  }
  }

  case G_DEBUG_POLYGON_CREATE:
  return ls_DebugPolygonCreate( args[1], args[2], VMA(3) );
  case G_DEBUG_POLYGON_DELETE:
  ls_DebugPolygonDelete( args[1] );
  return 0;
  case G_REAL_TIME:
  return Com_RealTime( VMA(1) );
  case G_SNAPVECTOR:
  Sys_SnapVector( VMA(1) );
  return 0;

  //====================================

  case BOTLIB_SETUP:
  return SV_BotLibSetup();
  case BOTLIB_SHUTDOWN:
  return SV_BotLibShutdown();
  case BOTLIB_LIBVAR_SET:
  return s_botlib->BotLibVarSet( VMA(1), VMA(2) );
  case BOTLIB_LIBVAR_GET:
  return s_botlib->BotLibVarGet( VMA(1), VMA(2), args[3] );

  case BOTLIB_PC_ADD_GLOBAL_DEFINE:
  return s_botlib->PC_AddGlobalDefine( VMA(1) );
  case BOTLIB_PC_LOAD_SOURCE:
  return s_botlib->PC_LoadSourceHandle( VMA(1) );
  case BOTLIB_PC_FREE_SOURCE:
  return s_botlib->PC_FreeSourceHandle( args[1] );
  case BOTLIB_PC_READ_TOKEN:
  return s_botlib->PC_ReadTokenHandle( args[1], VMA(2) );
  case BOTLIB_PC_SOURCE_FILE_AND_LINE:
  return s_botlib->PC_SourceFileAndLine( args[1], VMA(2), VMA(3) );

  case BOTLIB_START_FRAME:
  return s_botlib->BotLibStartFrame( VMF(1) );
  case BOTLIB_LOAD_MAP:
  return s_botlib->BotLibLoadMap( VMA(1) );
  case BOTLIB_UPDATENTITY:
  return s_botlib->BotLibUpdateEntity( args[1], VMA(2) );
  case BOTLIB_TEST:
  return s_botlib->Test( args[1], VMA(2), VMA(3), VMA(4) );

  case BOTLIB_AAS_BBOX_AREAS:
  return s_botlib->aas.AAS_BBoxAreas( VMA(1), VMA(2), VMA(3), args[4] );
  case BOTLIB_AAS_AREA_INFO:
  return s_botlib->aas.AAS_AreaInfo( args[1], VMA(2) );
  case BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL:
  return s_botlib->aas.AAS_AlternativeRouteGoals( VMA(1), args[2], VMA(3), args[4], args[5], VMA(6), args[7], args[8] );
  case BOTLIB_AAS_ENTITY_INFO:
  s_botlib->aas.AAS_EntityInfo( args[1], VMA(2) );
  return 0;

  case BOTLIB_AAS_INITIALIZED:
  return s_botlib->aas.AAS_Initialized();
  case BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX:
  s_botlib->aas.AAS_PresenceTypeBoundingBox( args[1], VMA(2), VMA(3) );
  return 0;
  case BOTLIB_AAS_TIME:
  return FloatAsInt( s_botlib->aas.AAS_Time() );

  case BOTLIB_AAS_POINT_AREA_NUM:
  return s_botlib->aas.AAS_PointAreaNum( VMA(1) );
  case BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX:
  return s_botlib->aas.AAS_PointReachabilityAreaIndex( VMA(1) );
  case BOTLIB_AAS_TRACE_AREAS:
  return s_botlib->aas.AAS_TraceAreas( VMA(1), VMA(2), VMA(3), VMA(4), args[5] );

  case BOTLIB_AAS_POINT_CONTENTS:
  return s_botlib->aas.AAS_PointContents( VMA(1) );
  case BOTLIB_AAS_NEXT_BSP_ENTITY:
  return s_botlib->aas.AAS_NextBSPEntity( args[1] );
  case BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY:
  return s_botlib->aas.AAS_ValueForBSPEpairKey( args[1], VMA(2), VMA(3), args[4] );
  case BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY:
  return s_botlib->aas.AAS_VectorForBSPEpairKey( args[1], VMA(2), VMA(3) );
  case BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY:
  return s_botlib->aas.AAS_FloatForBSPEpairKey( args[1], VMA(2), VMA(3) );
  case BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY:
  return s_botlib->aas.AAS_IntForBSPEpairKey( args[1], VMA(2), VMA(3) );

  case BOTLIB_AAS_AREA_REACHABILITY:
  return s_botlib->aas.AAS_AreaReachability( args[1] );

  case BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA:
  return s_botlib->aas.AAS_AreaTravelTimeToGoalArea( args[1], VMA(2), args[3], args[4] );
  case BOTLIB_AAS_ENABLE_ROUTING_AREA:
  return s_botlib->aas.AAS_EnableRoutingArea( args[1], args[2] );
  case BOTLIB_AAS_PREDICT_ROUTE:
  return s_botlib->aas.AAS_PredictRoute( VMA(1), args[2], VMA(3), args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11] );

  case BOTLIB_AAS_SWIMMING:
  return s_botlib->aas.AAS_Swimming( VMA(1) );
  case BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT:
  return s_botlib->aas.AAS_PredictClientMovement( VMA(1), args[2], VMA(3), args[4], args[5],
  VMA(6), VMA(7), args[8], args[9], VMF(10), args[11], args[12], args[13] );

  case BOTLIB_EA_SAY:
  s_botlib->ea.EA_Say( args[1], VMA(2) );
  return 0;
  case BOTLIB_EA_SAY_TEAM:
  s_botlib->ea.EA_SayTeam( args[1], VMA(2) );
  return 0;
  case BOTLIB_EA_COMMAND:
  s_botlib->ea.EA_Command( args[1], VMA(2) );
  return 0;

  case BOTLIB_EA_ACTION:
  s_botlib->ea.EA_Action( args[1], args[2] );
  break;
  case BOTLIB_EA_GESTURE:
  s_botlib->ea.EA_Gesture( args[1] );
  return 0;
  case BOTLIB_EA_TALK:
  s_botlib->ea.EA_Talk( args[1] );
  return 0;
  case BOTLIB_EA_ATTACK:
  s_botlib->ea.EA_Attack( args[1] );
  return 0;
  case BOTLIB_EA_USE:
  s_botlib->ea.EA_Use( args[1] );
  return 0;
  case BOTLIB_EA_RESPAWN:
  s_botlib->ea.EA_Respawn( args[1] );
  return 0;
  case BOTLIB_EA_CROUCH:
  s_botlib->ea.EA_Crouch( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_UP:
  s_botlib->ea.EA_MoveUp( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_DOWN:
  s_botlib->ea.EA_MoveDown( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_FORWARD:
  s_botlib->ea.EA_MoveForward( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_BACK:
  s_botlib->ea.EA_MoveBack( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_LEFT:
  s_botlib->ea.EA_MoveLeft( args[1] );
  return 0;
  case BOTLIB_EA_MOVE_RIGHT:
  s_botlib->ea.EA_MoveRight( args[1] );
  return 0;

  case BOTLIB_EA_SELECT_WEAPON:
  s_botlib->ea.EA_SelectWeapon( args[1], args[2] );
  return 0;
  case BOTLIB_EA_JUMP:
  s_botlib->ea.EA_Jump( args[1] );
  return 0;
  case BOTLIB_EA_DELAYED_JUMP:
  s_botlib->ea.EA_DelayedJump( args[1] );
  return 0;
  case BOTLIB_EA_MOVE:
  s_botlib->ea.EA_Move( args[1], VMA(2), VMF(3) );
  return 0;
  case BOTLIB_EA_VIEW:
  s_botlib->ea.EA_View( args[1], VMA(2) );
  return 0;

  case BOTLIB_EA_END_REGULAR:
  s_botlib->ea.EA_EndRegular( args[1], VMF(2) );
  return 0;
  case BOTLIB_EA_GET_INPUT:
  s_botlib->ea.EA_GetInput( args[1], VMF(2), VMA(3) );
  return 0;
  case BOTLIB_EA_RESET_INPUT:
  s_botlib->ea.EA_ResetInput( args[1] );
  return 0;

  case BOTLIB_AI_LOAD_CHARACTER:
  return s_botlib->ai.BotLoadCharacter( VMA(1), VMF(2) );
  case BOTLIB_AI_FREE_CHARACTER:
  s_botlib->ai.BotFreeCharacter( args[1] );
  return 0;
  case BOTLIB_AI_CHARACTERISTIC_FLOAT:
  return FloatAsInt( s_botlib->ai.Characteristic_Float( args[1], args[2] ) );
  case BOTLIB_AI_CHARACTERISTIC_BFLOAT:
  return FloatAsInt( s_botlib->ai.Characteristic_BFloat( args[1], args[2], VMF(3), VMF(4) ) );
  case BOTLIB_AI_CHARACTERISTIC_INTEGER:
  return s_botlib->ai.Characteristic_Integer( args[1], args[2] );
  case BOTLIB_AI_CHARACTERISTIC_BINTEGER:
  return s_botlib->ai.Characteristic_BInteger( args[1], args[2], args[3], args[4] );
  case BOTLIB_AI_CHARACTERISTIC_STRING:
  s_botlib->ai.Characteristic_String( args[1], args[2], VMA(3), args[4] );
  return 0;

  case BOTLIB_AI_ALLOC_CHAT_STATE:
  return s_botlib->ai.BotAllocChatState();
  case BOTLIB_AI_FREE_CHAT_STATE:
  s_botlib->ai.BotFreeChatState( args[1] );
  return 0;
  case BOTLIB_AI_QUEUE_CONSOLE_MESSAGE:
  s_botlib->ai.BotQueueConsoleMessage( args[1], args[2], VMA(3) );
  return 0;
  case BOTLIB_AI_REMOVE_CONSOLE_MESSAGE:
  s_botlib->ai.BotRemoveConsoleMessage( args[1], args[2] );
  return 0;
  case BOTLIB_AI_NEXT_CONSOLE_MESSAGE:
  return s_botlib->ai.BotNextConsoleMessage( args[1], VMA(2) );
  case BOTLIB_AI_NUM_CONSOLE_MESSAGE:
  return s_botlib->ai.BotNumConsoleMessages( args[1] );
  case BOTLIB_AI_INITIAL_CHAT:
  s_botlib->ai.BotInitialChat( args[1], VMA(2), args[3], VMA(4), VMA(5), VMA(6), VMA(7), VMA(8), VMA(9), VMA(10), VMA(11) );
  return 0;
  case BOTLIB_AI_NUM_INITIAL_CHATS:
  return s_botlib->ai.BotNumInitialChats( args[1], VMA(2) );
  case BOTLIB_AI_REPLY_CHAT:
  return s_botlib->ai.BotReplyChat( args[1], VMA(2), args[3], args[4], VMA(5), VMA(6), VMA(7), VMA(8), VMA(9), VMA(10), VMA(11), VMA(12) );
  case BOTLIB_AI_CHAT_LENGTH:
  return s_botlib->ai.BotChatLength( args[1] );
  case BOTLIB_AI_ENTER_CHAT:
  s_botlib->ai.BotEnterChat( args[1], args[2], args[3] );
  return 0;
  case BOTLIB_AI_GET_CHAT_MESSAGE:
  s_botlib->ai.BotGetChatMessage( args[1], VMA(2), args[3] );
  return 0;
  case BOTLIB_AI_STRING_CONTAINS:
  return s_botlib->ai.StringContains( VMA(1), VMA(2), args[3] );
  case BOTLIB_AI_FIND_MATCH:
  return s_botlib->ai.BotFindMatch( VMA(1), VMA(2), args[3] );
  case BOTLIB_AI_MATCH_VARIABLE:
  s_botlib->ai.BotMatchVariable( VMA(1), args[2], VMA(3), args[4] );
  return 0;
  case BOTLIB_AI_UNIFY_WHITE_SPACES:
  s_botlib->ai.UnifyWhiteSpaces( VMA(1) );
  return 0;
  case BOTLIB_AI_REPLACE_SYNONYMS:
  s_botlib->ai.BotReplaceSynonyms( VMA(1), args[2] );
  return 0;
  case BOTLIB_AI_LOAD_CHAT_FILE:
  return s_botlib->ai.BotLoadChatFile( args[1], VMA(2), VMA(3) );
  case BOTLIB_AI_SET_CHAT_GENDER:
  s_botlib->ai.BotSetChatGender( args[1], args[2] );
  return 0;
  case BOTLIB_AI_SET_CHAT_NAME:
  s_botlib->ai.BotSetChatName( args[1], VMA(2), args[3] );
  return 0;

  case BOTLIB_AI_RESET_GOAL_STATE:
  s_botlib->ai.BotResetGoalState( args[1] );
  return 0;
  case BOTLIB_AI_RESET_AVOID_GOALS:
  s_botlib->ai.BotResetAvoidGoals( args[1] );
  return 0;
  case BOTLIB_AI_REMOVE_FROM_AVOID_GOALS:
  s_botlib->ai.BotRemoveFromAvoidGoals( args[1], args[2] );
  return 0;
  case BOTLIB_AI_PUSH_GOAL:
  s_botlib->ai.BotPushGoal( args[1], VMA(2) );
  return 0;
  case BOTLIB_AI_POP_GOAL:
  s_botlib->ai.BotPopGoal( args[1] );
  return 0;
  case BOTLIB_AI_EMPTY_GOAL_STACK:
  s_botlib->ai.BotEmptyGoalStack( args[1] );
  return 0;
  case BOTLIB_AI_DUMP_AVOID_GOALS:
  s_botlib->ai.BotDumpAvoidGoals( args[1] );
  return 0;
  case BOTLIB_AI_DUMP_GOAL_STACK:
  s_botlib->ai.BotDumpGoalStack( args[1] );
  return 0;
  case BOTLIB_AI_GOAL_NAME:
  s_botlib->ai.BotGoalName( args[1], VMA(2), args[3] );
  return 0;
  case BOTLIB_AI_GET_TOP_GOAL:
  return s_botlib->ai.BotGetTopGoal( args[1], VMA(2) );
  case BOTLIB_AI_GET_SECOND_GOAL:
  return s_botlib->ai.BotGetSecondGoal( args[1], VMA(2) );
  case BOTLIB_AI_CHOOSE_LTG_ITEM:
  return s_botlib->ai.BotChooseLTGItem( args[1], VMA(2), VMA(3), args[4] );
  case BOTLIB_AI_CHOOSE_NBG_ITEM:
  return s_botlib->ai.BotChooseNBGItem( args[1], VMA(2), VMA(3), args[4], VMA(5), VMF(6) );
  case BOTLIB_AI_TOUCHING_GOAL:
  return s_botlib->ai.BotTouchingGoal( VMA(1), VMA(2) );
  case BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE:
  return s_botlib->ai.BotItemGoalInVisButNotVisible( args[1], VMA(2), VMA(3), VMA(4) );
  case BOTLIB_AI_GET_LEVEL_ITEM_GOAL:
  return s_botlib->ai.BotGetLevelItemGoal( args[1], VMA(2), VMA(3) );
  case BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL:
  return s_botlib->ai.BotGetNextCampSpotGoal( args[1], VMA(2) );
  case BOTLIB_AI_GET_MAP_LOCATION_GOAL:
  return s_botlib->ai.BotGetMapLocationGoal( VMA(1), VMA(2) );
  case BOTLIB_AI_AVOID_GOAL_TIME:
  return FloatAsInt( s_botlib->ai.BotAvoidGoalTime( args[1], args[2] ) );
  case BOTLIB_AI_SET_AVOID_GOAL_TIME:
  s_botlib->ai.BotSetAvoidGoalTime( args[1], args[2], VMF(3));
  return 0;
  case BOTLIB_AI_INIT_LEVEL_ITEMS:
  s_botlib->ai.BotInitLevelItems();
  return 0;
  case BOTLIB_AI_UPDATE_ENTITY_ITEMS:
  s_botlib->ai.BotUpdateEntityItems();
  return 0;
  case BOTLIB_AI_LOAD_ITEM_WEIGHTS:
  return s_botlib->ai.BotLoadItemWeights( args[1], VMA(2) );
  case BOTLIB_AI_FREE_ITEM_WEIGHTS:
  s_botlib->ai.BotFreeItemWeights( args[1] );
  return 0;
  case BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC:
  s_botlib->ai.BotInterbreedGoalFuzzyLogic( args[1], args[2], args[3] );
  return 0;
  case BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC:
  s_botlib->ai.BotSaveGoalFuzzyLogic( args[1], VMA(2) );
  return 0;
  case BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC:
  s_botlib->ai.BotMutateGoalFuzzyLogic( args[1], VMF(2) );
  return 0;
  case BOTLIB_AI_ALLOC_GOAL_STATE:
  return s_botlib->ai.BotAllocGoalState( args[1] );
  case BOTLIB_AI_FREE_GOAL_STATE:
  s_botlib->ai.BotFreeGoalState( args[1] );
  return 0;

  case BOTLIB_AI_RESET_MOVE_STATE:
  s_botlib->ai.BotResetMoveState( args[1] );
  return 0;
  case BOTLIB_AI_ADD_AVOID_SPOT:
  s_botlib->ai.BotAddAvoidSpot( args[1], VMA(2), VMF(3), args[4] );
  return 0;
  case BOTLIB_AI_MOVE_TO_GOAL:
  s_botlib->ai.BotMoveToGoal( VMA(1), args[2], VMA(3), args[4] );
  return 0;
  case BOTLIB_AI_MOVE_IN_DIRECTION:
  return s_botlib->ai.BotMoveInDirection( args[1], VMA(2), VMF(3), args[4] );
  case BOTLIB_AI_RESET_AVOID_REACH:
  s_botlib->ai.BotResetAvoidReach( args[1] );
  return 0;
  case BOTLIB_AI_RESET_LAST_AVOID_REACH:
  s_botlib->ai.BotResetLastAvoidReach( args[1] );
  return 0;
  case BOTLIB_AI_REACHABILITY_AREA:
  return s_botlib->ai.BotReachabilityArea( VMA(1), args[2] );
  case BOTLIB_AI_MOVEMENT_VIEW_TARGET:
  return s_botlib->ai.BotMovementViewTarget( args[1], VMA(2), args[3], VMF(4), VMA(5) );
  case BOTLIB_AI_PREDICT_VISIBLE_POSITION:
  return s_botlib->ai.BotPredictVisiblePosition( VMA(1), args[2], VMA(3), args[4], VMA(5) );
  case BOTLIB_AI_ALLOC_MOVE_STATE:
  return s_botlib->ai.BotAllocMoveState();
  case BOTLIB_AI_FREE_MOVE_STATE:
  s_botlib->ai.BotFreeMoveState( args[1] );
  return 0;
  case BOTLIB_AI_INIT_MOVE_STATE:
  s_botlib->ai.BotInitMoveState( args[1], VMA(2) );
  return 0;

  case BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON:
  return s_botlib->ai.BotChooseBestFightWeapon( args[1], VMA(2) );
  case BOTLIB_AI_GET_WEAPON_INFO:
  s_botlib->ai.BotGetWeaponInfo( args[1], args[2], VMA(3) );
  return 0;
  case BOTLIB_AI_LOAD_WEAPON_WEIGHTS:
  return s_botlib->ai.BotLoadWeaponWeights( args[1], VMA(2) );
  case BOTLIB_AI_ALLOC_WEAPON_STATE:
  return s_botlib->ai.BotAllocWeaponState();
  case BOTLIB_AI_FREE_WEAPON_STATE:
  s_botlib->ai.BotFreeWeaponState( args[1] );
  return 0;
  case BOTLIB_AI_RESET_WEAPON_STATE:
  s_botlib->ai.BotResetWeaponState( args[1] );
  return 0;

  case BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION:
  return s_botlib->ai.GeneticParentsAndChildSelection(args[1], VMA(2), VMA(3), VMA(4), VMA(5));

  case TRAP_MEMSET:
  Com_Memset( VMA(1), args[2], args[3] );
  return 0;

  case TRAP_MEMCPY:
  Com_Memcpy( VMA(1), VMA(2), args[3] );
  return 0;

  case TRAP_STRNCPY:
  strncpy( VMA(1), VMA(2), args[3] );
  return args[1];

  case TRAP_SIN:
  return FloatAsInt( sin( VMF(1) ) );

  case TRAP_COS:
  return FloatAsInt( cos( VMF(1) ) );

  case TRAP_ATAN2:
  return FloatAsInt( atan2( VMF(1), VMF(2) ) );

  case TRAP_SQRT:
  return FloatAsInt( sqrt( VMF(1) ) );

  case TRAP_MATRIXMULTIPLY:
  MatrixMultiply( VMA(1), VMA(2), VMA(3) );
  return 0;

  case TRAP_ANGLEVECTORS:
  AngleVectors( VMA(1), VMA(2), VMA(3), VMA(4) );
  return 0;

  case TRAP_PERPENDICULARVECTOR:
  PerpendicularVector( VMA(1), VMA(2) );
  return 0;

  case TRAP_FLOOR:
  return FloatAsInt( floor( VMF(1) ) );

  case TRAP_CEIL:
  return FloatAsInt( ceil( VMF(1) ) );


  // OPEN QUESTIONS
  case BOTLIB_GET_SNAPSHOT_ENTITY:
  return SV_BotGetSnapshotEntity( args[1], args[2] );
  case BOTLIB_GET_CONSOLE_MESSAGE:
  //return SV_BotGetConsoleMessage( args[1], VMA(2), args[3] );
  return qfalse;
  case BOTLIB_USER_COMMAND: {
  // an approximation.  The original code was from SV_ClientThink().
  VM_Call( gvm, GAME_CLIENT_THINK, args[1]);
  }             

                
  // UNIMPLEMENTED SERVER-SIDE APIs
  case G_SEND_SERVER_COMMAND:
  case G_LINKENTITY:
  case G_UNLINKENTITY:
  case G_ENTITIES_IN_BOX:
  case G_ENTITY_CONTACT:
  case G_ENTITY_CONTACTCAPSULE:
  case G_TRACE:
  case G_TRACECAPSULE:
  case G_POINT_CONTENTS:
  case G_SET_BRUSH_MODEL:
  case G_IN_PVS:
  case G_IN_PVS_IGNORE_PORTALS:
  case G_SET_CONFIGSTRING:
  case G_GET_CONFIGSTRING:
  case G_SET_USERINFO:
  case G_GET_USERINFO:
  case G_GET_SERVERINFO:
  case G_ADJUST_AREA_PORTAL_STATE:
  case G_BOT_ALLOCATE_CLIENT:
  case G_BOT_FREE_CLIENT:
  case G_GET_USERCMD:
  default:
  Com_Error( ERR_DROP,
  "Bad game system trap: %ld",
  // really? long int?
  (long int) args[0] );
  }
  return -1;    
  */
  return -1;
}

void LS_SetPointers(struct clientActive_s *client_state,
                    struct clientStatic_s *client_static) {
    if (client_state) {
        s_cl = (clientActive_t*) client_state;
    }

    if (client_static) {
        s_cls = (clientStatic_t*) client_static;
    }
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
  assert(s_botlib);     // somehow we end up with a zero import.
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
  int   i;

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

//static double sqr (double x) { return x * x; }
static double min (double a, double b) { return a<b?a:b; }

void ls_trace(bsp_trace_t               *bsptrace,
              vec3_t                     start,
              vec3_t                     mins,
              vec3_t                     maxs,
              vec3_t                     end,
              int                                passent,
              int                                contentmask) {
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
      /*                        if (sg_compare(x, all[i].min[0], maxs[0])
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
    VectorCopy(trace.endpos, bsptrace->endpos);
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
  int           leafnum;
  int           cluster;
  int           area1, area2;
  byte  *mask;

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
    return qfalse;              // a door blocks sight
  return qtrue;
}
