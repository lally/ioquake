#include "astar.h"
#include <math.h>
#include <assert.h>
#include <algorithm>
#include <stdio.h>

waypoint_init points[] = {
  // sixth nibble:  _, _, _, _
  // fifth nibble:  _, _, _, _
  // fourth nibble: eta 2,1, zeta 2,1
  // third nibble:  epsilon 2, 1, delta 3,2, 
  // second nibble: delta 1, gamma 3,2,1, 
  // first nibble:  beta 2,1, alpha 2,1, 

  // alpha: 0
  { "alpha_1", {7.5, 42.5}, 0x000012 },
  { "alpha_2", {7.5, 55.0}, 0x000081 },

  // beta: 2
  { "beta_1", {30, 72.5},  0x000108 },
  { "beta_2", {32.5, 75},  0x010004 },

  // gamma: 4
  { "gamma_1", {17.5, 42.5}, 0x000061 },
  { "gamma_2", {30, 42.5},   0x001050 },
  { "gamma_3", {42.5, 42.5}, 0x000830 },

  // delta:7 
  { "delta_1", {17.5, 55}, 0x000302 },
  { "delta_2", {30, 57.5}, 0x000284 },
  { "delta_3", {42.5, 55}, 0x000980 },

  // epsilon: 10
  { "epsilon_1", {52.5, 32.5}, 0x002040 },
  { "epsilon_2", {52.5, 42.5}, 0x001200 },

  // zeta: 12
  { "zeta_1", {30, 32.5}, 0x002100 },
  { "zeta_2", {30, 17.5}, 0x005000 },

  // eta: 14
  { "eta_1", {32.5, 5}, 0x00a000 },
  { "eta_2", {30, 7.5}, 0x004008 },
    
  // a null element
  { "null", {50, 25}, 0 }
};
const int nr_points = sizeof (points) / sizeof (points[0]);

static bool within(const position& p,
		   const region& r) {
  return p.x >= r.topleft.x 
    && p.y <= r.topleft.y
    && p.x <= r.bottomright.x
    && p.y >= r.bottomright.y;
}

static double sqr(double f) { 
  return f*f;
}

static inline bool is_set(bitmap_t map, int i) {
  return (map & (1 << i)) != 0;
}

static inline bitmap_t set(bitmap_t map, int i) {
  return map | (1 << i);
}

static inline bool full_set(bitmap_t map) {
  return map == 0xFFFFFFFF;
}

double rawDistance(const position& a, const position& b) {
  return sqrt(sqr(a.x - b.x) + sqr(a.y - b.y));
}

double distance(const position& a, const position& b,
		const vector<region>& regs) {
  // find a region that fits a.
  for (int r=0; r<regs.size(); ++r) {
    if (within(a, regs[r]) && within(b, regs[r])) {
      return rawDistance(a,b);
    }
  }
  return INFINITY;
}

bool makeWaypointTable(waypoint_map_t *dest,
		       const vector<region>& regs,
		       int nwaypoints,
		       const waypoint_init* inits) {
  waypoint init = {{0.0, 0.0}, {INFINITY, INFINITY}};
  assert(dest);
  assert(inits);
  if (nwaypoints >= MAX_WAYPOINTS) 
    return false;
  for (int i=0; i<MAX_WAYPOINTS; ++i) 
    init.distances[i] = INFINITY;

  waypoint_map_t& d = *dest;
  d.clear();
  for (int w=0; w<nwaypoints; w++) {
    d.push_back(init);
    d[w].pos = inits[w].p;
    for (int r=0; r<MAX_WAYPOINTS; ++r) {
      if(is_set(inits[w].reachable_bitmap, r)) {
	d[w].distances[r] = rawDistance(d[w].pos, inits[r].p);
      } /*else {
	d[w].distances[r] = distance(d[w].pos, inits[r].p, regs);
	}*/
    }
  }
  
  return true;
}

//==================================================================

struct IndirectPointSort{
  const double *distances;
  IndirectPointSort(const double *d) : distances(d) {}

  // sort operator, but we want ascending distances.
  bool operator()(int a, int b) {
    return distances[a] > distances[b];
  }
};

void sortedWaypoints(vector<int>* dest,
		     int start, int end,
		     const waypoint_map_t& wmap,
		     const region_map_t& regs) {
  // first, find the distances to all waypoints.
  assert(start >=0);
  assert(end >=0);
  double distances[MAX_WAYPOINTS];
  for (int w=0; w<MAX_WAYPOINTS; w++) {
    if (start != w) {
      double dist = (distance(wmap[end].pos, wmap[w].pos, regs)
		     - distance(wmap[start].pos, wmap[w].pos, regs));
      if (wmap[start].distances[w] != INFINITY) {
	dist = wmap[start].distances[w];
      }
      distances[w] = dist;
      dest->push_back(w);
    }
  }
  sort(dest->begin(), dest->end(), 
       IndirectPointSort(distances));
}

static double pathFindWork(vector<int> *destpath,
			   int pos,
			   int dest,
			   bitmap_t seen,
			   const waypoint_map_t& map, 
			   const region_map_t& regs);

static void ppoints(vector<int>* p) {
  if (p == NULL) { puts("null"); }
  else if (p->empty()) { puts("empty"); }
  else {
    bool first = false;
    printf("<%d>:", p->size());
    for (int i=0; i<p->size(); i++) {
      if (first) { putchar(','); }
      int index = (*p)[i];
      printf(" %s (%d)", points[index].comment, index);
    }
    printf("\n");
  }
}

static double pathFindWork(vector<int> *destpath,
			   int pos, int dest,
			   bitmap_t seen,
			   const waypoint_map_t& wmap,
			   const region_map_t& regs) {
  vector<int> wpoints;
  assert(pos >=0);
  assert(dest >=0);

  // already there.
  if (pos == dest) {
    return 0.0;
  }

  if (full_set(seen)) 
    return INFINITY; //distance(wmap[pos].pos, wmap[dest].pos, regs);

  sortedWaypoints(&wpoints, pos, dest, wmap, regs);
  // remove those we've already seen.
  vector<int>::iterator j = wpoints.begin();
  while (j != wpoints.end()) {
    if (is_set(seen, *j)) {
      wpoints.erase(j);
    }
    else {
      ++j;
    }
  }

  printf(" %d to %d: sorted waypoints: ", pos, dest);
  ppoints(destpath);

  if (wpoints.empty())
    return INFINITY; //distance(pos, dest, regs);

  int offset = destpath->size();
  int lowest_idx = -1;
  double lowest_value = INFINITY;
  vector<int> tmp;
  for (int i=0; i<wpoints.size(); ++i) {
    if (!is_set(seen, wpoints[i])) {
      double val = pathFindWork(&tmp, wpoints[i], dest,
				set(seen, wpoints[i]), wmap, regs);
      if (lowest_value == INFINITY 
	  || (val < lowest_value && val != INFINITY)) {
	lowest_value = val;
	lowest_idx = i;
	destpath->resize(offset);
	destpath->push_back(wpoints[i]);
	printf("  choosing minimum distance %f, going through: ", val);
	ppoints(destpath);
	printf("     to follow path ");
	ppoints(&tmp);
	copy(tmp.begin(), tmp.end(),
	     back_inserter(*destpath));
      }
    }
  }

  // at the end, destpath has the minimum path we've seen so far,
  // and now we're returning our distance to the path we've appended on.

  return lowest_value + distance(wmap[pos].pos, wmap[lowest_idx].pos, regs);
}

bool pathFind(vector<int> *destpath,
	      position pos, position dest,
	      const waypoint_map_t& wmap,
	      const region_map_t& regs) {
  bitmap_t seen = 0;
  //
  // find the closest positions for 'pos' and 'dest'
  double min_p = INFINITY, min_d = INFINITY;
  int i_p = -1, i_d = -1;
  for (int i=0; i<wmap.size(); ++i) {
    double pdist = distance(pos, wmap[i].pos, regs);
    double ddist = distance(dest, wmap[i].pos, regs);
    if (min_p == INFINITY || (pdist != INFINITY && min_p > pdist)) {
      min_p = pdist; i_p = i;
    }

    if (min_d == INFINITY || (ddist != INFINITY && min_d > ddist)) {
      min_d = ddist; i_d = i;
    }
  }
  destpath->push_back(i_p);
  return pathFindWork(destpath, i_p, i_d, set(seen, i_p), wmap, regs) != INFINITY;
}


/* test routine */
int main(int args, char ** argv) {

  region regions[] = {
    { {0, 60}, {10, 40} }, // alpha
    { {25, 80}, {35, 70}}, // beta
    { {14, 45}, {45, 40}}, // gamma
    { {60, 15}, {45, 50}}, // delta
    { {50, 60}, {60, 40}}, // epsilon
    { {25, 35}, {35, 15}}, // zeta
    { {25, 10}, {35, 0}}  // eta
  };

  waypoint_map_t wmap;
  region_map_t regs(regions, regions + 7);

  bool r = makeWaypointTable(&wmap, regs, nr_points, points);
  printf ("Waypoint Table: \n");
  for (int i=0; i<wmap.size(); ++i) {
    printf ("%d: %s\t (%3.1f,%3.1f) ", i, points[i].comment,
	    wmap[i].pos.x, wmap[i].pos.y);
    for (int j=0; j<wmap.size(); j++) {
      double dist = wmap[i].distances[j];
      char sep = ((j+1)%5) == 0? '|':' ';
      if (dist == INFINITY) {
	printf (".%c", sep);
      } else if (dist < 0.01) {
	if (i == j) {
	  printf ("!%c", sep);
	} else {
	  printf ("X%c", sep);
	}
      } else {
	printf ("%3.2f%c", wmap[i].distances[j], sep);
      }
    }
    printf ("\n");
  }

  printf ("Starting waypoint-waypoint tests.\n");
  struct path_t { int start,  end; };
  while (1) {
    int start, end;
    printf ("Start index:"); fflush(stdout);
    scanf("%d", &start);
    printf ("End index:"); fflush(stdout);
    scanf("%d", &end);


    vector<int> path;
    bool ret = pathFind(&path, wmap[start].pos, wmap[end].pos,
    			  wmap, regs);
    printf ("RESULT:  %d to %d: ", start, end);
    if (ret) {
    	for (int j=0; j<path.size(); ++j) {
    	  printf ("%s ", points[j].comment);
    	}
    } else {
    	printf ("fail");
    }
    printf ("\n=======================\n\n");
  }
}
