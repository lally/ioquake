data
export ui_medalNames
align 4
LABELV ui_medalNames
address $69
address $70
address $71
address $72
address $73
address $74
export ui_medalPicNames
align 4
LABELV ui_medalPicNames
address $75
address $76
address $77
address $78
address $79
address $80
export ui_medalSounds
align 4
LABELV ui_medalSounds
address $81
address $82
address $83
address $84
address $85
address $86
code
proc UI_SPPostgameMenu_AgainEvent 0 8
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $88
ADDRGP4 $87
JUMPV
LABELV $88
ADDRGP4 UI_PopMenu
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $87
endproc UI_SPPostgameMenu_AgainEvent 0 8
proc UI_SPPostgameMenu_NextEvent 36 4
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
ADDRGP4 $91
JUMPV
LABELV $92
ADDRGP4 UI_PopMenu
CALLV
pop
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 0
NEI4 $94
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
ADDRLP4 4
ADDRGP4 postgameMenuInfo+860
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
ADDRLP4 20
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $98
ADDRLP4 0
ADDRGP4 postgameMenuInfo+860
INDIRI4
ASGNI4
LABELV $98
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $103
ADDRLP4 28
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $101
LABELV $103
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $101
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $104
ADDRGP4 $91
JUMPV
LABELV $104
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
LABELV $91
endproc UI_SPPostgameMenu_NextEvent 36 4
proc UI_SPPostgameMenu_MenuEvent 0 8
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $107
ADDRGP4 $106
JUMPV
LABELV $107
ADDRGP4 UI_PopMenu
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $106
endproc UI_SPPostgameMenu_MenuEvent 0 8
proc UI_SPPostgameMenu_MenuKey 8 8
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+556
INDIRI4
GEI4 $111
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $111
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 1
NEI4 $115
CNSTI4 2
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 postgameMenuInfo+552
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $115
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 2
NEI4 $124
ADDRGP4 postgameMenuInfo+552
CNSTI4 3
ASGNI4
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $124
ADDRFP4 0
INDIRI4
CNSTI4 27
EQI4 $134
ADDRFP4 0
INDIRI4
CNSTI4 179
NEI4 $132
LABELV $134
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $132
ADDRGP4 postgameMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $110
endproc UI_SPPostgameMenu_MenuKey 8 8
data
align 4
LABELV medalLocations
byte 4 144
byte 4 448
byte 4 88
byte 4 504
byte 4 32
byte 4 560
code
proc UI_SPPostgameMenu_DrawAwardsMedals 48 20
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 40
INDIRI4
ADDRGP4 medalLocations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 64
ASGNI4
ADDRLP4 4
ADDRLP4 40
INDIRI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ADDRGP4 postgameMenuInfo+900
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTF4 1111490560
ASGNF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $142
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $144
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $145
ADDRGP4 $137
JUMPV
LABELV $145
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $147
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $143
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 52
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $136
LABELV $135
endproc UI_SPPostgameMenu_DrawAwardsMedals 48 20
proc UI_SPPostgameMenu_DrawAwardsPresentation 48 20
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 2000
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
DIVI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
MODI4
ASGNI4
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 4+12
CNSTI4 2000
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRGP4 ui_medalNames
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+924
ADDP4
INDIRI4
CNSTI4 0
NEI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+924
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 44
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $153
LABELV $148
endproc UI_SPPostgameMenu_DrawAwardsPresentation 48 20
proc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 1
ADDI4
LEI4 $159
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
LABELV $159
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
LTI4 $163
ADDRGP4 $158
JUMPV
LABELV $163
ADDRLP4 64
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $167
CNSTI4 392
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $169
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
LABELV $167
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 68
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
ADDRGP4 $172
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+636
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 440
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $158
endproc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
proc UI_SPPostgameMenu_MenuDraw 1060 20
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 8
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRGP4 postgameMenuInfo+568
INDIRI4
EQI4 $176
ADDRGP4 UI_PopMenu
CALLV
pop
ADDRGP4 $174
JUMPV
LABELV $176
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
LEI4 $179
CNSTI4 510
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+668+128
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $179
CNSTI4 130
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+668+64
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
CNSTI4 320
ARGI4
CNSTI4 362
ARGI4
ADDRGP4 postgameMenuInfo+668
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 1
NEI4 $187
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+560
INDIRI4
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $192
ADDRGP4 postgameMenuInfo+952
INDIRI4
CNSTI4 0
EQI4 $192
ADDRGP4 postgameMenuInfo+952
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 postgameMenuInfo+952
CNSTI4 0
ASGNI4
LABELV $192
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $197
ADDRGP4 $174
JUMPV
LABELV $197
ADDRGP4 postgameMenuInfo+552
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
LABELV $187
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 2
NEI4 $202
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+560
INDIRI4
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2000
ADDRGP4 postgameMenuInfo+872
INDIRI4
MULI4
LTI4 $207
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $210
ADDRGP4 $174
JUMPV
LABELV $210
ADDRGP4 postgameMenuInfo+552
CNSTI4 3
ASGNI4
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsPresentation
CALLV
pop
LABELV $208
LABELV $202
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 3
NEI4 $215
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $218
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
NEI4 $219
CNSTI4 8
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $219
ADDRGP4 $224
ARGP4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $174
JUMPV
LABELV $218
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 -1
LEI4 $227
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $227
ADDRGP4 postgameMenuInfo+868
INDIRI4
ADDRGP4 postgameMenuInfo+948
INDIRI4
NEI4 $231
ADDRGP4 $224
ARGP4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 $235
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $174
JUMPV
LABELV $231
ADDRGP4 $236
ARGP4
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 2
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
ADDRGP4 $224
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $239
ARGP4
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $174
JUMPV
LABELV $227
LABELV $219
ADDRLP4 1048
ADDRGP4 postgameMenuInfo+288+44
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRLP4 1052
ADDRGP4 postgameMenuInfo+376+44
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRLP4 1056
ADDRGP4 postgameMenuInfo+464+44
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
ADDRGP4 postgameMenuInfo+872
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $215
ADDRGP4 $250
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
INDIRF4
CNSTF4 0
NEF4 $248
ADDRGP4 $174
JUMPV
LABELV $248
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+564
INDIRI4
SUBI4
ASGNI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 3
GTI4 $253
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $253
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1500
DIVI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
ADDI4
MODI4
ASGNI4
LABELV $254
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
LABELV $174
endproc UI_SPPostgameMenu_MenuDraw 1060 20
export UI_SPPostgameMenu_Cache
proc UI_SPPostgameMenu_Cache 12 8
ADDRGP4 $258
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
ADDRGP4 $259
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $260
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $262
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $263
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRGP4 $264
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $265
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
LABELV $266
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $265
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $269
ADDRGP4 $271
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
ADDRGP4 $272
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
ADDRGP4 $273
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
LABELV $269
LABELV $257
endproc UI_SPPostgameMenu_Cache 12 8
proc UI_SPPostgameMenu_Init 0 8
ADDRGP4 postgameMenuInfo+276
CNSTI4 1
ASGNI4
ADDRGP4 postgameMenuInfo+272
ADDRGP4 UI_SPPostgameMenu_MenuKey
ASGNP4
ADDRGP4 postgameMenuInfo+268
ADDRGP4 UI_SPPostgameMenu_MenuDraw
ASGNP4
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
ADDRGP4 postgameMenuInfo+464
CNSTI4 6
ASGNI4
ADDRGP4 postgameMenuInfo+464+4
ADDRGP4 $259
ASGNP4
ADDRGP4 postgameMenuInfo+464+44
CNSTU4 16644
ASGNU4
ADDRGP4 postgameMenuInfo+464+12
CNSTI4 0
ASGNI4
ADDRGP4 postgameMenuInfo+464+16
CNSTI4 416
ASGNI4
ADDRGP4 postgameMenuInfo+464+48
ADDRGP4 UI_SPPostgameMenu_MenuEvent
ASGNP4
ADDRGP4 postgameMenuInfo+464+8
CNSTI4 12
ASGNI4
ADDRGP4 postgameMenuInfo+464+76
CNSTI4 128
ASGNI4
ADDRGP4 postgameMenuInfo+464+80
CNSTI4 64
ASGNI4
ADDRGP4 postgameMenuInfo+464+60
ADDRGP4 $260
ASGNP4
ADDRGP4 postgameMenuInfo+288
CNSTI4 6
ASGNI4
ADDRGP4 postgameMenuInfo+288+4
ADDRGP4 $261
ASGNP4
ADDRGP4 postgameMenuInfo+288+44
CNSTU4 16648
ASGNU4
ADDRGP4 postgameMenuInfo+288+12
CNSTI4 320
ASGNI4
ADDRGP4 postgameMenuInfo+288+16
CNSTI4 416
ASGNI4
ADDRGP4 postgameMenuInfo+288+48
ADDRGP4 UI_SPPostgameMenu_AgainEvent
ASGNP4
ADDRGP4 postgameMenuInfo+288+8
CNSTI4 10
ASGNI4
ADDRGP4 postgameMenuInfo+288+76
CNSTI4 128
ASGNI4
ADDRGP4 postgameMenuInfo+288+80
CNSTI4 64
ASGNI4
ADDRGP4 postgameMenuInfo+288+60
ADDRGP4 $262
ASGNP4
ADDRGP4 postgameMenuInfo+376
CNSTI4 6
ASGNI4
ADDRGP4 postgameMenuInfo+376+4
ADDRGP4 $263
ASGNP4
ADDRGP4 postgameMenuInfo+376+44
CNSTU4 16656
ASGNU4
ADDRGP4 postgameMenuInfo+376+12
CNSTI4 640
ASGNI4
ADDRGP4 postgameMenuInfo+376+16
CNSTI4 416
ASGNI4
ADDRGP4 postgameMenuInfo+376+48
ADDRGP4 UI_SPPostgameMenu_NextEvent
ASGNP4
ADDRGP4 postgameMenuInfo+376+8
CNSTI4 11
ASGNI4
ADDRGP4 postgameMenuInfo+376+76
CNSTI4 128
ASGNI4
ADDRGP4 postgameMenuInfo+376+80
CNSTI4 64
ASGNI4
ADDRGP4 postgameMenuInfo+376+60
ADDRGP4 $264
ASGNP4
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
LABELV $274
endproc UI_SPPostgameMenu_Init 0 8
proc Prepname 1104 12
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 68
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
ADDRLP4 4
ARGP4
ADDRLP4 1096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1096
INDIRI4
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $342
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
LABELV $343
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 256
GTI4 $342
LABELV $345
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 postgameMenuInfo+668
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $340
endproc Prepname 1104 12
export UI_SPPostgameMenu_f
proc UI_SPPostgameMenu_f 1248 12
ADDRGP4 postgameMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 956
ARGI4
ADDRGP4 memset
CALLP4
pop
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 36
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+568
ADDRLP4 1140
INDIRI4
ASGNI4
CNSTI4 0
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
ADDRLP4 36
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRLP4 1064
ARGP4
ADDRLP4 1148
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1060
ADDRLP4 1148
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
ADDRGP4 $348
JUMPV
LABELV $351
ADDRGP4 arenainfo
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 arenainfo
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+860
ADDRLP4 1156
INDIRI4
ASGNI4
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+864
ADDRLP4 1164
INDIRI4
ASGNI4
CNSTI4 2
ARGI4
ADDRLP4 1168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1172
INDIRI4
ASGNI4
ADDRLP4 1176
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 1176
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
ADDRLP4 1176
INDIRI4
LEI4 $356
ADDRGP4 postgameMenuInfo+864
CNSTI4 8
ASGNI4
LABELV $356
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $360
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1184
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
ADDRLP4 1188
INDIRI4
ASGNI4
ADDRLP4 1196
CNSTI4 2
ASGNI4
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1196
INDIRI4
ADDI4
ARGI4
ADDRLP4 1200
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1196
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
ADDRLP4 1204
INDIRI4
ASGNI4
ADDRLP4 1208
CNSTI4 3
ASGNI4
ADDRLP4 1208
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1208
INDIRI4
ADDI4
ARGI4
ADDRLP4 1216
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+636
ADDP4
ADDRLP4 1220
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $368
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $368
LABELV $361
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $363
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
LTI4 $360
ADDRGP4 postgameMenuInfo+860
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 UI_SetBestScore
CALLV
pop
CNSTI4 3
ARGI4
ADDRLP4 1180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1184
INDIRI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 1188
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 1192
INDIRI4
ASGNI4
CNSTI4 5
ARGI4
ADDRLP4 1196
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 1200
INDIRI4
ASGNI4
CNSTI4 6
ARGI4
ADDRLP4 1204
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 1208
INDIRI4
ASGNI4
CNSTI4 7
ARGI4
ADDRLP4 1212
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 1216
INDIRI4
ASGNI4
CNSTI4 8
ARGI4
ADDRLP4 1220
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+20
ADDRLP4 1224
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+872
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $379
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $379
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $386
CNSTI4 1
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $386
ADDRLP4 4+8
INDIRI4
CNSTI4 0
EQI4 $396
CNSTI4 2
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
ADDRLP4 1228
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
ADDRLP4 1228
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $396
ADDRLP4 4+12
INDIRI4
CNSTI4 0
EQI4 $406
CNSTI4 3
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 3
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+12
INDIRI4
ASGNI4
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $406
CNSTI4 4
ARGI4
ADDRLP4 1228
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1132
ADDRLP4 1228
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
CNSTI4 4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
CNSTI4 4
ARGI4
ADDRLP4 1232
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 1232
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
ADDRLP4 1128
INDIRI4
ADDRLP4 1132
INDIRI4
LEI4 $417
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 4
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
CNSTI4 100
ADDRLP4 1128
INDIRI4
MULI4
ASGNI4
ADDRLP4 1236
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1236
INDIRP4
ADDRLP4 1236
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $417
ADDRLP4 4+20
INDIRI4
CNSTI4 0
EQI4 $424
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 5
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 1236
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1236
INDIRP4
ADDRLP4 1236
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $432
ADDRGP4 postgameMenuInfo+860
INDIRI4
ARGI4
ADDRLP4 1236
ADDRGP4 UI_TierCompleted
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+868
ADDRLP4 1236
INDIRI4
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRGP4 postgameMenuInfo+868
CNSTI4 -1
ASGNI4
LABELV $433
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
ADDRGP4 postgameMenuInfo+564
ADDRGP4 uis+4
INDIRI4
ASGNI4
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
ADDRGP4 UI_SPPostgameMenu_Init
CALLV
pop
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $442
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+376
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
ADDRGP4 $443
JUMPV
LABELV $442
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
LABELV $443
CNSTI4 0
ARGI4
ADDRGP4 Prepname
CALLV
pop
CNSTI4 1
ARGI4
ADDRGP4 Prepname
CALLV
pop
CNSTI4 2
ARGI4
ADDRGP4 Prepname
CALLV
pop
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $446
ADDRGP4 $449
ARGP4
ADDRGP4 postgameMenuInfo+668
ARGP4
ADDRLP4 1236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1240
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+952
ADDRLP4 1240
INDIRI4
ASGNI4
CNSTI4 2
ARGI4
ADDRGP4 $451
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
ADDRGP4 $447
JUMPV
LABELV $446
ADDRGP4 $273
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+952
ADDRLP4 1236
INDIRI4
ASGNI4
CNSTI4 2
ARGI4
ADDRGP4 $453
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $447
ADDRGP4 postgameMenuInfo+552
CNSTI4 1
ASGNI4
ADDRLP4 1236
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+948
ADDRLP4 1236
INDIRI4
ASGNI4
ADDRGP4 $458
ARGP4
ADDRLP4 1240
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
ADDRLP4 1244
ADDRGP4 postgameMenuInfo+948
ASGNP4
ADDRLP4 1244
INDIRP4
ADDRLP4 1244
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $456
LABELV $348
endproc UI_SPPostgameMenu_f 1248 12
bss
align 1
LABELV arenainfo
skip 1024
align 4
LABELV postgameMenuInfo
skip 956
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
LABELV $458
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $453
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $451
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $449
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $354
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $350
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $273
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $272
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $264
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $262
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $261
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $260
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $259
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $258
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $250
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $239
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $238
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $236
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $235
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $226
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
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $225
byte 1 0
align 1
LABELV $224
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $175
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 35
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $171
byte 1 110
byte 1 0
align 1
LABELV $169
byte 1 40
byte 1 116
byte 1 105
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $147
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $144
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $118
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $109
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
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $90
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $79
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $75
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $74
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $72
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
LABELV $71
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
