#ifndef INCLUDE_VECTOR_H
#define INCLUDE_VECTOR_H

#include <assert.h>

struct vec_basis {
  int count, capacity;
  unsigned char * store;
};

int vector_init(struct vec_basis* basis);
int vector_push(struct vec_basis* basis, 
		unsigned char * object,
		int size);

int vector_erase(struct vec_basis* basis,
		 int index,
		 int size);

int vector_free(struct vec_basis* basis);
int vector_copy(struct vec_basis* dest,
		struct vec_basis* src,
		int sz);

#define DEFVECTOR(name, typ)	       \
  typedef union _##name {	       \
    struct vec_basis basis;	       \
    struct {			       \
      int count, capacity;	       \
      typ *store;		       \
    } vec;			       \
  } name; 

#define INIT(vc) vector_init(&(vc).basis)
#define SIZE(vc) ((vc).vec.count)
#define GET(vc, idx)	((vc).vec.store[(idx)])
#define RESIZE(vc, sz) (vector_resize(&(vc), (sz), sizeof((vc).vec.store[0])))

// do { assert ((vc).vec.count >= (sz)); (vc).vec.count = (sz); } while (0)

#define BEGIN(vc) ((vc).vec.store)
#define PUSH_BACK(vc, elem)						\
  (vector_push(&(vc).basis, (unsigned char*) &(elem),			\
	       sizeof((vc).vec.store[0])))

#define CLEAR(vc) do {				\
    (vc).vec.count = 0;				\
  } while (0)

#define ERASE(vc, idx)						\
  (vector_erase(&(vc).basis, idx, sizeof((vc).vec.store[0])))

#define DESTROY(vc) (vector_free(&(vc)))
#define COPY(dst,src) do {						\
  assert(sizeof((src).vec.store[0]) == sizeof((dst).vec.store[0]));	\
  vector_copy(&(dst).basis, &(src).basis, sizeof((src).vec.store[0]));	\
  } while (0)

#endif /* VECTOR_H */
