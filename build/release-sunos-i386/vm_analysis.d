#!/usr/sbin/dtrace -s

BEGIN
{
  moverteam_tmp = 0;
  moverteam_ttl = 0;
  moverteam_cnt = 0;

  runmover_tmp = 0;
  runmover_ttl = 0;
  runmover_cnt = 0;

  moverpush_tmp = 0;
  moverpush_cnt = 0;
  moverpush_ttl = 0;
}

/* ____________________
 * G_MoverTeam
 */
pid$1::G_MoverTeam:entry
{
  moverteam_tmp = vtimestamp;
}


pid$1::G_MoverTeam:return
/moverteam_tmp != 0/
{
  moverteam_tmp = vtimestamp - moverteam_tmp;
  moverteam_cnt += moverteam_tmp;
  moverteam_ttl++;
  @q["G_MoverTeam"] = quantize(moverteam_tmp);
}

/* ____________________
 * G_RunMover
 */
pid$1::G_RunMover:entry
{
  runmover_tmp = vtimestamp;
}


pid$1::G_RunMover:return
/runmover_tmp != 0/
{
  runmover_tmp = vtimestamp - runmover_tmp;
  runmover_cnt += runmover_tmp;
  runmover_ttl++;
  @q["G_RunMover"] = quantize(runmover_tmp);
}


/* ____________________
 * G_MoverPush
 */

pid$1::G_MoverPush:entry
{
  moverpush_tmp = vtimestamp;
}


pid$1::G_MoverPush:return
/moverpush_tmp != 0/
{
  moverpush_tmp = vtimestamp - moverpush_tmp;
  moverpush_cnt += moverpush_tmp;
  moverpush_ttl++;
  @q["G_MoverPush"] = quantize(moverpush_tmp);
}

END
{
  printf ("\n\n");
  moverteam_adj = moverteam_cnt == 0? 1:0;
  moverteam_cnt = moverteam_adj?1:moverteam_cnt;
  
  runmover_adj = runmover_cnt == 0? 1:0;
  runmover_cnt = runmover_adj?1:runmover_cnt;
  
  moverpush_adj = moverpush_cnt == 0? 1:0;
  moverpush_cnt = moverpush_adj?1:moverpush_cnt;
  
  printf ("G_MoverTeam:  % 9d nanoseconds.\n", moverteam_ttl / moverteam_cnt );
  printf ("              % 9d samples.\n\n", moverteam_cnt);

  printf ("G_RunMover:   % 9d nanoseconds.\n", runmover_ttl / runmover_cnt );
  printf ("              % 9d samples.\n\n", runmover_cnt);
  
  printf ("G_MoverPush:  % 9d nanoseconds.\n", moverpush_ttl / moverpush_cnt );
  printf ("              % 9d samples.\n\n", moverpush_cnt);
  

  printf ("HISTOGRAM DATA:\n");
  printa(q);
}
