#ifndef INCLUDE_LS_CORE
#define INCLUDE_LS_CORE
// ls_core.h

// ----------------------------------------------------------------------------
//						 Load Simulation Core
// ----------------------------------------------------------------------------
//
//      Purpose: Provide a load simulation interface
//  Description: The load simulation interface provides a client-side
//   interface to initializing, running and interfacing an instance of
//   botlib designed to run in leu of an actual player.  The load
//   simulator will be aware of its environment and respond to other
//   users, but look like a logged-in human to other players.

#include "../qcommon/q_shared.h"
#include "../botlib/botlib.h"
struct clientActive_s;
struct clientStatic_s;

qboolean LS_Initialize(botlib_export_t **result);
qboolean LS_Enabled (void);
qboolean LS_Connect (void);
usercmd_t LS_CreateCmd (void);

void ls_headless(qboolean enabled);
void ls_simulate(qboolean enabled);

void LS_SetPointers(struct clientActive_s *, struct clientStatic_s *);
#endif /* INCLUDE_LS_CORE */
