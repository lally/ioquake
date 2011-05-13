#include "astar.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>` 
#include <assert.h>
#include <stdio.h>
#include <signal.h>
#include <stdarg.h>

struct region regions[] = {
  { {0, 60, 1}, {10, 40, 0} }, // alpha
  { {25, 80, 1}, {35, 70, 0}}, // beta
  { {15, 60, 1}, {45, 50, 0}}, // gamma -- ?
  { {15, 45, 1}, {45, 40, 0}}, // delta -- ?
  { {50, 60, 1}, {60, 40, 0}}, // epsilon
  { {25, 35, 1}, {35, 15, 0}}, // zeta
  { {25, 10, 1}, {35, 0, 0}}   // eta
};


struct waypoint_init points[] = {
  // sixth nibble:  _, _, _, _
  // fifth nibble:  _, _, _, _
  // fourth nibble: eta 2,1, zeta 2,1
  // third nibble:  epsilon 2, 1, delta 3,2, 
  // second nibble: delta 1, gamma 3,2,1, 
  // first nibble:  beta 2,1, alpha 2,1, 

  // alpha: 0
  { "alpha_1", {7.5, 42.5, 0.1}, 0x000012 },
  { "alpha_2", {7.5, 55.0, 0.1}, 0x000081 },

  // beta: 2
  { "beta_1", {30, 72.5, 0.1},  0x000108 },
  { "beta_2", {32.5, 75, 0.1},  0x010004 },

  // gamma: 4
  { "gamma_1", {17.5, 42.5, 0.1}, 0x000061 },
  { "gamma_2", {30, 42.5, 0.1},   0x001050 },
  { "gamma_3", {42.5, 42.5, 0.1}, 0x000830 },

  // delta:7 
  { "delta_1", {17.5, 55, 0.1}, 0x000302 },
  { "delta_2", {30, 57.5, 0.1}, 0x000284 },
  { "delta_3", {42.5, 55, 0.1}, 0x000980 },

  // epsilon: 10
  { "epsilon_1", {52.5, 55, 0.1}, 0x002040 },
  { "epsilon_2", {52.5, 42.5, 0.1}, 0x001200 },

  // zeta: 12
  { "zeta_1", {30, 32.5, 0.1}, 0x002100 },
  { "zeta_2", {30, 17.5, 0.1}, 0x005000 },

  // eta: 14
  { "eta_1", {32.5, 5, 0.1}, 0x00a000 },
  { "eta_2", {30, 7.5, 0.1}, 0x004008 }
    
};

#define NR_POINTS (sizeof (points) / sizeof (points[0]))

static bool within(struct position p,
		   struct region r) {
  return p.x >= r.topleft.x 
    && p.y <= r.topleft.y
    && p.z <= r.topleft.z
    && p.x <= r.bottomright.x
    && p.y >= r.bottomright.y
    && p.z >= r.bottomright.z;
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
  return sqrt(sqr(a.x - b.x) + sqr(a.y - b.y) + sqr(a.z - b.z));
}

static int s_depth;
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

double distance(struct position a, struct  position b,
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

bool makeWaypointTable(waypoint_vec_t		*dest,
		       const region_map_t*	 regs,
		       int			 nwaypoints,
		       struct waypoint_init*     inits) {
  struct waypoint init = {{0.0, 0.0}, {INFINITY, INFINITY}};
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
    GET(*dest,w).pos = inits[w].p;
    int r;
    for (r=0; r<nwaypoints; ++r) {
      if(is_set(inits[w].reachable_bitmap, r)) {
	//	iprintf ("  %s: bit %d of 0x%x is set, connecting to %s\n", 
	//		inits[w].comment, r, inits[w].reachable_bitmap, inits[r].comment);
	GET(*dest,w).distances[r] = rawDistance(GET(*dest,w).pos, inits[r].p);
      } else {
	GET(*dest,w).distances[r] = distance(GET(*dest,w).pos, inits[r].p, regs);
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

static void ppoints(int_vec_t* p) {
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

typedef unsigned char byte;

void swapb(void *ap, void *bp, int sz) {
  byte *a = (byte*) ap;
  byte *b = (byte*) bp;
  while (sz-- >0) {
    byte t = *a;
    *a = *b;
    *b = t;
    a++; b++;
  }
}


#define NELEMENTS (16)
static int elements[NELEMENTS];
void print_elems() {
  int i;
  for (i=0; i<NELEMENTS; ++i) {
    printf ("%d ", elements[i]);
  }
  printf("\n");
}

void print_status(int offset, int left, int right, int n) {
  left += offset;
  right += offset;
  int i;
  for (i=0; i<NELEMENTS; ++i) {
    if (offset == i) {
      iprintf ("[[");
    }
    if (offset+n == i) {
      iprintf ("]]");
    }
    if (left == i) {
      iprintf ("<");
    }
    if (right == i) {
      iprintf (">");
    }
    iprintf ("%d ", elements[i]);
  }
  iprintf("\n");

}

#define ELEM(k) ((void *)&(vec[(k)*sz]))
static int sort_depth;
void qhsort(void* start, int n, int sz,
	    int (*compar)(void* a, void* b, void* handle),
	    void* handle) {
  byte *vec = (byte*) start;
  int left=1, right=n-1;
  const int pivot = 0;
  assert(sort_depth < 16);
  if (n <= 1)
    return;

  sort_depth++;
  while (left < right) {
    while (left < n && compar(ELEM(left), ELEM(pivot), handle) < 0) {
      left++;
    }

    while (right >= 0 && compar(ELEM(right), ELEM(pivot), handle) > 0) {
      right--;
    }

    if (left < right) {
      swapb(ELEM(left), ELEM(right), sz);
    }
  }      

  if (compar(ELEM(right), ELEM(pivot), handle) < 0) {
    swapb(ELEM(right), ELEM(pivot), sz);
  }

  qhsort(start, right, sz, compar, handle);
  qhsort(ELEM(right+1), n-right-1, sz, compar, handle);
  sort_depth--;
}
#undef ELEM

int comparator(void *left, void *right, void *handle) {
  const double *distances = (double*) handle;
  int a = *(int*) left; 
  int b = *(int*) right;

  if (distances[b] == INFINITY) {
    if (distances[a] == INFINITY) 
      return 0;
    else 
      return -1;
  }
  // b's not infinity.
  if (distances[a] != INFINITY) {
    if (distances[a] < distances[b]) {
      return -1;
    } else if (distances[a] == distances[b]) {
      return 0;
    } else {
      return 1;
    }
  }
  // a == infinity, b != infinity.  a's bigger.
  return 1;
}


void sortedWaypoints(int_vec_t* dest,
		     int start, int end,
		     const waypoint_vec_t* wmap,
		     const region_map_t* regs) {
  // Return, heuristically-sorted, the waypoints.
  BEGIN_DEPTH;
  assert(start >=0);
  assert(end >=0);
  double distances[NR_POINTS];
  int w;
  for (w=0; w<NR_POINTS; w++) {
    if (start != w) {
      if ((distances[w] = GET(*wmap,start).distances[w]) 
	  != INFINITY)
	PUSH_BACK(*dest, w);
    } else {
      distances[w] = INFINITY;
    }
  }
  qhsort(BEGIN(*dest), SIZE(*dest), sizeof(int), comparator, (void*) distances);
  END_DEPTH;
}

static double pathFindWork(int_vec_t *destpath,
			   int pos,
			   int dest,
			   bitmap_t seen,
			   const  waypoint_vec_t* map, 
			   const region_map_t* regs);

static double pathFindWork(int_vec_t *destpath,
			   int pos, int dest,
			   bitmap_t seen,
			   const waypoint_vec_t* wmap,
			   const region_map_t* regs) {
  BEGIN_DEPTH;
  int_vec_t wpoints;
  INIT(wpoints);
  assert(pos >=0);
  assert(dest >=0);

  // already there.
  if (pos == dest) {
    END_DEPTH;
    return 0.0;
  }

  if (full_set(seen)) { 
    END_DEPTH;
    return INFINITY; 
  }

  if (GET(*wmap,pos).distances[dest] != INFINITY) {
    PUSH_BACK(*destpath, dest);
    END_DEPTH;
    return GET(*wmap,pos).distances[dest];
  }

  sortedWaypoints(&wpoints, pos, dest, wmap, regs);
  // remove those we've already seen.
  int j = 0;
  while (j < SIZE(wpoints)) {
    if (is_set(seen, GET(wpoints,j))) {
      ERASE(wpoints, j);
    }
    else {
      ++j;
    }
  }

  if (SIZE(wpoints) == 0) {
    END_DEPTH;
    return INFINITY; 
  }

  const int offset = SIZE(*destpath);
  int lowest_idx = -1;
  double lowest_value = INFINITY;

  int_vec_t tmp;
  INIT(tmp);
  COPY(tmp, *destpath);
  int i;
  for (i=0; i<SIZE(wpoints); ++i) {
    if (!is_set(seen, GET(wpoints,i))) {
      double val;

      PUSH_BACK(tmp, GET(wpoints,i));
      val = pathFindWork(&tmp, GET(wpoints,i), dest,
			 set(seen, GET(wpoints,i)), wmap, regs)
	+ GET(*wmap,pos).distances[GET(wpoints,i)];

      if (lowest_value == INFINITY 
	  || (val != INFINITY && val < lowest_value)) {
	lowest_value = val;
	lowest_idx = GET(wpoints,i);
	COPY(*destpath, tmp);
      } 

      RESIZE(tmp, offset);
    }
  }

  // at the end, destpath has the minimum path we've seen so far,
  // and now we're returning our distance to the path we've appended on.

  END_DEPTH;
  return lowest_value; // + distance(wmap[pos].pos, wmap[lowest_idx].pos, regs);
}

bool pathFind(int_vec_t *destpath,
	      struct position pos, 
	      struct position dest,
	      const waypoint_vec_t* wmap,
	      const region_map_t* regs) {
  bitmap_t seen = 0;
  //
  // find the closest positions for 'pos' and 'dest'
  double min_p = INFINITY, min_d = INFINITY;
  int i_p = -1, i_d = -1;
  int i;
  for (i=0; i<SIZE(*wmap); ++i) {
    double pdist = distance(pos, GET(*wmap,i).pos, regs);
    double ddist = distance(dest, GET(*wmap,i).pos, regs);
    if (min_p == INFINITY || (pdist != INFINITY && min_p > pdist)) {
      min_p = pdist; i_p = i;
    }

    if (min_d == INFINITY || (ddist != INFINITY && min_d > ddist)) {
      min_d = ddist; i_d = i;
    }
  }
  PUSH_BACK(*destpath,i_p);
  return pathFindWork(destpath, i_p, i_d, set(seen, i_p), wmap, regs) != INFINITY;
}


/* test routine */
int main(int args, char ** argv) {
  int i,j;
  waypoint_vec_t wmap;
  region_map_t regs;
  INIT(wmap);
  INIT(regs);

  for (i=0; i<7; i++) {
    PUSH_BACK(regs, regions[i]);
  }

  int self_refs = 0;
  bool r = makeWaypointTable(&wmap, &regs, NR_POINTS, points);
  iprintf ("Waypoint Table: \n");
  iprintf ("          \t             ");

  for (i=0; i<SIZE(wmap); ++i) {
    iprintf("%6d ", i);
  }
  iprintf("\n");


  for (i=0; i<SIZE(wmap); ++i) {
    iprintf ("%d: %s\t (%4.1f,%4.1f) ", i, points[i].comment,
	    GET(wmap, i).pos.x, GET(wmap, i).pos.y);
    for (j=0; j<SIZE(wmap); j++) {
      double dist = GET(wmap, i).distances[j];
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
	iprintf ("%6.2f%c", GET(wmap, i).distances[j], sep);
      }
    }
    iprintf ("\n");
  }
  iprintf("\nSelf References: %d\n", self_refs);

  iprintf ("Starting waypoint-waypoint tests.\n");

  for (i=0; i<SIZE(wmap); ++i) {
    int_vec_t path;
    INIT(path);
    bool ret = pathFind(&path, GET(wmap,0).pos, GET(wmap, i).pos,
			&wmap, &regs);
    iprintf ("RESULT:  %d to %d: ", 0, i);
    for (j=0; j<SIZE(path); ++j) {
      iprintf ("%s (%d) ", points[GET(path,j)].comment, 
	       GET(path,j));
    }
    iprintf ("\n");
  }
}
//#endif
