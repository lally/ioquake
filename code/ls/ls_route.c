#include "astar.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>` 
#include <assert.h>
#include <stdio.h>
#include <signal.h>
#include <stdarg.h>

struct region regions[] = {
  // Quad-damage platform (Q)
  { {120, 50, 1325}, {225, 65, 1355}},

  // Railgun platform (R)
  { {2300, -250, 300}, { 2600, 350, 335} },

  // Low jump platform (J)
  { {-72, -210, 45}, {1150, 335, 75} },

  // mid platform (M)
  { {40, -950, 370}, {710, 1075, 405} },

  // left upper platform (L)
  { {-600, -1100, 620}, {165, -420, 650} },

  // right upper platform (R)
  { {-600, 550, 620}, {140, 1300, 650} }

  /*  { {0, 40, 0}, {10, 60, 1} }, // old_alpha
  { {25, 70, 0}, {35, 80, 1}}, // old_bold_eta
  { {15, 50, 0}, {45, 60, 1}}, // old_gamma -- ?
  { {15, 40, 0}, {45, 45, 1}}, // old_delta -- ?
  { {50, 40, 0}, {60, 60, 1}}, // old_epsilon
  { {25, 15, 0}, {35, 35, 1}}, // old_zold_eta
  { {25, 0, 0}, {35, 10, 1}}   // old_eta  */
};

struct waypoint_init points[] = {
  /*
  Nibbles
  
  | Name     | Location               | Bitmap 1 | B0       |          | Bitmap 0 (B3   |             | B2       |          | B1          |          | B0       |           |
  |----------+------------------------+----------+----------+----------+----------------+-------------+----------+----------+-------------+----------+----------+-----------|
  | -------- | ---------------------- | Nibble 2 | Nibble 1 | Nibble 0 | Nibble 7       | Nibble 6    | Nibble 5 | Nibble 4 | Nibble 3    | Nibble 2 | Nibble 1 | Nibble 0  |
  |          |                        | N2, N1   | B ihgf   | Be,d,c,b | Ba, Ws2,s1,Wr2 | Ws1,G2,1,F3 | F21,e,D5 | D4,3,2,1 | B2-2,1,C6,5 | C4,3,2,1 | B6,5,4,3 | B2,1,A2,1 |
  
                                          B10,   B76543210..
  ****************************************************|*****/  
  { "A-1",	{122,	61,	1330},	{0x000,	0x00000002}},
  { "A-2",	{220,	59,	1330},	{0x000,	0x00040001}},
  /*..............................................|...|...*/
  { "B-1",	{190,	-900,	378},	{0x000,	0x00030600}},
  { "B-2",	{-381,	-792,	626},	{0x000,	0x20008010}},
  { "B-3",	{-388,	-425,	626},	{0x000,	0x00000028}},
  { "B-4",	{-388,	550,	626},	{0x000,	0x00000048}},
  { "B-5",	{-388,	918,	626},	{0x000,	0x40008020}},
  { "B-6",	{150,	1052,	378},	{0x000,	0x001c1800}},
  /*..............................................|...|...*/
  { "C-1",	{161,	-921,	626},	{0x000,	0x20014000}},
  { "C-2",	{40,	-673,	378},	{0x000,	0x00034404}},
  { "C-3",	{189,	-501,	378},	{0x008,	0x00034204}},
  { "C-4",	{194,	526,	378},	{0x002,	0x00181080}},
  { "C-5",	{40,	800,	378},	{0x000,	0x00188880}},
  { "C-6",	{139,	1073,	626},	{0x000,	0x40108000}},
  /*..............................................|...|...*/
  { "B2-1",	{-55,	-771,	626},	{0x000,	0x00000108}},
  { "B2-2",	{-60,	925,	626},	{0x000,	0x00002040}},
  /*..............................................|...|...*/
  { "D-1",	{342,	-936,	378},	{0x000,	0x001e0000}},
  { "D-2",	{193,	-390,	378},	{0x000,	0x001d0000}},
  { "D-3",	{705,	64,	374},	{0x000,	0x003b0000}},
  { "D-4",	{202,	517,	378},	{0x000,	0x00170000}},
  { "D-5",	{378,	1023,	378},	{0x000,	0x000f0000}},
  /*..............................................|...|...*/
  { "E",	{1100,	58,	50},	{0x004,	0x008000000}},
  /*..............................................|...|...*/
  { "F-1",	{2480,	-205,	306},	{0x000,	0x02020000}},
  { "F-2",	{2399,	67,	306},	{0x000,	0x06000000}},
  { "F-3",	{2480,	329,	306},	{0x000,	0x04080000}},
  /*..............................................|...|...*/
  { "G-1",	{2516,	-100,	306},	{0x000,	0x04c00000}},
  { "G-2",	{2527,	232,	306},	{0x000,	0x03800000}},
  /*..............................................|...|...*/
  { "W-r1",	{297,	-542,	378},	{0x000,	0x00034404}},
  { "W-r2",	{304,	679,	378},	{0x000,	0x00181080}},
  { "W-s1",	{-578,	-1096,	626},	{0x000,	0x00004100}},
  { "W-s2",	{-570,	1221,	626},	{0x000,	0x0000a000}},
  /*..............................................|...|...*/
  { "B-a",	{ -65,	-201,	50},	{0x039,	0x00000000}},
  { "B-b",	{ -42,	320,	50},	{0x062,	0x80000000}},
  { "B-c",	{ 450,	331,	50},	{0x0cd,	0x00000000}},
  { "B-d",	{ 558,	63,	50},	{0x08a,	0x00200000}},
  { "B-e",	{ 402,	-185,	50},	{0x096,	0x80000000}},
  { "B-f",	{187,	-100,	63},	{0x008,	0x80000000}},
  { "B-g",	{0,	62,	59},	{0x001,	0x80000000}},
  { "B-h",	{ 180,	275,	63},	{0x003,	0x00000000}},
  { "B-i",	{375,	70,	63},	{0x00e,	0x00000000}}
  /*..............................................|...|...*
  { "N-1",      {-223,  802,    626},   {0x000,	0}},
  { "N-2",      {-234,  965,    626},   {0x000,	0}}
  /*

  // old_alpha: 0
  { "old_alpha_1", {7.5, 42.5, 0.1}, {0, 0x000012} },
  { "old_alpha_2", {7.5, 55.0, 0.1}, {0, 0x000081} },

  // old_bold_eta: 2
  { "old_bold_eta_1", {30, 72.5, 0.1},  {0, 0x000108} },
  { "old_bold_eta_2", {32.5, 75, 0.1},  {0, 0x010004} },

  // old_gamma: 4
  { "old_gamma_1", {17.5, 42.5, 0.1}, {0, 0x000061} },
  { "old_gamma_2", {30, 42.5, 0.1},   {0, 0x001050} },
  { "old_gamma_3", {42.5, 42.5, 0.1}, {0, 0x000830} },

  // old_delta:7 
  { "old_delta_1", {17.5, 55, 0.1}, {0, 0x000302} },
  { "old_delta_2", {30, 57.5, 0.1}, {0, 0x000284} },
  { "old_delta_3", {42.5, 55, 0.1}, {0, 0x000980} },

  // old_epsilon: 10
  { "old_epsilon_1", {52.5, 55, 0.1}, {0, 0x002040} },
  { "old_epsilon_2", {52.5, 42.5, 0.1}, {0, 0x001200} },

  // old_zold_eta: 12
  { "old_zold_eta_1", {30, 32.5, 0.1}, {0, 0x002100} },
  { "old_zold_eta_2", {30, 17.5, 0.1}, {0, 0x005000} },

  // old_eta: 14
  { "old_eta_1", {32.5, 5, 0.1}, {0, 0x00a000} },
  { "old_eta_2", {30, 7.5, 0.1}, {0, 0x004008} }
  */
};

#define NR_POINTS (sizeof (points) / sizeof (points[0]))

typedef struct _path_bitmap_t {
  bitmap_t high, low;
} path_bitmap_t;

static void init_path_bitmap( path_bitmap_t *path) {
  path->high = 0;
  path->low = 0;
}

static bool within(struct position p,
		   struct region r) {
  return p.x >= r.bottomleft.x 
    && p.y >= r.bottomleft.y
    && p.z >= r.bottomleft.z

    && p.x <= r.topright.x
    && p.y <= r.topright.y
    && p.z <= r.topright.z;
}

static double sqr(double f) { 
  return f*f;
}

static inline bool is_set(path_bitmap_t *map, int i) {
  if (i > 31) {
    return (map->high & (1 << (i-32))) != 0;
  } else {
    return (map->low & (1 << i)) != 0;
  }
}

static inline void set(path_bitmap_t *map, int i) {
  if (i > 31) {
    map->high |= 1 << (i-32);
  } else {
    map->low  |= (1 << i);
  }
}

static inline bool full_set(path_bitmap_t *map) {
  return map->high == 0xf && map->low == 0xffffffff;
  //  return map == 0xFFFFFFFF;
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
    iprintf ("WARNING: (%4.1f, %4.1f, %4.1f) is not in any region.\n", a.x, a.y, a.z);
    if (a.x == 0.0 && a.y == 0.0) {
      kill(getpid(), SIGINT);
    }
  }
  if (!b_in_reg) {
    iprintf ("WARNING: (%4.1f, %4.1f, %4.1f) is not in any region.\n", b.x, b.y, b.z);
    if (b.x == 0.0 && b.y == 0.0) {
      kill(getpid(), SIGINT);
    }
  }
  return INFINITY;
}

#define MAX_BITMAPS ((MAX_WAYPOINTS) / INT_BITS)

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
    int offset;
    for (r=0; r<nwaypoints; ++r) {
      int r_local = r;
      if (r > 31) {
	offset = 0;
	r_local -= 32;
      } else {
	offset = 1;
      }
      if(inits[w].reachable_bitmap[offset] & (1 << r_local)) {
	//	iprintf ("  %s: bit %d of 0x%x is set, connecting to %s\n", 
	//		inits[w].comment, r, inits[w].reachable_bitmap, inits[r].comment);
	GET(*dest,w).distances[r] = rawDistance(GET(*dest,w).pos, inits[r].p);
      }  // all routing is now explicit.
      /*else {
	GET(*dest,w).distances[r] = distance(GET(*dest,w).pos, inits[r].p, regs);
	}*/
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
			   int pos, int dest,
			   path_bitmap_t seen,
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

  if (full_set(&seen)) { 
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
    if (is_set(&seen, GET(wpoints,j))) {
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
    if (!is_set(&seen, GET(wpoints,i))) {
      double val;

      PUSH_BACK(tmp, GET(wpoints,i));
      path_bitmap_t local_seen = seen;
      set(&local_seen, GET(wpoints,i));
      val = pathFindWork(&tmp, GET(wpoints,i), dest, local_seen, wmap, regs)
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
  path_bitmap_t seen;
  init_path_bitmap(&seen);
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
  set(&seen, i_p);
  return pathFindWork(destpath, i_p, i_d, seen, wmap, regs) != INFINITY;
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
  iprintf ("          \t                   ");

  for (i=0; i<SIZE(wmap); ++i) {
    iprintf("%6d ", i);
  }
  iprintf("\n");


  for (i=0; i<SIZE(wmap); ++i) {
    iprintf ("%d: %5s\t (%7.1f,%7.1f) ", i, points[i].comment,
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
	iprintf ("%6.1f%c", GET(wmap, i).distances[j], sep);
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


  char startbuffer[128];
  char endbuffer[128];
  iprintf ("Interactive mode. Hit Ctrl-C to exit.\n");
  while (true) {
    iprintf ("\nStart: ");
    fgets(startbuffer, 127, stdin);
    startbuffer[127] = 0;
    iprintf ("End: ");
    fgets(endbuffer, 127, stdin);
    endbuffer[127] = 0;

    char *s, *e;
    if (strchr(startbuffer, '\n')) {
      (*strchr(startbuffer, '\n')) = 0;
    }
    if (strchr(endbuffer, '\n')) {
      (*strchr(endbuffer, '\n')) = 0;
    }

    s = startbuffer;
    while (isspace(*s))
      s++;
    e = endbuffer;
    while (isspace(*e))
      e++;
    
    

    
    int start=-1, end=-1;
    for (i=0; i<SIZE(wmap) && start < 0; ++i) {
      if (!strcasecmp(s, points[i].comment)) {
	start = i;
      }
    }

    for (i=0; i<SIZE(wmap) && end < 0; ++i) {
      if (!strcasecmp(e, points[i].comment)) {
	end = i;
      }
    }

    if (start < 0) {
      iprintf("%s not found.\n", s);
      continue;
    }
    
    if (end < 0) {
      iprintf("%s not found.\n", e);
      continue;
    }
    
    iprintf ("Routing from %s to %s...\n", points[start].comment, 
	     points[end].comment);

    int_vec_t path;
    INIT(path);
    bool ret = pathFind(&path, GET(wmap, start).pos, GET(wmap, end).pos,
			&wmap, &regs);
    for (j=0; j<SIZE(path); ++j) {
      iprintf ("%s (%d) ", points[GET(path,j)].comment, 
	       GET(path,j));
    }
  } 
}
//#endif
