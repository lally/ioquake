export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $73
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $77
ADDRGP4 $74
JUMPV
LABELV $77
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $84-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $84
address $81
address $81
address $81
address $79
address $81
address $79
address $79
address $79
address $79
address $81
code
LABELV $81
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
ADDRGP4 $80
JUMPV
LABELV $79
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 200
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
MULI4
ADDI4
ASGNI4
LABELV $80
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $86
ADDRGP4 cg+124392
CNSTI4 0
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $86
LABELV $74
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 14
LTI4 $73
ADDRLP4 12
ADDRGP4 cg+124392
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $90
ADDRGP4 cg+124392
CNSTI4 2
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $90
ADDRGP4 cg+124392
CNSTI4 1
ASGNI4
LABELV $91
ADDRGP4 cg+124392
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $94
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $94
LABELV $71
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 84 16
ADDRGP4 cg+124416
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 40
GEI4 $103
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 28
CNSTF4 1109393408
ADDRLP4 20
INDIRI4
CVIF4 4
DIVF4
ASGNF4
LABELV $104
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $105
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $105
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $107
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $107
ADDRLP4 60
CNSTI4 255
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $109
ADDRFP4 4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $109
ADDRGP4 cg+124692
CNSTF4 0
ASGNF4
ADDRGP4 cg+124696
CNSTF4 0
ASGNF4
ADDRGP4 cg+124740
CNSTF4 0
ASGNF4
ADDRGP4 cg+124736
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $110
JUMPV
LABELV $109
ADDRLP4 64
CNSTF4 1135869952
ASGNF4
ADDRLP4 68
CNSTF4 1132396544
ASGNF4
ADDRLP4 56
ADDRLP4 64
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 52
ADDRLP4 64
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 32+8
CNSTF4 0
ASGNF4
ADDRLP4 32
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
CNSTP4 0
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 76
INDIRF4
ADDRGP4 cg+109044+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRLP4 76
INDIRF4
ADDRGP4 cg+109044+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 48
ADDRLP4 76
INDIRF4
ADDRGP4 cg+109044+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109044+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109044+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1036831949
GEF4 $161
ADDRLP4 44
CNSTF4 1036831949
ASGNF4
LABELV $161
ADDRGP4 cg+124740
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+124736
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $165
ADDRLP4 16
CNSTF4 1036831949
ASGNF4
LABELV $165
ADDRGP4 cg+124692
ADDRLP4 24
INDIRF4
NEGF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
ADDRGP4 cg+124696
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
ASGNF4
LABELV $110
ADDRGP4 cg+124692
INDIRF4
CNSTF4 1065353216
LEF4 $169
ADDRGP4 cg+124692
CNSTF4 1065353216
ASGNF4
LABELV $169
ADDRGP4 cg+124692
INDIRF4
CNSTF4 3212836864
GEF4 $173
ADDRGP4 cg+124692
CNSTF4 3212836864
ASGNF4
LABELV $173
ADDRGP4 cg+124696
INDIRF4
CNSTF4 1065353216
LEF4 $177
ADDRGP4 cg+124696
CNSTF4 1065353216
ASGNF4
LABELV $177
ADDRGP4 cg+124696
INDIRF4
CNSTF4 3212836864
GEF4 $181
ADDRGP4 cg+124696
CNSTF4 3212836864
ASGNF4
LABELV $181
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $185
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $185
ADDRGP4 cg+124700
ADDRLP4 12
INDIRF4
ASGNF4
ADDRGP4 cg+124732
ADDRGP4 cg+107604
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
ADDRGP4 cg+124688
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
LABELV $99
endproc CG_DamageFeedback 84 16
export CG_Respawn
proc CG_Respawn 0 0
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
ADDRGP4 cg+124676
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRGP4 cg+108944
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
LABELV $192
endproc CG_Respawn 0 0
export CG_CheckPlayerstateEvents
proc CG_CheckPlayerstateEvents 52 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 128
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $199
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $199
ADDRLP4 4
CNSTI4 728
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
LABELV $199
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $208
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LEI4 $206
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 32
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
CNSTI4 112
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
EQI4 $206
LABELV $208
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108856
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 48
ADDRGP4 cg+108852
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
LABELV $203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $202
LABELV $198
endproc CG_CheckPlayerstateEvents 52 8
export CG_CheckChangedPredictableEvents
proc CG_CheckChangedPredictableEvents 24 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $213
ADDRLP4 0
INDIRI4
ADDRGP4 cg+108852
INDIRI4
LTI4 $217
ADDRGP4 $214
JUMPV
LABELV $217
ADDRLP4 0
INDIRI4
ADDRGP4 cg+108852
INDIRI4
CNSTI4 16
SUBI4
LEI4 $220
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 cg+108856
ADDP4
INDIRI4
EQI4 $223
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108856
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $227
ADDRGP4 $230
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $227
LABELV $223
LABELV $220
LABELV $214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $216
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $213
LABELV $211
endproc CG_CheckChangedPredictableEvents 24 8
proc pushReward 4 0
ADDRGP4 cg+124424
INDIRI4
CNSTI4 9
GEI4 $232
ADDRLP4 0
ADDRGP4 cg+124424
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 cg+124424
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124512
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 cg+124424
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124472
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 cg+124424
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+124432
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $232
LABELV $231
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 88 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 260
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $243
ADDRGP4 $242
JUMPV
LABELV $243
ADDRLP4 24
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $245
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 8
RSHI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 50
LEI4 $247
ADDRGP4 cgs+152340+952
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $246
JUMPV
LABELV $247
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $253
ADDRLP4 16
INDIRI4
CNSTI4 100
LEI4 $251
LABELV $253
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $246
JUMPV
LABELV $251
ADDRGP4 cgs+152340+948
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $246
JUMPV
LABELV $245
ADDRLP4 28
CNSTI4 252
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $258
ADDRGP4 cgs+152340+960
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $258
LABELV $246
ADDRLP4 32
CNSTI4 184
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $262
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $264
ADDRGP4 cg+108104
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
LABELV $264
LABELV $262
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $267
ADDRGP4 $242
JUMPV
LABELV $267
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 36
CNSTI4 304
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
EQI4 $270
ADDRGP4 cgs+152340+1048
INDIRI4
ARGI4
ADDRGP4 cgs+152340+616
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $270
ADDRLP4 40
CNSTI4 284
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $276
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 1
NEI4 $278
ADDRLP4 4
ADDRGP4 cgs+152340+988
INDIRI4
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $278
ADDRLP4 4
ADDRGP4 cgs+152340+964
INDIRI4
ASGNI4
LABELV $279
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+152340+596
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $276
ADDRLP4 44
CNSTI4 288
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
EQI4 $286
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 1
NEI4 $288
ADDRLP4 4
ADDRGP4 cgs+152340+992
INDIRI4
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $288
ADDRLP4 4
ADDRGP4 cgs+152340+968
INDIRI4
ASGNI4
LABELV $289
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+152340+600
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $286
ADDRLP4 48
CNSTI4 300
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
EQI4 $296
ADDRFP4 4
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
NEI4 $298
ADDRLP4 4
ADDRGP4 cgs+152340+996
INDIRI4
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $298
ADDRLP4 4
ADDRGP4 cgs+152340+976
INDIRI4
ASGNI4
LABELV $299
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+152340+604
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $296
ADDRLP4 52
CNSTI4 292
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
EQI4 $306
ADDRGP4 cgs+152340+984
INDIRI4
ARGI4
ADDRGP4 cgs+152340+608
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $306
ADDRLP4 56
CNSTI4 296
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
EQI4 $312
ADDRGP4 cgs+152340+980
INDIRI4
ARGI4
ADDRGP4 cgs+152340+612
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $312
ADDRLP4 60
CNSTI4 268
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
EQI4 $318
ADDRLP4 64
CNSTI4 268
ASGNI4
ADDRLP4 68
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
EQI4 $320
ADDRGP4 cgs+152340+972
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $321
JUMPV
LABELV $320
ADDRLP4 72
CNSTI4 268
ASGNI4
ADDRLP4 76
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
BANDI4
EQI4 $324
ADDRGP4 cgs+152340+976
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $325
JUMPV
LABELV $324
ADDRLP4 80
CNSTI4 268
ASGNI4
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
EQI4 $328
ADDRGP4 cgs+152340+1132
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $328
LABELV $325
LABELV $321
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $318
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $332
ADDRLP4 64
CNSTI4 340
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
EQI4 $338
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $339
LABELV $338
ADDRLP4 72
CNSTI4 344
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
EQI4 $340
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $339
LABELV $340
ADDRLP4 80
CNSTI4 348
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
EQI4 $335
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $335
LABELV $339
ADDRGP4 cgs+152340+1124
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $335
LABELV $332
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $343
ADDRGP4 cg+124656
INDIRI4
CNSTI4 0
NEI4 $345
ADDRLP4 64
CNSTI4 256
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
EQI4 $348
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $350
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $353
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $354
JUMPV
LABELV $353
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16384
NEI4 $357
ADDRGP4 cgs+152340+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $358
JUMPV
LABELV $357
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $361
ADDRGP4 cgs+152340+1008
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $361
LABELV $358
LABELV $354
LABELV $350
LABELV $348
LABELV $345
LABELV $343
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 0
LEI4 $365
ADDRLP4 64
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34796
INDIRI4
SUBI4
ASGNI4
ADDRGP4 cg+107616
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $370
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 2000
ADDI4
LEI4 $370
ADDRLP4 68
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
ADDRGP4 cgs+152340+932
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $371
JUMPV
LABELV $370
ADDRGP4 cg+107616
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $377
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 60000
SUBI4
LEI4 $377
ADDRLP4 68
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
ADDRGP4 cgs+152340+924
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
ADDRGP4 $378
JUMPV
LABELV $377
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 5
LEI4 $384
ADDRGP4 cg+107616
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $384
ADDRLP4 64
INDIRI4
CNSTI4 1000
CNSTI4 60
ADDRGP4 cgs+31476
INDIRI4
MULI4
MULI4
CNSTI4 300000
SUBI4
LEI4 $384
ADDRLP4 68
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $384
LABELV $378
LABELV $371
LABELV $365
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 0
LEI4 $392
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
GEI4 $392
ADDRLP4 8
ADDRGP4 cgs+34800
INDIRI4
ASGNI4
ADDRGP4 cg+107620
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $397
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
CNSTI4 1
SUBI4
NEI4 $397
ADDRLP4 64
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $398
JUMPV
LABELV $397
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 64
INDIRI4
LEI4 $404
ADDRGP4 cg+107620
INDIRI4
ADDRLP4 64
INDIRI4
BANDI4
CNSTI4 0
NEI4 $404
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 64
INDIRI4
SUBI4
NEI4 $404
ADDRLP4 68
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
ADDRGP4 cgs+152340+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $405
JUMPV
LABELV $404
ADDRLP4 68
CNSTI4 3
ASGNI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $412
ADDRGP4 cg+107620
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $412
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31468
INDIRI4
ADDRLP4 68
INDIRI4
SUBI4
NEI4 $412
ADDRLP4 72
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $412
LABELV $405
LABELV $398
LABELV $392
LABELV $242
endproc CG_CheckLocalSounds 88 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 24 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
CNSTI4 140
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
EQI4 $421
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
LABELV $421
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
EQI4 $424
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $424
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
LABELV $424
ADDRLP4 12
CNSTI4 264
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
EQI4 $426
ADDRGP4 CG_Respawn
CALLV
pop
LABELV $426
ADDRGP4 cg+107624
INDIRI4
CNSTI4 0
EQI4 $428
ADDRGP4 CG_Respawn
CALLV
pop
ADDRGP4 cg+107624
CNSTI4 0
ASGNI4
LABELV $428
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $432
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $432
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
LABELV $432
ADDRGP4 CG_CheckAmmo
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
ADDRLP4 16
CNSTI4 164
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
EQI4 $435
ADDRLP4 20
CNSTI4 164
ASGNI4
ADDRGP4 cg+108928
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
ADDRGP4 cg+108932
ADDRGP4 cg+107604
INDIRI4
ASGNI4
LABELV $435
LABELV $420
endproc CG_TransitionPlayerState 24 12
import eventnames
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
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
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
LABELV $230
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
