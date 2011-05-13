#include "vector.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

DEFVECTOR(intvec_t, int);

int main(int args, char **argv) {
  int i;
  int values[] = { 1, 2, 3, 4, 5, 6 };
  intvec_t vec;
  intvec_t* vecp = &vec;

  INIT(*vecp);
  assert(vec.vec.count == 0);
  assert(vec.vec.capacity == 0);
  
  assert(SIZE(vec) == 0);
  for (i=0; i<6; ++i) { PUSH_BACK(*vecp, values[i]); }
  
  for (i=0; i<6; ++i) { assert(GET(*vecp, i) == values[i]); }

  CLEAR(*vecp);
  assert(SIZE(vec) == 0);

  assert(vec.vec.capacity >= 6);
  
  for (i=0; i<6; ++i) { PUSH_BACK(*vecp, values[i]); }
  ERASE(*vecp, 2);
  assert(SIZE(*vecp) == 5);
  assert(GET(*vecp, 4) == 6);
  assert(GET(*vecp, 2) == 4);

  intvec_t vec2;
  INIT(vec2);
  COPY(vec2, vec);

  for (i=0; i<SIZE(vec); ++i) { assert(GET(vec2,i) == GET(vec,i)); }

  assert(printf("all pass.\n"));
  assert((exit(0),1));

  printf("assert() is disabled.  Cannot test.\n");
  return 1;
}
