export PM_SlideMove
code
proc PM_SlideMove 316 28
ADDRLP4 208
CNSTI4 4
ASGNI4
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $43
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 116
ADDRLP4 224
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRLP4 224
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTF4 1056964608
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
MULF4
ASGNF4
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $50
ADDRLP4 232
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 232
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
LABELV $50
LABELV $43
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $56
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
ADDRGP4 $57
JUMPV
LABELV $56
ADDRLP4 96
CNSTI4 0
ASGNI4
LABELV $57
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $67
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
CNSTI4 1
RETI4
ADDRGP4 $42
JUMPV
LABELV $67
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $69
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
LABELV $69
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $73
ADDRGP4 $63
JUMPV
LABELV $73
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $78
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
CNSTI4 1
RETI4
ADDRGP4 $42
JUMPV
LABELV $78
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
ADDRLP4 256
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 128+24
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 256
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $84
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $82
JUMPV
LABELV $84
LABELV $81
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $80
LABELV $82
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $98
ADDRGP4 $62
JUMPV
LABELV $98
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 260
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $107
ADDRGP4 $102
JUMPV
LABELV $107
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+108
INDIRF4
LEF4 $109
ADDRGP4 pml+108
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
LABELV $109
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
ADDRLP4 116
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $117
ADDRGP4 $114
JUMPV
LABELV $117
ADDRLP4 264
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 264
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $119
ADDRGP4 $114
JUMPV
LABELV $119
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
ADDRLP4 104
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
ADDRLP4 268
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 268
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $125
ADDRGP4 $114
JUMPV
LABELV $125
ADDRLP4 272
CNSTI4 12
ASGNI4
ADDRLP4 272
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 272
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
ADDRLP4 276
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 280
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 276
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRLP4 276
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 288
CNSTI4 12
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 288
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
ADDRLP4 292
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 100
ADDRLP4 292
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRLP4 292
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $151
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $149
LABELV $151
ADDRGP4 $146
JUMPV
LABELV $149
ADDRLP4 304
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 304
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $152
ADDRGP4 $146
JUMPV
LABELV $152
ADDRLP4 308
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 312
CNSTF4 0
ASGNF4
ADDRLP4 308
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 312
INDIRF4
ASGNF4
ADDRLP4 308
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 312
INDIRF4
ASGNF4
ADDRLP4 308
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 312
INDIRF4
ASGNF4
CNSTI4 1
RETI4
ADDRGP4 $42
JUMPV
LABELV $146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $145
LABELV $114
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $116
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $113
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $101
LABELV $103
LABELV $62
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $61
LABELV $63
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $158
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
LABELV $158
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
LABELV $160
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $163
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $164
ADDRLP4 224
INDIRI4
RETI4
LABELV $42
endproc PM_SlideMove 316 28
export PM_StepSlideMove
proc PM_StepSlideMove 168 28
ADDRLP4 132
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 132
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
ADDRLP4 92
ADDRLP4 132
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $166
ADDRGP4 $165
JUMPV
LABELV $166
ADDRLP4 80
ADDRLP4 68
INDIRB
ASGNB 12
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 140
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
ADDRLP4 144
CNSTF4 0
ASGNF4
ADDRLP4 56
ADDRLP4 144
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $171
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $181
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $171
LABELV $181
ADDRGP4 $165
JUMPV
LABELV $171
ADDRLP4 148
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
ADDRLP4 120
ADDRLP4 148
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
ADDRLP4 56
ADDRLP4 68
INDIRB
ASGNB 12
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 152
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 152
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $183
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $165
ADDRGP4 $187
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
ADDRGP4 $165
JUMPV
LABELV $183
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 156
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $193
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
LABELV $193
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $196
ADDRLP4 164
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
LABELV $196
ADDRLP4 164
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 1073741824
LEF4 $201
ADDRLP4 164
INDIRF4
CNSTF4 1088421888
GEF4 $203
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $204
JUMPV
LABELV $203
ADDRLP4 164
INDIRF4
CNSTF4 1093664768
GEF4 $205
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $206
JUMPV
LABELV $205
ADDRLP4 164
INDIRF4
CNSTF4 1097859072
GEF4 $207
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
ADDRGP4 $208
JUMPV
LABELV $207
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
LABELV $208
LABELV $206
LABELV $204
LABELV $201
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
ADDRGP4 $211
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $209
LABELV $165
endproc PM_StepSlideMove 168 28
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import pm
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
LABELV $211
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $187
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
