#!/usr/sbin/dtrace -s

BEGIN
{
/*  
    Let INFrame = time in IN_Frame
        COMFrame = time in Com_Frame
        Ping = time in SV_CalcPings
        RunFrame = time in VM_Call(GAME_RUN_FRAME)
        Timeout = time in SV_CheckTimeouts
        Send = time in SV_SendClientMessages
        Player = time per player in ClientThink_Real

    Units are microseconds.  `vtimestamp` returns nanoseconds.

    Parameters (as always): N = total number of logged-in users

    For each variable (INFrame,...Send), we'll have a pure average here,
    and a histogram in @.
*/


        INFrame_tmp = 0;
        INFrame_ttl = 0;
        INFrame_cnt = 0;

        COMFrame_tmp = 0;
        COMFrame_ttl = 0;
        COMFrame_cnt = 0;

        Ping_tmp = 0;
        Ping_ttl = 0;
        Ping_cnt = 0;

        /* The last arg1 for VM_Call that we tracked.  Used for the :return */
        vm_mode = -1;

        RunFrame_tmp = 0;
        RunFrame_ttl = 0;
        RunFrame_cnt = 0;

        Timeout_tmp = 0;
        Timeout_ttl = 0;
        Timeout_cnt = 0;

        Send_tmp = 0;
        Send_ttl = 0;
        Send_cnt = 0;

        Player_tmp = 0;
        Player_ttl = 0;
        Player_cnt = 0;

        /* weapon tracking */
        Rocket_tmp = 0;
        Rocket_ttl = 0;
        Rocket_cnt = 0;
        Rail_tmp = 0;
        Rail_ttl = 0;
        Rail_cnt = 0;
        Shotgun_tmp = 0;
        Shotgun_ttl = 0;
        Shotgun_cnt = 0;
        weapon_fire_mode = -1;

        /* Entity Tracking */
        NEntity_cnt = 0;
        NShotgun_ttl = 0;
        NRail_ttl = 0;
        NRocket_ttl = 0;
        NPlayer_ttl = 0;

        /* Rocket Simulation */
        RocketSim_tmp =0;
        RocketSim_cnt =0;
        RocketSim_ttl =0;
        t_total = walltimestamp;
}


pid$1::IN_Frame:entry
{
        INFrame_tmp = vtimestamp;
}

pid$1::IN_Frame:return
{
        INFrame_tmp = (vtimestamp - INFrame_tmp);
        @["INFrame"] = quantize(INFrame_tmp/1000);
        INFrame_cnt++;
        INFrame_ttl += INFrame_tmp;
}

pid$1::Com_Frame:entry
{
        COMFrame_tmp = vtimestamp;
}

pid$1::Com_Frame:return
{
        COMFrame_tmp = (vtimestamp - COMFrame_tmp);
        @["COMFrame"] = quantize(COMFrame_tmp/1000);
        COMFrame_cnt++;
        COMFrame_ttl += COMFrame_tmp;
}

pid$1::SV_CalcPings:entry
{
        Ping_tmp = vtimestamp;
}
pid$1::SV_CalcPings:return
{
        Ping_tmp = (vtimestamp - Ping_tmp);
        @["Ping"] = quantize(Ping_tmp/1000);
        Ping_cnt++;
        Ping_ttl += Ping_tmp;
}

/* SV_Frame: VM_Call(gvm, GAME_RUN_FRAME (8), sv.time) */

pid$1::VM_Call:entry
/arg1 == 8/
{
        RunFrame_tmp = vtimestamp;
        vm_mode = 8;
}

pid$1::VM_Call:return
/vm_mode == 8/
{
        RunFrame_tmp = (vtimestamp - RunFrame_tmp);
        @["RunFrame"] = quantize(RunFrame_tmp/1000);
        RunFrame_cnt++;
        RunFrame_ttl += RunFrame_tmp;
        vm_mode = -1;
}

pid$1::SV_CheckTimeouts:entry
{
        Timeout_tmp = vtimestamp;
}

pid$1::SV_CheckTimeouts:return
{
        Timeout_tmp = (vtimestamp - Timeout_tmp);
        @["Timeout"] = quantize(Timeout_tmp/1000);
        Timeout_cnt++;
        Timeout_ttl += Timeout_tmp;
}


pid$1::SV_SendClientMessages:entry
{
        Send_tmp = vtimestamp;
}

pid$1::SV_SendClientMessages:return
/Send_tmp != 0/
{
        Send_tmp = (vtimestamp - Send_tmp);
        @["Send"] = quantize(Send_tmp/1000);
        Send_cnt++;
        Send_ttl += Send_tmp;
}

quake$1:::sim-player-start
{       
        Player_tmp = vtimestamp;
}

quake$1:::sim-player-abort
{
        Player_tmp = -1;
}

quake$1:::sim-player-end 
/ Player_tmp != -1 /
{
        Player_tmp = (vtimestamp - Player_tmp);
        @["Player"] = quantize(Player_tmp/1000);
        Player_cnt++;
        Player_ttl += Player_tmp;
}

/*******************************
 * weapon-fire-start for Rockets 
 */
quake$1:::weapon-fire-start
/ arg0 == 0 /
{
        Rocket_tmp = vtimestamp;
        weapon_fire_mode = arg0;
}

quake$1:::weapon-fire-end
/ arg0 == 0 && weapon_fire_mode == 0 && Rocket_tmp != 0/
{
        Rocket_tmp = vtimestamp - Rocket_tmp;
        @["RocketFire"] = quantize(Rocket_tmp/1000);
        Rocket_ttl += Rocket_tmp;
        Rocket_cnt++;
        Rocket_tmp = 0;
        weapon_fire_mode = -1;
}

/*******************************
 * weapon-fire-start for Rails 
 */
quake$1:::weapon-fire-start
/ arg0 == 1 /
{
        Rail_tmp = vtimestamp;
        weapon_fire_mode = arg0;
}

quake$1:::weapon-fire-end
/ arg0 == 1 && weapon_fire_mode == 1 && Rail_tmp != 0/
{
        Rail_tmp = vtimestamp - Rail_tmp;
        @["RailFire"] = quantize(Rail_tmp/1000);
        Rail_ttl += Rail_tmp;
        Rail_cnt++;
        Rail_tmp = 0;
        weapon_fire_mode = -1;
}

/****************************** 
 * weapon-fire-start for Shotgun Pellets 
 */
quake$1:::weapon-fire-start
/ arg0 == 2 /
{
        Shotgun_tmp = vtimestamp;
        weapon_fire_mode = arg0;
}

quake$1:::weapon-fire-end
/ arg0 == 2 && weapon_fire_mode == 2  && Shotgun_tmp != 0/
{
        Shotgun_tmp = vtimestamp - Shotgun_tmp;
        @["ShotgunFire"] = quantize(Shotgun_tmp/1000);
        Shotgun_ttl += Shotgun_tmp;
        Shotgun_cnt++;
        Shotgun_tmp = 0;
        weapon_fire_mode = -1;
}

/*******************************
 * Entity Counts
 */
quake$1:::entity-counts
{
        NEntity_cnt++;
        NPlayer_ttl += arg0;
        NRocket_ttl += arg1;
        NRail_ttl += arg2;
        NShotgun_ttl += arg3;
}

/*******************************
 * Missile Simulation
 */
quake$1:::sim-proj-start
{
        RocketSim_tmp = vtimestamp;
}

quake$1:::sim-proj-end
/ RocketSim_tmp != 0 /
{
        RocketSim_tmp = vtimestamp - RocketSim_tmp;
        @["RocketSim"] = quantize(RocketSim_tmp/1000);
        RocketSim_ttl += RocketSim_tmp;
        RocketSim_cnt++;
        RocketSim_tmp = 0;
}

END {
    t_total = (walltimestamp - t_total) / 1000;

    printf("\n");
    printf("\n************************************************************\n\n");

    printf("        Total Running time: %d usec\n", t_total);

    printf("\n************************************************************\n\n");
    
    printf("INFrame   Average: %d nanoseconds\n", INFrame_ttl / (INFrame_cnt == 0? 1:INFrame_cnt));
    printf("         NSamples: %d. Valid: %s\n", INFrame_cnt, (INFrame_cnt == 0)? "NO": "yes");

    printf("COMFrame   Average: %d nanoseconds\n", COMFrame_ttl / (COMFrame_cnt == 0? 1:COMFrame_cnt));
    printf("          NSamples: %d. Valid: %s\n", COMFrame_cnt, (COMFrame_cnt == 0)? "NO": "yes");

    printf("Ping   Average: %d nanoseconds\n", Ping_ttl / (Ping_cnt == 0? 1:Ping_cnt));
    printf("      NSamples: %d. Valid: %s\n", Ping_cnt, (Ping_cnt == 0)? "NO": "yes");

    printf("RunFrame   Average: %d nanoseconds\n", RunFrame_ttl / (RunFrame_cnt == 0? 1:RunFrame_cnt));
    printf("          NSamples: %d. Valid: %s\n", RunFrame_cnt, (RunFrame_cnt == 0)? "NO": "yes");

    printf("Timeout   Average: %d nanoseconds\n", Timeout_ttl / (Timeout_cnt == 0? 1:Timeout_cnt));
    printf("         NSamples: %d. Valid: %s\n", Timeout_cnt, (Timeout_cnt == 0)? "NO": "yes");

    printf("Send   Average: %d nanoseconds\n", Send_ttl / (Send_cnt == 0? 1:Send_cnt));
    printf("         NSamples: %d. Valid: %s\n", Send_cnt, (Send_cnt == 0)? "NO": "yes");

    printf("Player   Average: %d nanoseconds\n", Player_ttl / (Player_cnt == 0? 1:Player_cnt));
    printf("         NSamples: %d. Valid: %s\n", Player_cnt, (Player_cnt == 0)? "NO": "yes");

    printf("\n************************************************************\n\n");

    printf("Rocket Launch   Average: %d nanoseconds\n", Rocket_ttl / (Rocket_cnt == 0? 1:Rocket_cnt));
    printf("               NSamples: %d. Valid: %s\n", Rocket_cnt, (Rocket_cnt == 0)? "NO": "yes");

    printf("Rail Fire   Average: %d nanoseconds\n", Rail_ttl / (Rail_cnt == 0? 1:Rail_cnt));
    printf("           NSamples: %d. Valid: %s\n", Rail_cnt, (Rail_cnt == 0)? "NO": "yes");

    printf("Shotgun Fire   Average: %d nanoseconds\n", Shotgun_ttl / (Shotgun_cnt == 0? 1:Shotgun_cnt));
    printf("              NSamples: %d. Valid: %s\n", Shotgun_cnt, (Shotgun_cnt == 0)? "NO": "yes");

    printf("\n************************************************************\n\n");
    
    printf("Sampled Player Average: \t%d.  \tTotal: %d\tNSamples: %d\n", NPlayer_ttl / (NEntity_cnt == 0? 1:NEntity_cnt), 
           NPlayer_ttl, NEntity_cnt);
    printf("Sampled Rocket Average*1k: \t%d.  \tTotal: %d\tNSamples: %d\n", (NRocket_ttl*1000) / (NEntity_cnt == 0? 1:NEntity_cnt), 
           NRocket_ttl, NEntity_cnt);
    printf("Sampled Rail Average*1k: \t%d.  \tTotal: %d\tNSamples: %d\n", (NRail_ttl*1000) / (NEntity_cnt == 0? 1:NEntity_cnt), 
           NRail_ttl, NEntity_cnt);
    printf("Sampled Shotgun Average*1k: \t%d.  \tTotal: %d\tNSamples: %d\n", (NShotgun_ttl*1000) / (NEntity_cnt == 0? 1:NEntity_cnt), 
           NShotgun_ttl, NEntity_cnt);

}
