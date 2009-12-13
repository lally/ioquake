code
proc MainMenu_ExitAction 0 0
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $71
ADDRGP4 $70
JUMPV
LABELV $71
ADDRGP4 UI_PopMenu
CALLV
pop
ADDRGP4 UI_CreditMenu
CALLV
pop
LABELV $70
endproc MainMenu_ExitAction 0 0
export Main_MenuEvent
proc Main_MenuEvent 8 12
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $74
ADDRGP4 $73
JUMPV
LABELV $74
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $76
ADDRLP4 0
INDIRI4
CNSTI4 17
GTI4 $76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $91-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $91
address $79
address $80
address $81
address $82
address $83
address $85
address $84
address $89
code
LABELV $79
ADDRGP4 UI_SPLevelMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $80
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $81
ADDRGP4 UI_SetupMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $82
ADDRGP4 UI_DemosMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $83
ADDRGP4 UI_CinematicsMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $84
ADDRGP4 UI_ModsMenu
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $85
ADDRGP4 $86
ARGP4
ADDRGP4 $87
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $89
ADDRGP4 $90
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 MainMenu_ExitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
LABELV $76
LABELV $77
LABELV $73
endproc Main_MenuEvent 8 12
export MainMenu_Cache
proc MainMenu_Cache 4 4
ADDRGP4 $95
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 s_main+864
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $93
endproc MainMenu_Cache 4 4
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
ADDRGP4 $97
ARGP4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 UI_MainMenu
CALLV
pop
ADDRGP4 menu_null_sound
INDIRI4
RETI4
LABELV $96
endproc ErrorMessage_Key 0 8
lit
align 4
LABELV $100
byte 4 1056964608
byte 4 0
byte 4 0
byte 4 1065353216
code
proc Main_MenuDraw 580 28
ADDRLP4 552
ADDRGP4 $100
INDIRB
ASGNB 16
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRLP4 0+76
CNSTI4 1
ASGNI4
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
ADDRLP4 568
CNSTF4 0
ASGNF4
ADDRLP4 536
ADDRLP4 568
INDIRF4
ASGNF4
ADDRLP4 540
ADDRLP4 568
INDIRF4
ASGNF4
ADDRLP4 544
CNSTF4 1142947840
ASGNF4
ADDRLP4 548
CNSTF4 1123024896
ASGNF4
ADDRLP4 536
ARGP4
ADDRLP4 540
ARGP4
ADDRLP4 544
ARGP4
ADDRLP4 548
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
ADDRLP4 0
ADDRLP4 536
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0+8
ADDRLP4 544
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0+12
ADDRLP4 548
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 520
CNSTF4 0
ASGNF4
ADDRLP4 0+16
ADDRLP4 520
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
ADDRLP4 0+20
ADDRLP4 520
INDIRF4
CNSTF4 1100840960
ADDF4
ASGNF4
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
ADDRLP4 508
CNSTF4 1133903872
ASGNF4
ADDRLP4 508+4
CNSTF4 0
ASGNF4
ADDRLP4 508+8
CNSTF4 3254779904
ASGNF4
ADDRGP4 trap_R_ClearScene
CALLV
pop
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 uis+4
INDIRI4
CVIF4 4
CNSTF4 1167867904
DIVF4
ARGF4
ADDRLP4 572
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 520
CNSTF4 1084227584
ADDRLP4 572
INDIRF4
MULF4
ASGNF4
ADDRLP4 524
CNSTF4 0
ASGNF4
ADDRLP4 524+4
ADDRLP4 520
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
ADDRLP4 524+8
CNSTF4 0
ASGNF4
ADDRLP4 524
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRLP4 368+8
ADDRGP4 s_main+864
INDIRI4
ASGNI4
ADDRLP4 368+68
ADDRLP4 508
INDIRB
ASGNB 12
ADDRLP4 368+12
ADDRLP4 508
INDIRB
ASGNB 12
ADDRLP4 368+4
CNSTI4 192
ASGNI4
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 576
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 0
EQI4 $123
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 600
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
ADDRGP4 $124
JUMPV
LABELV $123
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $124
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $127
CNSTI4 320
ARGI4
CNSTI4 372
ARGI4
ADDRGP4 $130
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
CNSTI4 320
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 $131
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
ADDRGP4 $128
JUMPV
LABELV $127
CNSTI4 320
ARGI4
CNSTI4 450
ARGI4
ADDRGP4 $131
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $128
LABELV $99
endproc Main_MenuDraw 580 28
proc UI_TeamArenaExists 2088 16
ADDRGP4 $133
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $137
JUMPV
LABELV $134
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $87
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $138
CNSTI4 1
RETI4
ADDRGP4 $132
JUMPV
LABELV $138
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $135
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $137
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $134
CNSTI4 0
RETI4
LABELV $132
endproc UI_TeamArenaExists 2088 16
export UI_MainMenu
proc UI_MainMenu 40 12
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 2049
ASGNI4
ADDRGP4 $141
ARGP4
ADDRGP4 $142
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 uis+11444
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $143
ADDRGP4 ui_cdkeychecked+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $143
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 36
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $147
ADDRGP4 UI_CDKeyMenu
CALLV
pop
ADDRGP4 $140
JUMPV
LABELV $147
LABELV $143
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 868
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4384
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 MainMenu_Cache
CALLV
pop
ADDRGP4 $97
ARGP4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $151
ADDRGP4 s_errorMessage+268
ADDRGP4 Main_MenuDraw
ASGNP4
ADDRGP4 s_errorMessage+272
ADDRGP4 ErrorMessage_Key
ASGNP4
ADDRGP4 s_errorMessage+280
CNSTI4 1
ASGNI4
ADDRGP4 s_errorMessage+276
CNSTI4 1
ASGNI4
ADDRGP4 s_errorMessage+284
CNSTI4 1
ASGNI4
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
ADDRGP4 $140
JUMPV
LABELV $151
ADDRGP4 s_main+268
ADDRGP4 Main_MenuDraw
ASGNP4
ADDRGP4 s_main+280
CNSTI4 1
ASGNI4
ADDRGP4 s_main+276
CNSTI4 1
ASGNI4
ADDRGP4 s_main+284
CNSTI4 1
ASGNI4
ADDRLP4 0
CNSTI4 134
ASGNI4
ADDRGP4 s_main+288
CNSTI4 9
ASGNI4
ADDRGP4 s_main+288+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+288+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+288+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+288+8
CNSTI4 10
ASGNI4
ADDRGP4 s_main+288+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+288+60
ADDRGP4 $177
ASGNP4
ADDRGP4 s_main+288+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+288+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+360
CNSTI4 9
ASGNI4
ADDRGP4 s_main+360+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+360+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+360+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+360+8
CNSTI4 11
ASGNI4
ADDRGP4 s_main+360+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+360+60
ADDRGP4 $195
ASGNP4
ADDRGP4 s_main+360+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+360+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+432
CNSTI4 9
ASGNI4
ADDRGP4 s_main+432+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+432+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+432+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+432+8
CNSTI4 12
ASGNI4
ADDRGP4 s_main+432+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+432+60
ADDRGP4 $213
ASGNP4
ADDRGP4 s_main+432+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+432+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+504
CNSTI4 9
ASGNI4
ADDRGP4 s_main+504+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+504+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+504+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+504+8
CNSTI4 13
ASGNI4
ADDRGP4 s_main+504+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+504+60
ADDRGP4 $231
ASGNP4
ADDRGP4 s_main+504+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+504+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+576
CNSTI4 9
ASGNI4
ADDRGP4 s_main+576+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+576+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+576+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+576+8
CNSTI4 14
ASGNI4
ADDRGP4 s_main+576+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+576+60
ADDRGP4 $249
ASGNP4
ADDRGP4 s_main+576+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+576+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 20
ADDRGP4 UI_TeamArenaExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $254
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+648
CNSTI4 9
ASGNI4
ADDRGP4 s_main+648+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+648+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+648+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+648+8
CNSTI4 15
ASGNI4
ADDRGP4 s_main+648+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+648+60
ADDRGP4 $269
ASGNP4
ADDRGP4 s_main+648+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+648+64
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $254
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+720
CNSTI4 9
ASGNI4
ADDRGP4 s_main+720+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+720+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+720+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+720+8
CNSTI4 16
ASGNI4
ADDRGP4 s_main+720+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+720+60
ADDRGP4 $287
ASGNP4
ADDRGP4 s_main+720+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+720+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
ADDRGP4 s_main+792
CNSTI4 9
ASGNI4
ADDRGP4 s_main+792+44
CNSTU4 264
ASGNU4
ADDRGP4 s_main+792+12
CNSTI4 320
ASGNI4
ADDRGP4 s_main+792+16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 s_main+792+8
CNSTI4 17
ASGNI4
ADDRGP4 s_main+792+48
ADDRGP4 Main_MenuEvent
ASGNP4
ADDRGP4 s_main+792+60
ADDRGP4 $305
ASGNP4
ADDRGP4 s_main+792+68
ADDRGP4 color_red
ASGNP4
ADDRGP4 s_main+792+64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+576
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $315
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $315
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
LABELV $140
endproc UI_MainMenu 40 12
bss
align 4
LABELV s_errorMessage
skip 4384
align 4
LABELV s_main
skip 868
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
import UI_AddBotsMenu
import UI_AddBots_Cache
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
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $287
byte 1 77
byte 1 79
byte 1 68
byte 1 83
byte 1 0
align 1
LABELV $269
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $249
byte 1 67
byte 1 73
byte 1 78
byte 1 69
byte 1 77
byte 1 65
byte 1 84
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $231
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 83
byte 1 0
align 1
LABELV $213
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $195
byte 1 77
byte 1 85
byte 1 76
byte 1 84
byte 1 73
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $177
byte 1 83
byte 1 73
byte 1 78
byte 1 71
byte 1 76
byte 1 69
byte 1 32
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $142
byte 1 49
byte 1 0
align 1
LABELV $141
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 40
byte 1 99
byte 1 41
byte 1 32
byte 1 49
byte 1 57
byte 1 57
byte 1 57
byte 1 45
byte 1 50
byte 1 48
byte 1 48
byte 1 48
byte 1 44
byte 1 32
byte 1 73
byte 1 100
byte 1 32
byte 1 83
byte 1 111
byte 1 102
byte 1 116
byte 1 119
byte 1 97
byte 1 114
byte 1 101
byte 1 44
byte 1 32
byte 1 73
byte 1 110
byte 1 99
byte 1 46
byte 1 32
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 82
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $130
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 70
byte 1 79
byte 1 82
byte 1 32
byte 1 77
byte 1 65
byte 1 84
byte 1 85
byte 1 82
byte 1 69
byte 1 32
byte 1 65
byte 1 85
byte 1 68
byte 1 73
byte 1 69
byte 1 78
byte 1 67
byte 1 69
byte 1 83
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $98
byte 1 0
align 1
LABELV $97
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $90
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $88
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $87
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $86
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
