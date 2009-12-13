#!/usr/sbin/dtrace -s

BEGIN
{

  /*
   * NEW PLAN
   * ========
   *  Watch VM Entry for GAME_RUN_FRAME, the top-level simulation
   * routine.  Watch VM_Call(..,GAME_RUN_FRAME=8,...).  NO.  It 
   * doesn't do player movement, but it does do everything else!
   * INSTEAD, bg_pmove.c:PmoveSingle handles a single player movement.
   *
   *  That will get us total simulation time.  Per-user is tougher,
   * possibly unnecessary if we know N and the number of projectiles
   * being fired.
   *
   *  Next we need input and output packet processing times.  For
   * that, and the projectile count, we'll have to get better data on
   * the scene graph and synchronization system in place for quake.
   *
   * Packet processing time: SV_BuildClientSnapshot
   * Player processing time: CG_TransitionPlayerState (between snapshots)
   * a snapshot is a singular state of the system.  these are individually 
   * simulated and then transmitted.
   *
   * SV_Trace is a VM'd process for doing the actual collision work.
   *
   * Performance Analysis Ideas
   * --------------------------
   *
   * PLAN A ##################################################
   *  Figure out how to emit dtrace probes from within the VM.  Two
   * parts: (1) How to fire dtrace probes (2) How to make the VM 
   * fire them.
   *
   * PLAN B ##################################################
   *  Hardwire the performance counters into the vm'd code.  Would
   * that work right?  Or is the generated code in the .pk3 file,
   * which I'd have to rebuild.
   *
   * The .qvm files in the .pk3 are bytecode.  it still goes through
   * vm_x86 (_64?) before being run.
   * Questions:
   *  1. Generating instrumented code - do we have function boundaries
   *     that we can use?
   *  2. Letting the pid provider find it
   */
  vm_tmp = 0;
  vm_ttl = 0;
  vm_cnt = 0;

  /* INPUT PACKET PROCESSING */
  pk_tmp = 0; 
  pk_ttl = 0;
  pk_cnt = 0;

  /* OUTPUT PACKET CONSTRUCTION */
  snd_tmp = 0;
  snd_ttl = 0;
  snd_cnt = 0;
  
}

pid$1::VM_Call:entry
/ arg1 == 8 /
{
  vm_tmp = vtimestamp;
}

pid$1::VM_Call:return
/ arg1 == 8 /
{
  vm_tmp = vtimestamp - vm_tmp;
  vm_ttl += vm_tmp;
  vm_cnt++;
  @q["VM_Call(..,GAME_RUN_FRAME,..)"] = quantize(vm_tmp);
}

pid$1::SV_PacketEvent:entry
{
  pk_tmp = vtimestamp;
}

pid$1::SV_PacketEvent:return
{
  pk_tmp = vtimestamp - pk_tmp;
  pk_ttl += pk_tmp;
  pk_cnt++;
  @q["SV_PacketEvent"] = quantize(pk_tmp);
}

pid$1::SV_SendClientSnapshot:entry
{
  snd_tmp = vtimestamp;
}

pid$1::SV_SendClientSnapshot:return
{
  snd_tmp = vtimestamp - snd_tmp;
  snd_ttl += snd_tmp;
  snd_cnt++;
  @q["SV_SendClientSnapshot"] = quantize(snd_tmp);
}

END
{
  printf ("\n\n");
  vm_adj = vm_cnt == 0? 1:0;
  vm_cnt = vm_adj?1:vm_adj;

  pk_adj = pk_cnt == 0? 1:0;
  pk_cnt = pk_adj?1:pk_cnt;
  
  snd_adj = snd_cnt == 0? 1:0;
  snd_cnt = snd_adj?1:snd_cnt;
  
  printf ("GAME_RUN_FRAME:  % 9d nanoseconds.\n", vm_ttl / vm_cnt );
  printf ("                 % 9d samples.\n\n", vm_cnt);

  printf ("SV_PacketEvent:   % 9d nanoseconds.\n", pk_ttl / pk_cnt );
  printf ("                  % 9d samples.\n\n", pk_cnt);
  
  printf ("SV_SendClientSnapshot:   % 9d nanoseconds.\n", snd_ttl / snd_cnt );
  printf ("                         % 9d samples.\n\n", snd_cnt);
  

  printf ("HISTOGRAM DATA:\n");
  printa(q);
}
