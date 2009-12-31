#ifndef INCLUDE_LS_RENDER
#define INCLUDE_LS_RENDER

/*
 * A no-render version of the renderer.  Hopefully this and some
 * argc/argv tweaks will make ioquake3 a headless renderer.
 */
#include "../qcommon/q_shared.h"
#include "../renderer/tr_public.h"

qboolean LS_Headless (void);
refexport_t* LS_GetRefAPI(refimport_t *);

#endif /* INCLUDE_LS_RENDER */
