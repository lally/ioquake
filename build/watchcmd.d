#!/usr/sbin/dtrace -s

BEGIN
{
	new_cmds = 0;
	ls_enabled =0;
	ls_passed = 0;
	ls_failed = 0;
	ls_createcmd = 0;
}


pid$1::CL_CreateNewCommands:entry
{
	new_cmds++;
}


pid$1::LS_Enabled:return
{
	@ls_enabled_stacks[ustack()] = count();
	ls_enabled++;
	ls_passed += arg1!=0? 1:0;
	ls_failed += arg1==0? 1:0;
}

pid$1::LS_CreateCmd:entry
{
	ls_createcmd++;
}

tick-1s
{
	printf("\n CL_CreateNewCommands:%8d LS_Enabled: %8d (%d/%d) LS_CreateCmd: %8d",
		   new_cmds,
		   ls_enabled,
		   ls_passed,
		   ls_failed,
		   ls_createcmd);
}

