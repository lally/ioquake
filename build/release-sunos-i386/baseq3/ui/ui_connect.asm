data
export passwordNeeded
align 4
LABELV passwordNeeded
byte 4 1
code
proc UI_ReadableSize 16 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $69
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $71
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $72
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $70
JUMPV
LABELV $69
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $73
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $71
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $75
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $74
JUMPV
LABELV $73
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $76
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $78
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $77
JUMPV
LABELV $76
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $79
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $77
LABELV $74
LABELV $70
LABELV $68
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $81
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $83
ARGP4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $82
JUMPV
LABELV $81
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $84
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $86
ARGP4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $85
JUMPV
LABELV $84
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $87
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $85
LABELV $82
LABELV $80
endproc UI_PrintTime 8 20
data
align 1
LABELV $89
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $90
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $91
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 348 20
ADDRLP4 0
CNSTI4 2064
ASGNI4
ADDRGP4 $92
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $93
ARGP4
ADDRLP4 292
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 292
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $94
ARGP4
ADDRLP4 296
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 148
ADDRLP4 296
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $89
ARGP4
ADDRLP4 300
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 308
ADDRLP4 300
INDIRI4
CVIF4 4
ADDRLP4 304
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 8
ADDRLP4 308
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 308
INDIRI4
ASGNI4
ADDRGP4 $90
ARGP4
ADDRLP4 312
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 312
INDIRI4
CVIF4 4
ADDRLP4 316
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $95
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $95
ADDRGP4 $91
ARGP4
ADDRLP4 320
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 324
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 320
INDIRI4
CVIF4 4
ADDRLP4 324
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $97
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $97
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
CNSTI4 8
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 $89
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
CNSTI4 8
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $90
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
CNSTI4 8
ARGI4
CNSTI4 224
ARGI4
ADDRGP4 $91
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $99
ADDRGP4 $101
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1120403456
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
CVFI4 4
ARGI4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 156
ADDRLP4 328
INDIRP4
ASGNP4
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
LABELV $100
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
ADDRLP4 16
INDIRI4
CNSTI4 4096
LTI4 $104
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $102
LABELV $104
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $105
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 $106
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 $103
JUMPV
LABELV $102
ADDRGP4 uis+4
INDIRI4
ADDRLP4 148
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $107
ADDRLP4 152
ADDRLP4 16
INDIRI4
ADDRGP4 uis+4
INDIRI4
ADDRLP4 148
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $108
ADDRLP4 160
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 152
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
ADDRLP4 328
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $111
ADDRLP4 152
INDIRI4
ADDRLP4 328
INDIRI4
EQI4 $111
ADDRLP4 332
ADDRLP4 12
INDIRI4
ADDRLP4 152
INDIRI4
DIVI4
ASGNI4
ADDRLP4 336
ADDRLP4 332
INDIRI4
ASGNI4
ADDRLP4 340
CNSTI4 1024
ASGNI4
ADDRLP4 332
CNSTI4 1000
ADDRLP4 336
INDIRI4
ADDRLP4 16
INDIRI4
ADDRLP4 340
INDIRI4
DIVI4
ADDRLP4 336
INDIRI4
MULI4
ADDRLP4 12
INDIRI4
ADDRLP4 340
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ASGNI4
ADDRLP4 224
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 332
INDIRI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRLP4 224
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 $106
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 $112
JUMPV
LABELV $111
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 160
ARGI4
ADDRGP4 $105
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $113
ADDRGP4 $106
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 $114
JUMPV
LABELV $113
ADDRGP4 $115
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 192
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $114
LABELV $112
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $116
ADDRGP4 $118
ARGP4
ADDRLP4 160
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 224
ARGI4
ADDRLP4 332
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $116
LABELV $103
LABELV $88
endproc UI_DisplayDownloadInfo 348 20
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5168 28
ADDRGP4 Menu_Cache
CALLV
pop
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $120
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
ADDRLP4 4112
CNSTF4 0
ASGNF4
ADDRLP4 4112
INDIRF4
ARGF4
ADDRLP4 4112
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
LABELV $120
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
ADDRLP4 3084
CNSTI1 0
ASGNI1
CNSTI4 0
ARGI4
ADDRLP4 3084
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4112
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4112
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 3084
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 4116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $125
ARGP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $123
ADDRGP4 $127
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 4116
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 0+1036
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 4120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 448
ARGI4
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $131
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 630
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 0+2060
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
LABELV $131
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $134
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
LABELV $134
ADDRLP4 4128
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 lastConnState
ADDRLP4 4128
INDIRI4
ASGNI4
ADDRLP4 4124
ADDRLP4 4128
INDIRI4
ASGNI4
ADDRLP4 4124
INDIRI4
CNSTI4 3
LTI4 $119
ADDRLP4 4124
INDIRI4
CNSTI4 7
GTI4 $119
ADDRLP4 4124
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $152-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $152
address $139
address $142
address $145
address $119
address $119
code
LABELV $139
ADDRGP4 $140
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
ASGNP4
ADDRGP4 $137
JUMPV
LABELV $142
ADDRGP4 $143
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4140
INDIRP4
ASGNP4
ADDRGP4 $137
JUMPV
LABELV $145
ADDRGP4 $146
ARGP4
ADDRLP4 4144
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
ADDRLP4 4144
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $147
ADDRLP4 4144
ARGP4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
ADDRGP4 $119
JUMPV
LABELV $147
ADDRLP4 4108
ADDRGP4 $149
ASGNP4
LABELV $137
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 4108
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $119
endproc UI_DrawConnectScreen 5168 28
export UI_KeyConnect
proc UI_KeyConnect 0 8
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $155
CNSTI4 2
ARGI4
ADDRGP4 $157
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $155
LABELV $154
endproc UI_KeyConnect 0 8
bss
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export passwordField
align 4
LABELV passwordField
skip 332
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
LABELV $157
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $149
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $140
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $130
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $118
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $115
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $106
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $105
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $101
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $87
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $86
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $75
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $72
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $71
byte 1 37
byte 1 100
byte 1 0
