export Use_Target_Give
code
proc Use_Target_Give 64 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $54
ADDRGP4 $53
JUMPV
LABELV $54
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
ADDRGP4 $53
JUMPV
LABELV $56
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $59
JUMPV
LABELV $58
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $61
ADDRGP4 $59
JUMPV
LABELV $61
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
LABELV $59
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $58
LABELV $53
endproc Use_Target_Give 64 12
export SP_target_give
proc SP_target_give 0 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
LABELV $63
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 0 12
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $65
ADDRGP4 $64
JUMPV
LABELV $65
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $67
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
ADDRGP4 $68
JUMPV
LABELV $67
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $69
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
ADDRGP4 $70
JUMPV
LABELV $69
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
LABELV $71
LABELV $70
LABELV $68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
LABELV $64
endproc Use_target_remove_powerups 0 12
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
LABELV $73
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $74
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 8 0
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
LABELV $75
endproc Use_Target_Delay 8 0
export SP_target_delay
proc SP_target_delay 4 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $80
ARGP4
ADDRGP4 $81
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $78
ADDRGP4 $82
ARGP4
ADDRGP4 $83
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
LABELV $78
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $84
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $84
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
LABELV $77
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 4 12
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $86
endproc Use_Target_Score 4 12
export SP_target_score
proc SP_target_score 0 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
NEI4 $88
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
LABELV $88
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
LABELV $87
endproc SP_target_score 0 0
export Use_Target_Print
proc Use_Target_Print 4 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $91
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $91
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $90
JUMPV
LABELV $91
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $94
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $96
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
LABELV $96
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $90
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
ADDRGP4 $90
JUMPV
LABELV $94
ADDRGP4 $93
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $90
endproc Use_Target_Print 4 8
export SP_target_print
proc SP_target_print 0 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
LABELV $100
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $102
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $104
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $104
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $106
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
ADDRGP4 $107
JUMPV
LABELV $106
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $108
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
ADDRGP4 $109
JUMPV
LABELV $108
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
LABELV $109
LABELV $107
LABELV $103
LABELV $101
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 96 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $82
ARGP4
ADDRGP4 $81
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
ADDRGP4 $111
ARGP4
ADDRGP4 $81
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
ADDRGP4 $114
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $112
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $116
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $112
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $117
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 72
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $119
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $122
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $120
JUMPV
LABELV $119
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $120
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 1092616192
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1092616192
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $123
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
LABELV $123
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $125
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $125
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $110
endproc SP_target_speaker 96 16
export target_laser_think
proc target_laser_think 120 32
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $128
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 96
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 96
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
CNSTF4 1056964608
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 100
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
LABELV $128
ADDRLP4 84
CNSTF4 1157627904
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $140
CNSTI4 808
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 G_Damage
CALLV
pop
LABELV $140
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
LABELV $127
endproc target_laser_think 120 32
export target_laser_on
proc target_laser_on 4 4
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
LABELV $148
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
LABELV $147
endproc target_laser_on 4 4
export target_laser_off
proc target_laser_off 0 4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
LABELV $150
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 4
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $152
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $153
JUMPV
LABELV $152
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $153
LABELV $151
endproc target_laser_use 0 4
export target_laser_start
proc target_laser_start 16 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $159
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $157
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $156
JUMPV
LABELV $155
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
LABELV $156
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_laser_use
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_think
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $160
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 1
ASGNI4
LABELV $160
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $162
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $163
JUMPV
LABELV $162
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $163
LABELV $154
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 0 0
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_laser_start
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
LABELV $164
endproc SP_target_laser 0 0
export target_teleporter_use
proc target_teleporter_use 12 12
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $167
ADDRGP4 $166
JUMPV
LABELV $167
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $169
ADDRGP4 $171
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $166
JUMPV
LABELV $169
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
LABELV $166
endproc target_teleporter_use 12 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $173
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
LABELV $172
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 36 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $177
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $177
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $177
ADDRGP4 $176
JUMPV
LABELV $177
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $179
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $179
ADDRGP4 $176
JUMPV
LABELV $179
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $181
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $176
ADDRLP4 24
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $176
ADDRLP4 32
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $176
JUMPV
LABELV $181
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
LABELV $176
endproc target_relay_use 36 12
export SP_target_relay
proc SP_target_relay 0 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_relay_use
ASGNP4
LABELV $185
endproc SP_target_relay 0 0
export target_kill_use
proc target_kill_use 8 32
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
LABELV $186
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 target_kill_use
ASGNP4
LABELV $187
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
LABELV $188
endproc SP_target_position 4 8
proc target_location_linkup 16 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+9168
INDIRI4
CNSTI4 0
EQI4 $190
ADDRGP4 $189
JUMPV
LABELV $190
ADDRGP4 level+9168
CNSTI4 1
ASGNI4
ADDRGP4 level+9172
CNSTP4 0
ASGNP4
CNSTI4 608
ARGI4
ADDRGP4 $195
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $203
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $201
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 level+9172
INDIRP4
ASGNP4
ADDRGP4 level+9172
ADDRFP4 0
INDIRP4
ASGNP4
LABELV $201
LABELV $197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $196
LABELV $189
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
LABELV $206
endproc SP_target_location 4 8
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
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
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
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
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
LABELV $203
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $195
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $175
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $171
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $122
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $116
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $114
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $93
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $83
byte 1 49
byte 1 0
align 1
LABELV $82
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $81
byte 1 48
byte 1 0
align 1
LABELV $80
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
