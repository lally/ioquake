export UpdateTournamentInfo
code
proc UpdateTournamentInfo 1120 68
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $57
JUMPV
LABELV $54
ADDRLP4 40
CNSTI4 816
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $59
ADDRGP4 $55
JUMPV
LABELV $59
ADDRLP4 40
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $61
ADDRGP4 $56
JUMPV
LABELV $61
LABELV $55
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $57
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $54
LABELV $56
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $66
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
NEI4 $63
LABELV $66
ADDRGP4 $53
JUMPV
LABELV $63
ADDRLP4 1076
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 CalculateRanks
CALLV
pop
CNSTI4 844
ADDRLP4 1076
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $67
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $69
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $68
JUMPV
LABELV $67
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
ADDRLP4 1100
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1084
CNSTI4 100
ADDRLP4 1100
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
MULI4
ADDRLP4 1100
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
DIVI4
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $71
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $72
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $73
ADDRLP4 1092
ADDRGP4 level+44+4
INDIRI4
ASGNI4
ADDRLP4 1096
ADDRGP4 level+44+8
INDIRI4
ASGNI4
CNSTI4 844
ADDRLP4 1076
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $80
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $87
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $88
ADDRLP4 1080
ADDRLP4 1100
INDIRI4
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $80
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $94
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $95
ADDRLP4 1080
ADDRLP4 1100
INDIRI4
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $73
ADDRLP4 1100
CNSTI4 844
ASGNI4
ADDRLP4 1104
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRI4
ADDRLP4 1076
INDIRI4
MULI4
ADDRLP4 1104
INDIRP4
ADDP4
CVPU4 4
ADDRLP4 1100
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 1104
INDIRP4
ADDP4
CVPU4 4
NEU4 $96
ADDRLP4 1080
CNSTI4 1
ASGNI4
ADDRLP4 1108
CNSTI4 844
ASGNI4
ADDRLP4 1112
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 1116
CNSTI4 248
ASGNI4
ADDRLP4 1092
ADDRLP4 1108
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 1112
INDIRP4
ADDP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1108
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 1112
INDIRP4
ADDP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $96
ADDRLP4 1108
CNSTI4 844
ASGNI4
ADDRLP4 1112
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 1116
CNSTI4 248
ASGNI4
ADDRLP4 1096
ADDRLP4 1108
INDIRI4
ADDRGP4 level+84
INDIRI4
MULI4
ADDRLP4 1112
INDIRP4
ADDP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1108
INDIRI4
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRLP4 1112
INDIRP4
ADDP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ASGNI4
LABELV $97
LABELV $74
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRLP4 1100
INDIRI4
EQI4 $105
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $105
ADDRLP4 1088
CNSTI4 1
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 1088
CNSTI4 0
ASGNI4
LABELV $106
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $107
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRLP4 1104
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $68
ADDRLP4 44
ARGP4
ADDRLP4 1100
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1100
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $116
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1108
CNSTI4 844
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 1108
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 8
ARGP4
ADDRLP4 1112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
ADDRLP4 1112
INDIRI4
ASGNI4
ADDRLP4 1072
INDIRI4
ADDRLP4 1068
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CVIU4 4
CNSTU4 1024
LTU4 $117
ADDRGP4 $112
JUMPV
LABELV $117
ADDRLP4 44
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $111
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $110
LABELV $112
CNSTI4 2
ARGI4
ADDRLP4 44
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $53
endproc UpdateTournamentInfo 1120 68
proc SpawnModelOnVictoryPad 108 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
ADDRGP4 $122
ARGP4
ADDRGP4 G_Printf
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $119
JUMPV
LABELV $120
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 56
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 208
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1022
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 22
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 11
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
NEI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
LABELV $124
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
NEI4 $126
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 12
ASGNI4
LABELV $126
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 64
CNSTI4 424
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
CNSTI4 436
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 72
CNSTI4 448
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 76
CNSTI4 464
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 80
CNSTI4 476
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRB
ASGNB 12
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
ADDRLP4 84
CNSTI4 512
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 level+9144
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRGP4 level+9144+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRGP4 level+9144+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 100
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 100
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
RETP4
LABELV $119
endproc SpawnModelOnVictoryPad 108 16
proc CelebrateStop 12 0
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
NEI4 $152
ADDRLP4 0
CNSTI4 12
ASGNI4
ADDRGP4 $153
JUMPV
LABELV $152
ADDRLP4 0
CNSTI4 11
ASGNI4
LABELV $153
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 8
CNSTI4 128
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ADDRLP4 8
INDIRI4
BXORI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
LABELV $151
endproc CelebrateStop 12 0
proc CelebrateStart 8 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
CNSTI4 6
BORI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2294
ADDI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 CelebrateStop
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 76
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $154
endproc CelebrateStart 8 12
data
align 4
LABELV offsetFirst
byte 4 0
byte 4 0
byte 4 1116995584
align 4
LABELV offsetSecond
byte 4 3240099840
byte 4 1114636288
byte 4 1113063424
align 4
LABELV offsetThird
byte 4 3247964160
byte 4 3262119936
byte 4 1110704128
code
proc PodiumPlacementThink 92 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
ADDRGP4 level+9156
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRGP4 $160
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48
ADDRGP4 level+9144
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $160
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+4
ADDRGP4 level+9144+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $160
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+8
ADDRGP4 level+9144+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $170
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
ADDRGP4 podium1
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $171
ADDRLP4 0
ADDRGP4 level+9144
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9144+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9144+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium1
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 88
ADDRGP4 offsetFirst
INDIRF4
ASGNF4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetFirst
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 podium1
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
LABELV $171
ADDRGP4 podium2
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $202
ADDRLP4 0
ADDRGP4 level+9144
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9144+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9144+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium2
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 88
ADDRGP4 offsetSecond
INDIRF4
ASGNF4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetSecond
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 podium2
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
LABELV $202
ADDRGP4 podium3
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
ADDRLP4 0
ADDRGP4 level+9144
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9144+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9144+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium3
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 88
ADDRGP4 offsetThird
INDIRF4
ASGNF4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetThird
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 podium3
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
LABELV $233
LABELV $156
endproc PodiumPlacementThink 92 16
proc SpawnPodium 68 16
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $265
CNSTP4 0
RETP4
ADDRGP4 $264
JUMPV
LABELV $265
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $267
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $268
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 level+9156
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRGP4 $160
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 level+9144
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $160
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+4
ADDRGP4 level+9144+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $160
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+8
ADDRGP4 level+9144+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $170
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
SUBF4
ASGNF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
ADDRLP4 4
ADDRGP4 level+9144
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRGP4 level+9144+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRGP4 level+9144+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 PodiumPlacementThink
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
RETP4
LABELV $264
endproc SpawnPodium 68 16
export SpawnModelsOnVictoryPads
proc SpawnModelsOnVictoryPads 28 16
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 podium1
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 podium2
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 podium3
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRGP4 SpawnPodium
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetFirst
ARGP4
CNSTI4 816
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 844
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $291
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 CelebrateStart
ASGNP4
ADDRGP4 podium1
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $291
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetSecond
ARGP4
CNSTI4 816
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 844
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 20
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $298
ADDRGP4 podium2
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $298
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LEI4 $300
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetThird
ARGP4
CNSTI4 816
ADDRGP4 level+84+8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 844
ADDRGP4 level+84+8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 24
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $307
ADDRGP4 podium3
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $307
LABELV $300
LABELV $288
endproc SpawnModelsOnVictoryPads 28 16
export Svcmd_AbortPodium_f
proc Svcmd_AbortPodium_f 0 0
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $310
ADDRGP4 $309
JUMPV
LABELV $310
ADDRGP4 podium1
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
ADDRGP4 podium1
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 podium1
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 CelebrateStop
ASGNP4
LABELV $313
LABELV $309
endproc Svcmd_AbortPodium_f 0 0
bss
export podium3
align 4
LABELV podium3
skip 4
export podium2
align 4
LABELV podium2
skip 4
export podium1
align 4
LABELV podium1
skip 4
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import G_StartKamikaze
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import DropPortalDestination
import DropPortalSource
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_prox
import fire_nail
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientPersistantPowerups
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $268
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
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $267
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $170
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $160
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $107
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $69
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 0
