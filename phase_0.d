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
}

pid$1::VM_Call:return
/arg1 == 8/
{
        RunFrame_tmp = (vtimestamp - RunFrame_tmp);
        @["RunFrame"] = quantize(RunFrame_tmp/1000);
        RunFrame_cnt++;
        RunFrame_ttl += RunFrame_tmp;
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
        Timeout_tmp = vtimestamp;
}

pid$1::SV_SendClientMessages:return
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

quake$1:::sim-player-end
{
        Player_tmp = (vtimestamp - Player_tmp);
        @["Player"] = quantize(Player_tmp/1000);
        Player_cnt++;
        Player_ttl += Player_tmp;
}

END {
    t_total = (walltimestamp - t_total) / 1000;

    printf("\n");
    printf("Total Running time: %d usec\npn", t_total);

    
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

}
