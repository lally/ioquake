#ifndef INCLUDE_ASTAR_H
#define INCLUDE_ASTAR_H
#include <vector>
using namespace std;
struct position {
  float x,y;
  bool operator==(const position& other) {
    return x == other.x && y == other.y;
  } 
};

struct region {
  position topleft, bottomright;
};

typedef vector<region> region_map_t;

// Will vector-subtract iff the two points
// are in the same region.  Otherwise, will
// return INFINITY. 
double distance(const position& a, 
		const position& b,
		region_map_t& regs);

const int MAX_WAYPOINTS = 32;
typedef int bitmap_t;

struct waypoint {
  position pos;
  double distances[MAX_WAYPOINTS];
  // use INFINITY for unreachable positions.
};

typedef  vector<waypoint> waypoint_map_t;

struct waypoint_init {
  const char *comment;
  position p;
  bitmap_t reachable_bitmap;
};

bool makeWaypointTable(waypoint_map_t *dest,
		       const region_map_t& regs,
		       int nwaypoints,
		       const waypoint_init* inits);

// returns the number of non-infinity values.
void sortedWaypoints(vector<int> *dest,
		     position pos,
		     const waypoint_map_t& map,
		     const region_map_t& regs);


// from here, return whether we have a path from
// 'pos' to 'dest'.
bool pathFind(vector<int> *destpath,
	      position pos,
	      position dest,
	      const waypoint_map_t& map, 
	      const region_map_t& regs);
		    
#endif
