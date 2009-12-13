data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 8
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
INDIRF4
ASGNF4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $58
JUMPV
LABELV $55
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $59
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
ADDRGP4 $54
JUMPV
LABELV $59
LABELV $56
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $58
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $55
ADDRGP4 remapCount
INDIRI4
CNSTI4 128
GEI4 $63
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $63
LABELV $54
endproc AddRemap 8 8
bss
align 1
LABELV $68
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
ADDRGP4 $68
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $69
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $73
ARGP4
ADDRLP4 140
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $68
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $70
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $72
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $69
ADDRGP4 $68
RETP4
LABELV $67
endproc BuildShaderStateConfig 144 24
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $79
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $77
LABELV $79
CNSTI4 0
RETI4
ADDRGP4 $76
JUMPV
LABELV $77
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $84
ADDRGP4 $82
JUMPV
LABELV $84
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $86
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $76
JUMPV
LABELV $86
LABELV $81
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $80
LABELV $82
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $88
CNSTI4 0
RETI4
ADDRGP4 $76
JUMPV
LABELV $88
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $90
ADDRGP4 $92
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $90
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
ADDRLP4 1024
INDIRI4
RETI4
LABELV $76
endproc G_FindConfigstringIndex 1036 12
export G_ModelIndex
proc G_ModelIndex 4 16
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $93
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 288
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $94
endproc G_SoundIndex 4 16
export G_TeamCommand
proc G_TeamCommand 8 8
ADDRFP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $96
CNSTI4 776
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $101
CNSTI4 776
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $103
ADDRGP4 $105
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $103
LABELV $101
LABELV $97
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $99
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $96
LABELV $95
endproc G_TeamCommand 8 8
export G_Find
proc G_Find 8 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $107
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $109
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $114
ADDRGP4 $110
JUMPV
LABELV $114
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
ADDRGP4 $110
JUMPV
LABELV $116
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $118
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $106
JUMPV
LABELV $118
LABELV $110
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $112
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 808
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $109
CNSTP4 0
RETP4
LABELV $106
endproc G_Find 8 8
export G_PickTarget
proc G_PickTarget 144 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
ADDRGP4 $123
ARGP4
ADDRGP4 G_Printf
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $120
JUMPV
LABELV $124
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
ADDRGP4 $126
JUMPV
LABELV $127
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $129
ADDRGP4 $126
JUMPV
LABELV $129
LABELV $125
ADDRGP4 $124
JUMPV
LABELV $126
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $131
ADDRGP4 $133
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
CNSTP4 0
RETP4
ADDRGP4 $120
JUMPV
LABELV $131
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $120
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 24 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
ADDRGP4 $134
JUMPV
LABELV $135
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $137
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $137
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
ADDRLP4 20
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
LABELV $137
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
ADDRGP4 $134
JUMPV
LABELV $140
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $145
ADDRGP4 $147
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $146
JUMPV
LABELV $145
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
LABELV $148
LABELV $146
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $150
ADDRGP4 $152
ARGP4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $134
JUMPV
LABELV $150
LABELV $143
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
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
LABELV $134
endproc G_UseTargets 24 12
bss
align 4
LABELV $154
skip 4
align 4
LABELV $155
skip 96
export tv
code
proc tv 12 0
ADDRLP4 4
ADDRGP4 $154
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 $155
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
RETP4
LABELV $153
endproc tv 12 0
bss
align 4
LABELV $157
skip 4
align 1
LABELV $158
skip 256
export vtos
code
proc vtos 16 24
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 $157
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $158
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $159
ARGP4
ADDRFP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc vtos 16 24
data
align 4
LABELV $161
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $162
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $163
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $164
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 16 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $165
ADDRFP4 4
INDIRP4
ADDRGP4 $162
INDIRB
ASGNB 12
ADDRGP4 $166
JUMPV
LABELV $165
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $167
ADDRFP4 4
INDIRP4
ADDRGP4 $164
INDIRB
ASGNB 12
ADDRGP4 $168
JUMPV
LABELV $167
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
LABELV $168
LABELV $166
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
LABELV $160
endproc G_SetMovedir 16 16
export vectoyaw
proc vectoyaw 20 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $170
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $170
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRGP4 $171
JUMPV
LABELV $170
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $172
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $174
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
ADDRGP4 $175
JUMPV
LABELV $174
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
LABELV $175
LABELV $173
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $176
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $176
LABELV $171
ADDRLP4 0
INDIRF4
RETF4
LABELV $169
endproc vectoyaw 20 8
export G_InitGentity
proc G_InitGentity 4 0
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $179
ASGNP4
ADDRFP4 0
INDIRP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1023
ASGNI4
LABELV $178
endproc G_InitGentity 4 0
export G_Spawn
proc G_Spawn 20 20
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $181
ADDRLP4 0
ADDRGP4 g_entities+51712
ASGNP4
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $189
JUMPV
LABELV $186
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRGP4 $187
JUMPV
LABELV $191
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $193
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+40
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $193
ADDRGP4 level+32
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $193
ADDRGP4 $187
JUMPV
LABELV $193
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $180
JUMPV
LABELV $187
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $189
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $186
ADDRLP4 4
INDIRI4
CNSTI4 1024
EQI4 $197
ADDRGP4 $183
JUMPV
LABELV $197
LABELV $182
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $181
LABELV $183
ADDRLP4 4
INDIRI4
CNSTI4 1022
NEI4 $199
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $201
ADDRGP4 $205
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $202
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $201
ADDRGP4 $207
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $199
ADDRLP4 16
ADDRGP4 level+12
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 808
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 776
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
ADDRLP4 0
INDIRP4
RETP4
LABELV $180
endproc G_Spawn 20 20
export G_EntitiesFree
proc G_EntitiesFree 8 0
ADDRLP4 4
ADDRGP4 g_entities+51712
ASGNP4
ADDRLP4 0
CNSTI4 64
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $213
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $218
ADDRGP4 $214
JUMPV
LABELV $218
CNSTI4 1
RETI4
ADDRGP4 $211
JUMPV
LABELV $214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $216
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $213
CNSTI4 0
RETI4
LABELV $211
endproc G_EntitiesFree 8 0
export G_FreeEntity
proc G_FreeEntity 0 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $221
ADDRGP4 $220
JUMPV
LABELV $221
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 808
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $223
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
LABELV $220
endproc G_FreeEntity 0 12
export G_TempEntity
proc G_TempEntity 20 8
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $226
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
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
RETP4
LABELV $225
endproc G_TempEntity 20 8
export G_KillBox
proc G_KillBox 4168 32
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4156
INDIRI4
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
ADDRLP4 4
CNSTI4 808
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
ADDRGP4 $238
JUMPV
LABELV $241
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4164
CNSTP4 0
ASGNP4
ADDRLP4 4164
INDIRP4
ARGP4
ADDRLP4 4164
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
LABELV $238
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $237
LABELV $232
endproc G_KillBox 4168 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $244
ADDRGP4 $243
JUMPV
LABELV $244
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
LABELV $243
endproc G_AddPredictableEvent 0 12
export G_AddEvent
proc G_AddEvent 16 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $247
ADDRGP4 $249
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
ADDRGP4 $246
JUMPV
LABELV $247
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 8
CNSTI4 128
ASGNI4
ADDRLP4 12
CNSTI4 768
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ADDRLP4 12
INDIRI4
BANDI4
ASGNI4
ADDRLP4 4
INDIRP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $250
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ASGNP4
ADDRLP4 8
CNSTI4 768
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ADDRLP4 8
INDIRI4
BANDI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $251
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
LABELV $246
endproc G_AddEvent 16 8
export G_Sound
proc G_Sound 8 8
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $254
endproc G_Sound 8 8
export G_SetOrigin
proc G_SetOrigin 8 0
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
LABELV $255
endproc G_SetOrigin 8 0
lit
align 4
LABELV $257
byte 4 0
byte 4 0
byte 4 1065353216
export DebugLine
code
proc DebugLine 120 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
ADDRGP4 $257
INDIRB
ASGNB 12
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 0+36
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 60
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 4
ASGNI4
ADDRLP4 60+4
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104
CNSTI4 8
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
INDIRF4
CNSTF4 1065185444
GTF4 $269
ADDRLP4 84
INDIRF4
CNSTF4 3212669092
GEF4 $267
LABELV $269
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48+4
CNSTF4 0
ASGNF4
ADDRLP4 48+8
CNSTF4 0
ASGNF4
ADDRGP4 $268
JUMPV
LABELV $267
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
LABELV $268
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
ADDRLP4 112
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 112
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36
ADDRLP4 0+36
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+4
ADDRLP4 0+36+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+8
ADDRLP4 0+36+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 116
ADDRGP4 trap_DebugPolygonCreate
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
RETI4
LABELV $256
endproc DebugLine 120 12
bss
export remappedShaders
align 4
LABELV remappedShaders
skip 16896
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
import G_TouchSolids
import G_TouchTriggers
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
LABELV $249
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $223
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $207
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $205
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $159
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
byte 1 0
align 1
LABELV $152
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $147
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $92
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $73
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
