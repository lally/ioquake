#include "astar.h"
#include <math.h>
#include <assert.h>
#include <algorithm>
#include <stdio.h>
#include <signal.h>
#include <stdarg.h>

region regions[] = {
  { {0, 60}, {10, 40} }, // alpha
  { {25, 80}, {35, 70}}, // beta
  { {15, 60}, {45, 50}}, // gamma -- ?
  { {15, 45}, {45, 40}}, // delta -- ?
  { {50, 60}, {60, 40}}, // epsilon
  { {25, 35}, {35, 15}}, // zeta
  { {25, 10}, {35, 0}}  // eta
};


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
  { "epsilon_1", {52.5, 55}, 0x002040 },
  { "epsilon_2", {52.5, 42.5}, 0x001200 },

  // zeta: 12
  { "zeta_1", {30, 32.5}, 0x002100 },
  { "zeta_2", {30, 17.5}, 0x005000 },

  // eta: 14
  { "eta_1", {32.5, 5}, 0x00a000 },
  { "eta_2", {30, 7.5}, 0x004008 }
    
};

#define NR_POINTS (sizeof (points) / sizeof (points[0]));

static bool within(struct position p,
		   struct region r) {
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

double rawDistance(struct position a, struct position b) {
  return sqrt(sqr(a.x - b.x) + sqr(a.y - b.y));
}

static int s_depth;
#if 0
 class DepthWatcher{
 public:
  DepthWatcher() { s_depth++; }
  ~DepthWatcher() { s_depth--; }
 };
 #define BEGIN_DEPTH  DepthWatcher __dwatcher
#endif

#define BEGIN_DEPTH do { s_depth++; } while (0)
#define END_DEPTH do { s_depth--; } while (0)


void iprintf(const char *fmt, ...)
{
  char *p;
  va_list ap;
  va_start(ap, fmt);
  int nl_cnt = 0;
  char *c = (char *)fmt; // we won't actually modify this.
  while (*c) { if (*c++ == '\n') nl_cnt++; }
  c = (char *)fmt;
  if (nl_cnt && s_depth) {
    c = (char*) malloc(strlen(fmt) + 2*s_depth*nl_cnt + 1);
    char *src=(char*)fmt, *dest=c;
    while (*dest++ = *src++) {
      if (*(dest-1) == '\n') {
	int i;
	for (i=0; i<s_depth; ++i) {
	  *dest++ = ' ';
	  *dest++ = ' ';
	}
      }
    }
  }
  
  (void) vprintf(c, ap);
  va_end(ap);
  if (nl_cnt && s_depth) free(c);
}

double distance(const position& a, const position& b,
		const region_map_t* regs) {
  // find a region that fits a.
  bool a_in_reg = false;
  bool b_in_reg = false;
  int r;
  for (r=0; r<SIZE(*regs); ++r) {
    if (within(a, GET(*regs,r))) {
      a_in_reg = true;
    }
    if (within(b, GET(*regs,r))) {
      b_in_reg = true;
    }
    if (within(a, GET(*regs,r)) && within(b, GET(*regs,r))) {
      return rawDistance(a,b);
    }
  }
  if (!a_in_reg) {
    iprintf ("WARNING: (%4.1f, %4.1f) is not in any region.\n", a.x, a.y);
    if (a.x == 0.0 && a.y == 0.0) {
      kill(getpid(), SIGINT);
    }
  }
  if (!b_in_reg) {
    iprintf ("WARNING: (%4.1f, %4.1f) is not in any region.\n", b.x, b.y);
    if (b.x == 0.0 && b.y == 0.0) {
      kill(getpid(), SIGINT);
    }
  }
  return INFINITY;
}

bool makeWaypointTable(waypoint_map_t		*dest,
		       const region_map_t*	 regs,
		       int			 nwaypoints,
		       const waypoint_init*      inits) {
  waypoint init = {{0.0, 0.0}, {INFINITY, INFINITY}};
  assert(dest);
  assert(inits);
  if (nwaypoints > NR_POINTS) 
    return false;
  int i;
  for (i=0; i<NR_POINTS; ++i) 
    init.distances[i] = INFINITY;

  CLEAR(*dest);
  int w;
  for (w=0; w<nwaypoints; w++) {
    PUSH_BACK(*dest, init);
    ELEM(*dest,w).pos = inits[w].p;
    int r;
    for (r=0; r<nwaypoints; ++r) {
      if(is_set(inits[w].reachable_bitmap, r)) {
	iprintf ("  %s: bit %d of 0x%x is set, connecting to %s\n", 
		inits[w].comment, r, inits[w].reachable_bitmap, inits[r].comment);
	ELEM(*dest,w).distances[r] = rawDistance(ELEM(*dest,w).pos, inits[r].p);
      } else {
	ELEM(*dest,w).distances[r] = distance(ELEM(*dest,w).pos, inits[r].p, regs);
      }
    }
  }
  
  return true;
}

//==================================================================
/*
struct IndirectPointSort{
  const double *distances;
  IndirectPointSort(const double *d) : distances(d) {}

  // sort operator, but we want ascending distances.
  bool operator()(int a, int b) {
    return (distances[b] == INFINITY)
	|| (distances[a] != INFINITY  
	    && distances[a] < distances[b]);
    //    return distances[a] > distances[b];
  }
};
*/

static void ppoints(int_map_t* p) {
  if (p == NULL) { puts("null"); }
  else if (SIZE(*p) == 0) { puts("empty"); }
  else {
    bool first = false;
    iprintf("<%lu>:", SIZE(*p));
    int i;
    for (i=0; i<SIZE(*p); i++) {
      if (first) { putchar(','); }
      int index = GET(*p,i);
      iprintf(" %s (%d)", points[index].comment, index);
    }
    iprintf("\n");
  }
}


void sortedWaypoints(int_map_t* dest,
		     int start, int end,
		     struct waypoint_map_t* wmap,
		     struct region_map_t* regs) {
  // Return, heuristically-sorted, the waypoints.
  BEGIN_DEPTH;
  assert(start >=0);
  assert(end >=0);
  double distances[NR_POINTS];
  int w;
  for (w=0; w<NR_POINTS; w++) {
    if (start != w) {
      if ((distances[w] = ELEM(*wmap,start).distances[w]) != INFINITY)
	PUSH_BACK(*wmap, w);
    } else {
      distances[w] = INFINITY;
    }
  }
  /*iprintf ("sortedWaypoints from before sort: ");
  for (int i=0; i<NR_POINTS; i++) {
    if (distances[i] == INFINITY) 
      iprintf (". ");
    else
      iprintf ("[%d:%3.1f]", i, distances[i]);
  }
  iprintf ("\n"); */

  //
  // TODO(lally): copy over qhsort from the nb305.
  //
  //  sort(dest->begin(), dest->end(), IndirectPointSort(distances));
  END_DEPTH;
}

static double pathFindWork(int_map_t *destpath,
			   int pos,
			   int dest,
			   bitmap_t seen,
			   struct waypoint_map_t* map, 
			   struct region_map_t* regs);

static double pathFindWork(int_map_t *destpath,
			   int pos, int dest,
			   bitmap_t seen,
			   struct waypoint_map_t* wmap,
			   struct region_map_t* regs) {
  BEGIN_DEPTH;
  int_map_t wpoints;
  INIT(wpoints);
  assert(pos >=0);
  assert(dest >=0);

  // already there.
  if (pos == dest) {
    //    iprintf ("* %d = %d\n", pos, dest);
    END_DEPTH;
    return 0.0;
  }

  if (full_set(seen)) { 
    //    iprintf ("* full set seen.");
    END_DEPTH;
    return INFINITY; 
  }

  if (GET(*wmap,pos).distances[dest] != INFINITY) {
    //    iprintf ("* %d -> %d = %3.1f\n", pos, dest, wmap[pos].distances[dest]);
    PUSH_BACK(*destpath, dest);
    //    destpath->push_back(dest);
    END_DEPTH;
    return GET(wmap,pos).distances[dest];
  }

  //  iprintf ("\nSTART %d->%d\n", pos, dest);
  sortedWaypoints(&wpoints, pos, dest, wmap, regs);
  //  iprintf ("\n%d->%d sorted waypoint list: ", pos, dest);
  //  ppoints(&wpoints);
  // remove those we've already seen.
  int j = 0;
  while (j < SIZE(wpoints)) {
    if (is_set(seen, ELEM(wpoints,j))) {
      ERASE(wpoints, j);
      //      iprintf ("  -- removing already-seen %d\n", *j);
    }
    else {
      ++j;
    }
  }

  if (SIZE(wpoints) == 0) {
    END_DEPTH;
    return INFINITY; 
  }

  const int offset = destpath->size();
  int lowest_idx = -1;
  double lowest_value = INFINITY;

  //  vector<int> tmp(destpath->begin(), destpath->end());
  int_vec_t tmp;
  INIT(tmp);
  COPY(tmp, *destpath);
  int i;
  for (i=0; i<SIZE(wpoints); ++i) {
    if (!is_set(seen, ELEM(wpoints,i))) {
      double val;

      //      iprintf ("\n%d->%d ITER %d(p#%d): start path =", pos, dest, i, wpoints[i]);
      //      ppoints(&tmp);

      
      PUSH_BACK(tmp, ELEM(wpoints,i));
      val = pathFindWork(&tmp, ELEM(wpoints,i), dest,
			 set(seen, ELEM(wpoints,i)), wmap, regs)
	+ wmap[pos].distances[ELEM(wpoints,i)];

      if (lowest_value == INFINITY 
	  || (val != INFINITY && val < lowest_value)) {
	lowest_value = val;
	lowest_idx = ELEM(wpoints,i);
	//	iprintf("\nchoosing minimum distance %5.2f, with path= ", val);
	//	ppoints(&tmp);
	COPY(*destpath, tmp);
	//	destpath->assign(tmp.begin(), tmp.end());
      } 

      RESIZE(tmp, offset);
      //      tmp.resize(offset);
    }
  }

  // at the end, destpath has the minimum path we've seen so far,
  // and now we're returning our distance to the path we've appended on.

  //  iprintf ("\nCOMPLETE: min_val: %f, min_idx: %d\n", lowest_value, lowest_idx);
  END_DEPTH;
  return lowest_value; // + distance(wmap[pos].pos, wmap[lowest_idx].pos, regs);
}

bool pathFind(int_vec_t *destpath,
	      position pos, position dest,
	      const waypoint_map_t* wmap,
	      const region_map_t* regs) {
  bitmap_t seen = 0;
  //
  // find the closest positions for 'pos' and 'dest'
  double min_p = INFINITY, min_d = INFINITY;
  int i_p = -1, i_d = -1;
  int i;
  for (i=0; i<SIZE(*wmap); ++i) {
    double pdist = distance(pos, ELEM(*wmap,i).pos, regs);
    double ddist = distance(dest, ELEM(*wmap,i).pos, regs);
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
  waypoint_map_t wmap;
  region_map_t regs;
  INIT(wmap);
  INIT(regs);
  int i;
  for (i=0; i<7; i++) {
    PUSH_BACK(regs, regions[i]);
  }

  int self_refs = 0;
  bool r = makeWaypointTable(&wmap, regs, NR_POINTS, points);
  iprintf ("Waypoint Table: \n");
  iprintf ("          \t             ");

  for (i=0; i<SIZE(wmap); ++i) {
    iprintf("%6d ", i);
  }
  iprintf("\n");

  int i,j;
  for (i=0; i<SIZE(wmap); ++i) {
    iprintf ("%d: %s\t (%4.1f,%4.1f) ", i, points[i].comment,
	    ELEM(wmap, i).pos.x, ELEM(wmap, i).pos.y);
    for (j=0; j<SIZE(wmap); j++) {
      double dist = ELEM(wmap, i).distances[j];
      char sep = ((j+1)%5) == 0? '|':' ';
      if (dist == INFINITY) {
	iprintf ("      %c", sep);
      } else if (dist < 0.01) {
	if (i == j) {
	  iprintf ("   *  %c", sep);
	  self_refs++;
	} else {
	  iprintf ("   X  %c", sep);
	}
      } else {
	iprintf ("%6.2f%c", ELEM(wmap, i).distances[j], sep);
      }
    }
    iprintf ("\n");
  }
  iprintf("\nSelf References: %d\n", self_refs);

  iprintf ("Starting waypoint-waypoint tests.\n");

  for (i=0; i<SIZE(wmap); ++i) {
    int_vec_t path;
    INIT(path);
    bool ret = pathFind(&path, ELEM(wmap,0).pos, ELEM(wmap, i).pos,
			wmap, regs);
    iprintf ("RESULT:  %d to %d: ", 0, i);
    for (j=0; j<SIZE(path); ++j) {
      iprintf ("%s (%d) ", points[ELEM(path,j)].comment, path[j]);
    }
    iprintf ("\n");
  }
}
