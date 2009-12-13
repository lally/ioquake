export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $81
ADDRGP4 $80
JUMPV
LABELV $81
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $83
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $80
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
ADDRGP4 $86
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $85
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $84
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
ADDRGP4 $86
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $85
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $88
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
ADDRGP4 $91
ARGP4
ADDRGP4 cg+109044+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109412+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $90
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
ADDRGP4 cg+110460
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $103
ADDRGP4 cg+110460
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
ADDRGP4 cg+114320
INDIRI4
CNSTI4 0
NEI4 $104
ADDRGP4 cg+114320
CNSTI4 1
ASGNI4
ADDRGP4 cg+110464
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRGP4 cg+114320
CNSTI4 1
ASGNI4
LABELV $104
LABELV $102
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
ADDRGP4 cg+114320
INDIRI4
CNSTI4 0
EQI4 $117
ADDRGP4 cg+114320
CNSTI4 0
ASGNI4
ADDRGP4 cg+114328
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $117
LABELV $116
endproc CG_ScoresUp_f 0 0
proc CG_LoadHud_f 1028 12
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 String_Init
CALLV
pop
ADDRGP4 Menu_Reset
CALLV
pop
ADDRGP4 $124
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRLP4 1024
ADDRLP4 0
ASGNP4
ADDRLP4 1024
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $125
ADDRLP4 1024
ADDRGP4 $127
ASGNP4
LABELV $125
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 CG_LoadMenus
CALLV
pop
ADDRGP4 menuScoreboard
CNSTP4 0
ASGNP4
LABELV $123
endproc CG_LoadHud_f 1028 12
proc CG_scrollScoresDown_f 0 12
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $129
ADDRGP4 cg+114324
INDIRI4
CNSTI4 0
EQI4 $129
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
LABELV $129
LABELV $128
endproc CG_scrollScoresDown_f 0 12
proc CG_scrollScoresUp_f 0 12
ADDRGP4 menuScoreboard
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $133
ADDRGP4 cg+114324
INDIRI4
CNSTI4 0
EQI4 $133
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
ADDRGP4 menuScoreboard
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Menu_ScrollFeeder
CALLV
pop
LABELV $133
LABELV $132
endproc CG_scrollScoresUp_f 0 12
proc CG_spWin_f 0 12
ADDRGP4 $137
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $139
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $141
ARGP4
ADDRGP4 $142
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $145
ARGP4
ADDRGP4 $146
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 cgs+152340+864
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $149
ARGP4
CNSTI4 144
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
LABELV $136
endproc CG_spWin_f 0 12
proc CG_spLose_f 0 12
ADDRGP4 $137
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $139
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $141
ARGP4
ADDRGP4 $142
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $145
ARGP4
ADDRGP4 $146
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 cgs+152340+868
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $153
ARGP4
CNSTI4 144
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
LABELV $150
endproc CG_spLose_f 0 12
proc CG_TellTarget_f 264 20
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $155
ADDRGP4 $154
JUMPV
LABELV $155
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $154
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $159
ADDRGP4 $158
JUMPV
LABELV $159
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $158
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $162
ADDRGP4 $161
JUMPV
LABELV $162
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $164
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $161
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $166
ADDRGP4 $165
JUMPV
LABELV $166
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $164
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $165
endproc CG_VoiceTellAttacker_f 264 20
proc CG_NextTeamMember_f 0 0
ADDRGP4 CG_SelectNextPlayer
CALLV
pop
LABELV $168
endproc CG_NextTeamMember_f 0 0
proc CG_PrevTeamMember_f 0 0
ADDRGP4 CG_SelectPrevPlayer
CALLV
pop
LABELV $169
endproc CG_PrevTeamMember_f 0 0
proc CG_NextOrder_f 16 0
ADDRLP4 0
CNSTI4 1708
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 0
NEI4 $175
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $175
ADDRGP4 $170
JUMPV
LABELV $175
LABELV $173
ADDRGP4 cgs+152280
INDIRI4
CNSTI4 7
GEI4 $179
ADDRLP4 4
ADDRGP4 cgs+152280
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 cgs+152280
INDIRI4
CNSTI4 5
NEI4 $183
ADDRLP4 8
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $186
ADDRLP4 12
ADDRGP4 cgs+152280
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
LABELV $183
ADDRGP4 cgs+152280
INDIRI4
CNSTI4 6
NEI4 $180
ADDRLP4 8
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $180
ADDRLP4 12
ADDRGP4 cgs+152280
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $180
JUMPV
LABELV $179
ADDRGP4 cgs+152280
CNSTI4 1
ASGNI4
LABELV $180
ADDRGP4 cgs+152284
CNSTI4 1
ASGNI4
ADDRGP4 cgs+152288
ADDRGP4 cg+107604
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
LABELV $170
endproc CG_NextOrder_f 16 0
proc CG_ConfirmOrder_f 8 12
ADDRGP4 $200
ARGP4
ADDRGP4 cgs+152304
INDIRI4
ARGI4
ADDRGP4 $202
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $203
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+152296
INDIRI4
GEI4 $204
ADDRGP4 $208
ARGP4
ADDRGP4 cgs+152300
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
ADDRGP4 cgs+152296
CNSTI4 0
ASGNI4
LABELV $204
LABELV $199
endproc CG_ConfirmOrder_f 8 12
proc CG_DenyOrder_f 4 12
ADDRGP4 $200
ARGP4
ADDRGP4 cgs+152304
INDIRI4
ARGI4
ADDRGP4 $213
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $214
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+152296
INDIRI4
GEI4 $215
ADDRGP4 cgs+152296
CNSTI4 0
ASGNI4
LABELV $215
LABELV $211
endproc CG_DenyOrder_f 4 12
proc CG_TaskOffense_f 4 8
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $225
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $221
LABELV $225
ADDRGP4 $226
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $222
JUMPV
LABELV $221
ADDRGP4 $226
ARGP4
ADDRGP4 $228
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $222
ADDRGP4 $208
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $220
endproc CG_TaskOffense_f 4 8
proc CG_TaskDefense_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $230
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $229
endproc CG_TaskDefense_f 8 8
proc CG_TaskPatrol_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $232
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $231
endproc CG_TaskPatrol_f 8 8
proc CG_TaskCamp_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $234
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $233
endproc CG_TaskCamp_f 8 8
proc CG_TaskFollow_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $236
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $235
endproc CG_TaskFollow_f 8 8
proc CG_TaskRetrieve_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $238
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $237
endproc CG_TaskRetrieve_f 8 8
proc CG_TaskEscort_f 8 8
ADDRGP4 $226
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
ADDRGP4 $208
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $239
endproc CG_TaskEscort_f 8 8
proc CG_TaskOwnFlag_f 4 8
ADDRGP4 $226
ARGP4
ADDRGP4 $242
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $241
endproc CG_TaskOwnFlag_f 4 8
proc CG_TauntKillInsult_f 0 4
ADDRGP4 $244
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $243
endproc CG_TauntKillInsult_f 0 4
proc CG_TauntPraise_f 0 4
ADDRGP4 $246
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $245
endproc CG_TauntPraise_f 0 4
proc CG_TauntTaunt_f 0 4
ADDRGP4 $248
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $247
endproc CG_TauntTaunt_f 0 4
proc CG_TauntDeathInsult_f 0 4
ADDRGP4 $250
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $249
endproc CG_TauntDeathInsult_f 0 4
proc CG_TauntGauntlet_f 0 4
ADDRGP4 $252
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $251
endproc CG_TauntGauntlet_f 0 4
proc CG_TaskSuicide_f 136 16
ADDRLP4 132
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 132
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $254
ADDRGP4 $253
JUMPV
LABELV $254
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $256
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
LABELV $253
endproc CG_TaskSuicide_f 136 16
proc CG_StartOrbit_f 1028 12
ADDRGP4 $258
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $259
ADDRGP4 $257
JUMPV
LABELV $259
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $261
ADDRGP4 $137
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $141
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $262
JUMPV
LABELV $261
ADDRGP4 $137
ARGP4
ADDRGP4 $264
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $141
ARGP4
ADDRGP4 $142
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $145
ARGP4
ADDRGP4 $146
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $262
LABELV $257
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $266
address CG_TestGun_f
address $267
address CG_TestModel_f
address $268
address CG_TestModelNextFrame_f
address $269
address CG_TestModelPrevFrame_f
address $270
address CG_TestModelNextSkin_f
address $271
address CG_TestModelPrevSkin_f
address $272
address CG_Viewpos_f
address $273
address CG_ScoresDown_f
address $274
address CG_ScoresUp_f
address $275
address CG_ZoomDown_f
address $276
address CG_ZoomUp_f
address $277
address CG_SizeUp_f
address $278
address CG_SizeDown_f
address $279
address CG_NextWeapon_f
address $280
address CG_PrevWeapon_f
address $281
address CG_Weapon_f
address $282
address CG_TellTarget_f
address $283
address CG_TellAttacker_f
address $284
address CG_VoiceTellTarget_f
address $285
address CG_VoiceTellAttacker_f
address $286
address CG_TargetCommand_f
address $287
address CG_LoadHud_f
address $288
address CG_NextTeamMember_f
address $289
address CG_PrevTeamMember_f
address $290
address CG_NextOrder_f
address $291
address CG_ConfirmOrder_f
address $292
address CG_DenyOrder_f
address $293
address CG_TaskOffense_f
address $294
address CG_TaskDefense_f
address $295
address CG_TaskPatrol_f
address $296
address CG_TaskCamp_f
address $297
address CG_TaskFollow_f
address $298
address CG_TaskRetrieve_f
address $299
address CG_TaskEscort_f
address $300
address CG_TaskSuicide_f
address $301
address CG_TaskOwnFlag_f
address $302
address CG_TauntKillInsult_f
address $303
address CG_TauntPraise_f
address $304
address CG_TauntTaunt_f
address $305
address CG_TauntDeathInsult_f
address $306
address CG_TauntGauntlet_f
address $307
address CG_spWin_f
address $308
address CG_spLose_f
address $309
address CG_scrollScoresDown_f
address $310
address CG_scrollScoresUp_f
address $311
address CG_StartOrbit_f
address $312
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $314
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $318
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $318
LABELV $315
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $317
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 47
LTU4 $314
CNSTI4 0
RETI4
LABELV $313
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
LABELV $323
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 47
LTU4 $322
ADDRGP4 $326
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $327
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $328
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $329
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $330
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $331
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $332
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $333
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $334
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $335
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $336
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $337
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $338
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $339
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $340
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $341
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $342
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $343
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $344
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $345
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $346
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $347
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $348
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $349
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $350
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $351
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
ADDRGP4 $352
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
LABELV $321
endproc CG_InitConsoleCommands 4 4
import menuScoreboard
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isintegral
import Q_isanumber
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Com_HexStrToInt
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import Q_isnan
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $352
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $351
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $350
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $349
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $348
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $347
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $346
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $345
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $344
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $343
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $342
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $341
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $340
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $339
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $338
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $337
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $336
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $335
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $334
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $333
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $332
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $331
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $330
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $329
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $328
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $327
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $326
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $312
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $311
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $310
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $309
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $308
byte 1 115
byte 1 112
byte 1 76
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $307
byte 1 115
byte 1 112
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $306
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $305
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $304
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $303
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 80
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $302
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 73
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $301
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 119
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $300
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 83
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $299
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 69
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $298
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $297
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $296
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $295
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $294
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $293
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 79
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $292
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $291
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $290
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $289
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $288
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $287
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 104
byte 1 117
byte 1 100
byte 1 0
align 1
LABELV $286
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $285
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $284
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $283
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $282
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $280
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $279
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $278
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $277
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $276
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $275
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $274
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $273
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $272
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $271
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $270
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $269
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $268
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $267
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $266
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $264
byte 1 53
byte 1 0
align 1
LABELV $258
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $256
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $252
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 97
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $250
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $246
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $244
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $242
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $240
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $238
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $236
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $234
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $232
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $230
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $227
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $226
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $214
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 54
byte 1 0
align 1
LABELV $213
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $208
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 53
byte 1 0
align 1
LABELV $202
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $153
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 76
byte 1 79
byte 1 83
byte 1 69
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $149
byte 1 89
byte 1 79
byte 1 85
byte 1 32
byte 1 87
byte 1 73
byte 1 78
byte 1 33
byte 1 0
align 1
LABELV $146
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $144
byte 1 48
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 49
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $140
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $138
byte 1 50
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $127
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $109
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $86
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $85
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
