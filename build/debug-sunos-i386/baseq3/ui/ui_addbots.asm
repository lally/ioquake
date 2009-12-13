code
proc UI_AddBotsMenu_FightEvent 16 20
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
ADDRGP4 $69
JUMPV
LABELV $70
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1152+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1152+76
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 addBotsMenuInfo+1056+64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $78
ARGP4
ADDRGP4 addBotsMenuInfo+1436
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5536
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 addBotsMenuInfo+1428
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRLP4 12
ADDRGP4 addBotsMenuInfo+1428
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
LABELV $69
endproc UI_AddBotsMenu_FightEvent 16 20
proc UI_AddBotsMenu_BotEvent 0 0
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $84
ADDRGP4 $83
JUMPV
LABELV $84
CNSTI4 72
ADDRGP4 addBotsMenuInfo+1436
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+68
ADDP4
ADDRGP4 color_orange
ASGNP4
ADDRGP4 addBotsMenuInfo+1436
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
CNSTI4 72
ADDRGP4 addBotsMenuInfo+1436
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+68
ADDP4
ADDRGP4 color_white
ASGNP4
LABELV $83
endproc UI_AddBotsMenu_BotEvent 0 0
proc UI_AddBotsMenu_BackEvent 0 0
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $94
ADDRGP4 $93
JUMPV
LABELV $94
ADDRGP4 UI_PopMenu
CALLV
pop
LABELV $93
endproc UI_AddBotsMenu_BackEvent 0 0
proc UI_AddBotsMenu_SetBotNames 16 12
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
ADDRGP4 addBotsMenuInfo+1432
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1440
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5536
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $98
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $97
LABELV $96
endproc UI_AddBotsMenu_SetBotNames 16 12
proc UI_AddBotsMenu_UpEvent 4 0
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $107
ADDRGP4 $106
JUMPV
LABELV $107
ADDRGP4 addBotsMenuInfo+1432
INDIRI4
CNSTI4 0
LEI4 $109
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1432
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
LABELV $109
LABELV $106
endproc UI_AddBotsMenu_UpEvent 4 0
proc UI_AddBotsMenu_DownEvent 4 0
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $114
ADDRGP4 $113
JUMPV
LABELV $114
ADDRGP4 addBotsMenuInfo+1432
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 addBotsMenuInfo+1424
INDIRI4
GEI4 $116
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1432
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
LABELV $116
LABELV $113
endproc UI_AddBotsMenu_DownEvent 4 0
proc UI_AddBotsMenu_SortCompare 44 8
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $121
endproc UI_AddBotsMenu_SortCompare 44 8
proc UI_AddBotsMenu_GetSortedBotNums 8 16
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1440
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $124
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 0
INDIRI4
ADDRGP4 addBotsMenuInfo+1424
INDIRI4
LTI4 $123
ADDRGP4 addBotsMenuInfo+1440
ARGP4
ADDRGP4 addBotsMenuInfo+1424
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_AddBotsMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
LABELV $122
endproc UI_AddBotsMenu_GetSortedBotNums 8 16
proc UI_AddBotsMenu_Draw 0 20
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $133
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $134
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $132
endproc UI_AddBotsMenu_Draw 0 20
data
align 4
LABELV skillNames
address $135
address $136
address $137
address $138
address $139
byte 4 0
align 4
LABELV teamNames1
address $140
byte 4 0
align 4
LABELV teamNames2
address $141
address $142
byte 4 0
code
proc UI_AddBotsMenu_Init 1064 12
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 16
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1044
INDIRI4
ASGNI4
ADDRGP4 addBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5760
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 addBotsMenuInfo+268
ADDRGP4 UI_AddBotsMenu_Draw
ASGNP4
ADDRGP4 addBotsMenuInfo+280
CNSTI4 0
ASGNI4
ADDRGP4 addBotsMenuInfo+276
CNSTI4 1
ASGNI4
ADDRGP4 addBotsMenuInfo+1428
CNSTI4 1000
ASGNI4
ADDRGP4 UI_AddBots_Cache
CALLV
pop
ADDRLP4 1048
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1424
ADDRLP4 1048
INDIRI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1424
INDIRI4
CNSTI4 7
GEI4 $153
ADDRLP4 1052
ADDRGP4 addBotsMenuInfo+1424
INDIRI4
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $153
ADDRLP4 1052
CNSTI4 7
ASGNI4
LABELV $154
ADDRLP4 8
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRGP4 addBotsMenuInfo+288
CNSTI4 6
ASGNI4
ADDRGP4 addBotsMenuInfo+288+4
ADDRGP4 $158
ASGNP4
ADDRGP4 addBotsMenuInfo+288+44
CNSTU4 16384
ASGNU4
ADDRGP4 addBotsMenuInfo+288+12
CNSTI4 200
ASGNI4
ADDRGP4 addBotsMenuInfo+288+16
CNSTI4 128
ASGNI4
ADDRGP4 addBotsMenuInfo+288+76
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+288+80
CNSTI4 128
ASGNI4
ADDRGP4 addBotsMenuInfo+376
CNSTI4 6
ASGNI4
ADDRGP4 addBotsMenuInfo+376+44
CNSTU4 260
ASGNU4
ADDRGP4 addBotsMenuInfo+376+12
CNSTI4 200
ASGNI4
ADDRGP4 addBotsMenuInfo+376+16
CNSTI4 128
ASGNI4
ADDRGP4 addBotsMenuInfo+376+8
CNSTI4 13
ASGNI4
ADDRGP4 addBotsMenuInfo+376+48
ADDRGP4 UI_AddBotsMenu_UpEvent
ASGNP4
ADDRGP4 addBotsMenuInfo+376+76
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+376+80
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+376+60
ADDRGP4 $186
ASGNP4
ADDRGP4 addBotsMenuInfo+464
CNSTI4 6
ASGNI4
ADDRGP4 addBotsMenuInfo+464+44
CNSTU4 260
ASGNU4
ADDRGP4 addBotsMenuInfo+464+12
CNSTI4 200
ASGNI4
ADDRGP4 addBotsMenuInfo+464+16
CNSTI4 192
ASGNI4
ADDRGP4 addBotsMenuInfo+464+8
CNSTI4 14
ASGNI4
ADDRGP4 addBotsMenuInfo+464+48
ADDRGP4 UI_AddBotsMenu_DownEvent
ASGNP4
ADDRGP4 addBotsMenuInfo+464+76
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+464+80
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+464+60
ADDRGP4 $204
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 120
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552
ADDP4
CNSTI4 9
ASGNI4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+44
ADDP4
CNSTU4 260
ASGNU4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+12
ADDP4
CNSTI4 264
ASGNI4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+48
ADDP4
ADDRGP4 UI_AddBotsMenu_BotEvent
ASGNP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5536
ADDP4
ASGNP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+68
ADDP4
ADDRGP4 color_orange
ASGNP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552+64
ADDP4
CNSTI4 16
ASGNI4
LABELV $206
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $205
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1056
CNSTI4 3
ASGNI4
ADDRGP4 addBotsMenuInfo+1056+44
CNSTU4 258
ASGNU4
ADDRGP4 addBotsMenuInfo+1056+12
CNSTI4 320
ASGNI4
ADDRGP4 addBotsMenuInfo+1056+16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1056+4
ADDRGP4 $236
ASGNP4
ADDRGP4 addBotsMenuInfo+1056+8
CNSTI4 15
ASGNI4
ADDRGP4 addBotsMenuInfo+1056+76
ADDRGP4 skillNames
ASGNP4
ADDRGP4 $243
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRLP4 1056
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 addBotsMenuInfo+1056+64
ADDRLP4 1060
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1152
CNSTI4 3
ASGNI4
ADDRGP4 addBotsMenuInfo+1152+44
CNSTU4 258
ASGNU4
ADDRGP4 addBotsMenuInfo+1152+12
CNSTI4 320
ASGNI4
ADDRGP4 addBotsMenuInfo+1152+16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1152+4
ADDRGP4 $253
ASGNP4
ADDRGP4 addBotsMenuInfo+1152+8
CNSTI4 16
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 3
LTI4 $256
ADDRGP4 addBotsMenuInfo+1152+76
ADDRGP4 teamNames2
ASGNP4
ADDRGP4 $257
JUMPV
LABELV $256
ADDRGP4 addBotsMenuInfo+1152+76
ADDRGP4 teamNames1
ASGNP4
ADDRGP4 addBotsMenuInfo+1152+44
CNSTU4 8192
ASGNU4
LABELV $257
ADDRGP4 addBotsMenuInfo+1248
CNSTI4 6
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+4
ADDRGP4 $267
ASGNP4
ADDRGP4 addBotsMenuInfo+1248+44
CNSTU4 260
ASGNU4
ADDRGP4 addBotsMenuInfo+1248+8
CNSTI4 11
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+48
ADDRGP4 UI_AddBotsMenu_FightEvent
ASGNP4
ADDRGP4 addBotsMenuInfo+1248+12
CNSTI4 320
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+16
CNSTI4 320
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+76
CNSTI4 128
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+80
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+1248+60
ADDRGP4 $284
ASGNP4
ADDRGP4 addBotsMenuInfo+1336
CNSTI4 6
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+4
ADDRGP4 $288
ASGNP4
ADDRGP4 addBotsMenuInfo+1336+44
CNSTU4 260
ASGNU4
ADDRGP4 addBotsMenuInfo+1336+8
CNSTI4 10
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+48
ADDRGP4 UI_AddBotsMenu_BackEvent
ASGNP4
ADDRGP4 addBotsMenuInfo+1336+12
CNSTI4 192
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+16
CNSTI4 320
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+76
CNSTI4 128
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+80
CNSTI4 64
ASGNI4
ADDRGP4 addBotsMenuInfo+1336+60
ADDRGP4 $305
ASGNP4
ADDRGP4 addBotsMenuInfo+1432
CNSTI4 0
ASGNI4
ADDRGP4 addBotsMenuInfo+1436
CNSTI4 0
ASGNI4
ADDRGP4 addBotsMenuInfo+552+68
ADDRGP4 color_white
ASGNP4
ADDRGP4 UI_AddBotsMenu_GetSortedBotNums
CALLV
pop
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
ADDRGP4 addBotsMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 addBotsMenuInfo+552
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $313
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1248
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $143
endproc UI_AddBotsMenu_Init 1064 12
export UI_AddBots_Cache
proc UI_AddBots_Cache 0 4
ADDRGP4 $288
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $267
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $284
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $158
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $186
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $204
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
LABELV $322
endproc UI_AddBots_Cache 0 4
export UI_AddBotsMenu
proc UI_AddBotsMenu 0 4
ADDRGP4 UI_AddBotsMenu_Init
CALLV
pop
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
LABELV $323
endproc UI_AddBotsMenu 0 4
bss
align 4
LABELV addBotsMenuInfo
skip 5760
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_ioq3
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $305
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $288
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $284
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $267
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $253
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $243
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $236
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $204
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $186
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $158
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $144
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $140
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $138
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $136
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $135
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $104
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $78
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
