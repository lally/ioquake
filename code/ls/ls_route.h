#ifndef INCLUDE_ASTAR_H
#define INCLUDE_ASTAR_H
#include "vector.h"
#include "../qcommon/q_shared.h"

typedef enum _bool { false, true } bool;


struct position {
  float x,y,z;
};

struct region {
  // note: bottomleft has the the lower X, lower Y, and lower Z.
  struct position bottomleft, topright;
};

// Our position types have the same layout, just different types.
// This'll fix that.
typedef union {
    struct position pos;
    vec3_t vec;
} pos_vec_conversion_t;

DEFVECTOR(region_map_t, struct region);


// Will vector-subtract iff the two points
// are in the same region.  Otherwise, will
// return INFINITY. 
double distance(struct position a, 
		struct position b,
		const region_map_t* regs);

#define MAX_WAYPOINTS  (64)
#define INT_BITS (32)
#define CHAR_BITS (8)

//
// Waypoint flags
//

// Don't match this for searching for a point.  It's only to be used
// for routing.
#define LPR_ROUTEONLY (1)

// Slow down when approaching this point.
#define LPR_SLOWAPPROACH (2)


// It's a jump-platform, don't add forward motion
#define LPR_JUMP (3)


typedef int bitmap_t;

struct waypoint {
  struct position pos;
  int flags;
  double distances[MAX_WAYPOINTS];
  // use INFINITY for unreachable positions.
};

DEFVECTOR(waypoint_vec_t, struct waypoint);
DEFVECTOR(int_vec_t, int);


struct waypoint_init {
  const char *comment;
  int flags;
  struct position p;
  bitmap_t reachable_bitmap[2]; //MAX_WAYPOINTS / (CHAR_BITS * sizeof(bitmap_t))];
};

bool makeWaypointTable(waypoint_vec_t *dest,
		       const region_map_t* regs,
		       int nwaypoints,
		       struct waypoint_init* inits);

// returns the number of non-infinity values.
void sortedWaypoints(int_vec_t *dest,
		     int start, int end,
		     const waypoint_vec_t* map,
		     const region_map_t* regs);

int closestWayPoint(struct position pos,
                    const waypoint_vec_t* wmap,
                    const region_map_t* regs);

// from here, return whether we have a path from
// 'pos' to 'dest'.
bool pathFind(int_vec_t *destpath,
	      struct position pos,
	      struct position dest,
	      const waypoint_vec_t* map, 
	      const region_map_t* regs);

		    
#endif
