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

static int s_depth;

class DepthWatcher{
public:
  DepthWatcher() { s_depth++; }
  ~DepthWatcher() { s_depth--; }
};
#define BEGIN_DEPTH  DepthWatcher __dwatcher


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
	for (int i=0; i<s_depth; ++i) {
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
		const vector<region>& regs) {
  // find a region that fits a.
  bool a_in_reg = false;
  bool b_in_reg = false;
  for (int r=0; r<regs.size(); ++r) {
    if (within(a, regs[r])) {
      a_in_reg = true;
    }
    if (within(b, regs[r])) {
      b_in_reg = true;
    }
    if (within(a, regs[r]) && within(b, regs[r])) {
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

bool makeWaypointTable(waypoint_map_t *dest,
		       const vector<region>& regs,
		       int nwaypoints,
		       const waypoint_init* inits) {
  waypoint init = {{0.0, 0.0}, {INFINITY, INFINITY}};
  assert(dest);
  assert(inits);
  if (nwaypoints > nr_points) 
    return false;
  for (int i=0; i<nr_points; ++i) 
    init.distances[i] = INFINITY;

  waypoint_map_t& d = *dest;
  d.clear();
  for (int w=0; w<nwaypoints; w++) {
    d.push_back(init);
    d[w].pos = inits[w].p;
    for (int r=0; r<nwaypoints; ++r) {
      if(is_set(inits[w].reachable_bitmap, r)) {
	iprintf ("  %s: bit %d of 0x%x is set, connecting to %s\n", 
		inits[w].comment, r, inits[w].reachable_bitmap, inits[r].comment);
	d[w].distances[r] = rawDistance(d[w].pos, inits[r].p);
      } else {
	d[w].distances[r] = distance(d[w].pos, inits[r].p, regs);
      }
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
    return (distances[b] == INFINITY)
	|| (distances[a] != INFINITY  
	    && distances[a] < distances[b]);
    //    return distances[a] > distances[b];
  }
};
static void ppoints(vector<int>* p) {
  if (p == NULL) { puts("null"); }
  else if (p->empty()) { puts("empty"); }
  else {
    bool first = false;
    iprintf("<%lu>:", p->size());
    for (int i=0; i<p->size(); i++) {
      if (first) { putchar(','); }
      int index = (*p)[i];
      iprintf(" %s (%d)", points[index].comment, index);
    }
    iprintf("\n");
  }
}


void sortedWaypoints(vector<int>* dest,
		     int start, int end,
		     const waypoint_map_t& wmap,
		     const region_map_t& regs) {
  // Return, heuristically-sorted, the waypoints.
  BEGIN_DEPTH;
  assert(start >=0);
  assert(end >=0);
  double distances[nr_points];
  for (int w=0; w<nr_points; w++) {
    if (start != w) {
      if ((distances[w] = wmap[start].distances[w]) != INFINITY)
	dest->push_back(w);
    } else {
      distances[w] = INFINITY;
    }
  }
  /*iprintf ("sortedWaypoints from before sort: ");
  for (int i=0; i<nr_points; i++) {
    if (distances[i] == INFINITY) 
      iprintf (". ");
    else
      iprintf ("[%d:%3.1f]", i, distances[i]);
  }
  iprintf ("\n"); */
  sort(dest->begin(), dest->end(), IndirectPointSort(distances));
}

static double pathFindWork(vector<int> *destpath,
			   int pos,
			   int dest,
			   bitmap_t seen,
			   const waypoint_map_t& map, 
			   const region_map_t& regs);

static double pathFindWork(vector<int> *destpath,
			   int pos, int dest,
			   bitmap_t seen,
			   const waypoint_map_t& wmap,
			   const region_map_t& regs) {
  BEGIN_DEPTH;
  vector<int> wpoints;
  assert(pos >=0);
  assert(dest >=0);

  // already there.
  if (pos == dest) {
    //    iprintf ("* %d = %d\n", pos, dest);
    return 0.0;
  }

  if (full_set(seen)) { 
    //    iprintf ("* full set seen.");
    return INFINITY; 
  }

  if (wmap[pos].distances[dest] != INFINITY) {
    //    iprintf ("* %d -> %d = %3.1f\n", pos, dest, wmap[pos].distances[dest]);
    destpath->push_back(dest);
    return wmap[pos].distances[dest];
  }

  //  iprintf ("\nSTART %d->%d\n", pos, dest);
  sortedWaypoints(&wpoints, pos, dest, wmap, regs);
  //  iprintf ("\n%d->%d sorted waypoint list: ", pos, dest);
  //  ppoints(&wpoints);
  // remove those we've already seen.
  vector<int>::iterator j = wpoints.begin();
  while (j != wpoints.end()) {
    if (is_set(seen, *j)) {
      wpoints.erase(j);
      //      iprintf ("  -- removing already-seen %d\n", *j);
    }
    else {
      ++j;
    }
  }

  if (wpoints.empty())
    return INFINITY; 

  const int offset = destpath->size();
  int lowest_idx = -1;
  double lowest_value = INFINITY;

  vector<int> tmp(destpath->begin(), destpath->end());
  for (int i=0; i<wpoints.size(); ++i) {
    if (!is_set(seen, wpoints[i])) {
      double val;

      //      iprintf ("\n%d->%d ITER %d(p#%d): start path =", pos, dest, i, wpoints[i]);
      //      ppoints(&tmp);

      tmp.push_back(wpoints[i]);
      val = pathFindWork(&tmp, wpoints[i], dest,
			 set(seen, wpoints[i]), wmap, regs)
	+ wmap[pos].distances[wpoints[i]];

      if (lowest_value == INFINITY 
	  || (val != INFINITY && val < lowest_value)) {
	lowest_value = val;
	lowest_idx = wpoints[i];
	//	iprintf("\nchoosing minimum distance %5.2f, with path= ", val);
	//	ppoints(&tmp);
	destpath->assign(tmp.begin(), tmp.end());
      } 

      tmp.resize(offset);
    }
  }

  // at the end, destpath has the minimum path we've seen so far,
  // and now we're returning our distance to the path we've appended on.

  //  iprintf ("\nCOMPLETE: min_val: %f, min_idx: %d\n", lowest_value, lowest_idx);
  return lowest_value; // + distance(wmap[pos].pos, wmap[lowest_idx].pos, regs);
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
  waypoint_map_t wmap;
  region_map_t regs(regions, regions + 7);

  int self_refs = 0;
  bool r = makeWaypointTable(&wmap, regs, nr_points, points);
  iprintf ("Waypoint Table: \n");
  iprintf ("          \t             ");
  for (int i=0; i<wmap.size(); ++i) {
    iprintf("%6d ", i);
  }
  iprintf("\n");

  for (int i=0; i<wmap.size(); ++i) {
    iprintf ("%d: %s\t (%4.1f,%4.1f) ", i, points[i].comment,
	    wmap[i].pos.x, wmap[i].pos.y);
    for (int j=0; j<wmap.size(); j++) {
      double dist = wmap[i].distances[j];
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
	iprintf ("%6.2f%c", wmap[i].distances[j], sep);
      }
    }
    iprintf ("\n");
  }
  iprintf("\nSelf References: %d\n", self_refs);

  iprintf ("Starting waypoint-waypoint tests.\n");
  struct path_t { int start,  end; };
  for (int i=0; i<wmap.size(); ++i) {
    vector<int> path;
    bool ret = pathFind(&path, wmap[0].pos, wmap[i].pos,
			wmap, regs);
    iprintf ("RESULT:  %d to %d: ", 0, i);
    for (int j=0; j<path.size(); ++j) {
      iprintf ("%s (%d) ", points[path[j]].comment, path[j]);
    }
    iprintf ("\n");
  }
}
