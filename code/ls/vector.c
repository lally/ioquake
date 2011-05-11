#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "vector.h"

int vector_init(struct vec_basis* basis) {
  assert(basis);
  basis->count = basis->capacity = 0;
  basis->store = 0;
}

int vector_push(struct vec_basis* basis, unsigned char* object, int sz) {
  if (basis->capacity == basis->count) {
    int newcap = basis->capacity? basis->capacity * 2 : 8;
    basis->store = (unsigned char*) realloc((void *)basis->store, (size_t) (sz * newcap));
    basis->capacity = newcap;
  }
  unsigned char *dest = basis->store + (sz * basis->count);
  while (sz--) { *dest++ = *object++; }
  return ++(basis->count);
}

int vector_resize(struct vec_basis* basis, int newcount, int sz) {
  if (newcount > basis->capacity) {
    basis->store = (unsigned char*) realloc(basis->store, sz * newcount);
    basis->capacity = newcount;
  }
  basis->count = newcount;
}

int vector_erase(struct vec_basis* basis, int index, int sz) {
  unsigned char *dest = basis->store + (sz * index);
  unsigned char *src = basis->store + (sz * (index+1));
  memmove(dest, src, sz * (basis->count - index -1));
  return --(basis->count);
}

int vector_free(struct vec_basis* basis) {
  free(basis->store);
  basis->count = 0;
  basis->capacity = 0;
  return 0;
}

int vector_copy(struct vec_basis* dest, struct vec_basis* src,
		int sz) {
  vector_resize(dest, src->count, sz);
  memcpy(dest->store, src->store, sz * src->count);
  return src->count;
}

