export BotVoiceChat_GetFlag
code
proc BotVoiceChat_GetFlag 8 8
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $54
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $61
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $56
LABELV $61
ADDRGP4 $54
JUMPV
LABELV $56
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $62
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
LABELV $62
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
LABELV $54
endproc BotVoiceChat_GetFlag 8 8
export BotVoiceChat_Offense
proc BotVoiceChat_Offense 4 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $65
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_GetFlag
CALLV
pop
ADDRGP4 $64
JUMPV
LABELV $65
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
LABELV $64
endproc BotVoiceChat_Offense 4 12
export BotVoiceChat_Defend
proc BotVoiceChat_Defend 12 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $67
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $74
ADDRGP4 $67
JUMPV
LABELV $73
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $69
JUMPV
LABELV $74
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $69
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
LABELV $67
endproc BotVoiceChat_Defend 12 12
export BotVoiceChat_DefendFlag
proc BotVoiceChat_DefendFlag 0 12
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
LABELV $75
endproc BotVoiceChat_DefendFlag 0 12
export BotVoiceChat_Patrol
proc BotVoiceChat_Patrol 0 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $77
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $78
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
LABELV $76
endproc BotVoiceChat_Patrol 0 12
export BotVoiceChat_Camp
proc BotVoiceChat_Camp 184 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 0+24
ARGP4
ADDRLP4 180
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 180
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $83
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
LABELV $83
LABELV $80
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $86
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 180
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 180
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRGP4 $79
JUMPV
LABELV $86
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 180
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 180
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
LABELV $79
endproc BotVoiceChat_Camp 184 16
export BotVoiceChat_FollowMe
proc BotVoiceChat_FollowMe 184 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $90
ADDRLP4 0+24
ARGP4
ADDRLP4 180
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 180
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $93
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
LABELV $93
LABELV $90
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $96
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 180
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 180
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRGP4 $89
JUMPV
LABELV $96
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 180
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 180
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
LABELV $89
endproc BotVoiceChat_FollowMe 184 16
export BotVoiceChat_FollowFlagCarrier
proc BotVoiceChat_FollowFlagCarrier 8 12
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeamFlagCarrier
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $99
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotVoiceChat_FollowMe
CALLV
pop
LABELV $99
LABELV $98
endproc BotVoiceChat_FollowFlagCarrier 8 12
export BotVoiceChat_ReturnFlag
proc BotVoiceChat_ReturnFlag 4 4
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $102
ADDRGP4 $101
JUMPV
LABELV $102
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 0
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
LABELV $101
endproc BotVoiceChat_ReturnFlag 4 4
export BotVoiceChat_StartLeader
proc BotVoiceChat_StartLeader 0 12
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
LABELV $104
endproc BotVoiceChat_StartLeader 0 12
export BotVoiceChat_StopLeader
proc BotVoiceChat_StopLeader 264 12
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 256
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $106
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
CNSTI1 0
ASGNI1
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
LABELV $106
LABELV $105
endproc BotVoiceChat_StopLeader 264 12
export BotVoiceChat_WhoIsLeader
proc BotVoiceChat_WhoIsLeader 264 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $109
ADDRGP4 $108
JUMPV
LABELV $109
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $111
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $114
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
LABELV $111
LABELV $108
endproc BotVoiceChat_WhoIsLeader 264 12
export BotVoiceChat_WantOnDefense
proc BotVoiceChat_WantOnDefense 44 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $117
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
LABELV $115
endproc BotVoiceChat_WantOnDefense 44 16
export BotVoiceChat_WantOnOffense
proc BotVoiceChat_WantOnOffense 44 16
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $117
ARGP4
ADDRGP4 BotVoiceChatOnly
CALLV
pop
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
LABELV $118
endproc BotVoiceChat_WantOnOffense 44 16
export BotVoiceChat_Dummy
proc BotVoiceChat_Dummy 0 0
LABELV $119
endproc BotVoiceChat_Dummy 0 0
data
export voiceCommands
align 4
LABELV voiceCommands
address $120
address BotVoiceChat_GetFlag
address $121
address BotVoiceChat_Offense
address $122
address BotVoiceChat_Defend
address $123
address BotVoiceChat_DefendFlag
address $124
address BotVoiceChat_Patrol
address $125
address BotVoiceChat_Camp
address $126
address BotVoiceChat_FollowMe
address $127
address BotVoiceChat_FollowFlagCarrier
address $128
address BotVoiceChat_ReturnFlag
address $114
address BotVoiceChat_StartLeader
address $129
address BotVoiceChat_StopLeader
address $130
address BotVoiceChat_WhoIsLeader
address $131
address BotVoiceChat_WantOnDefense
address $132
address BotVoiceChat_WantOnOffense
byte 4 0
address BotVoiceChat_Dummy
export BotVoiceChatCommand
code
proc BotVoiceChatCommand 340 12
ADDRFP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 280
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $134
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $134
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $136
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $136
ADDRLP4 16
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRLP4 0
ADDRLP4 16
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $138
LABELV $139
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $141
ADDRLP4 284
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $142
ADDRLP4 284
INDIRI4
CNSTI4 32
GTI4 $138
LABELV $142
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 288
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 288
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI1 0
ASGNI1
LABELV $144
ADDRLP4 292
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $146
ADDRLP4 292
INDIRI4
CNSTI4 32
LEI4 $143
LABELV $146
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $150
JUMPV
LABELV $147
LABELV $148
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $150
ADDRLP4 300
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $151
ADDRLP4 300
INDIRI4
CNSTI4 32
GTI4 $147
LABELV $151
ADDRGP4 $153
JUMPV
LABELV $152
ADDRLP4 304
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 304
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI1 0
ASGNI1
LABELV $153
ADDRLP4 308
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $155
ADDRLP4 308
INDIRI4
CNSTI4 32
LEI4 $152
LABELV $155
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 312
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $156
LABELV $157
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $159
ADDRLP4 316
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $160
ADDRLP4 316
INDIRI4
CNSTI4 32
GTI4 $156
LABELV $160
ADDRGP4 $162
JUMPV
LABELV $161
ADDRLP4 320
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 320
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 320
INDIRP4
CNSTI1 0
ASGNI1
LABELV $162
ADDRLP4 324
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $164
ADDRLP4 324
INDIRI4
CNSTI4 32
LEI4 $161
LABELV $164
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 276
ADDRLP4 328
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 332
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 0
NEI4 $165
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $165
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $171
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands+4
ADDP4
INDIRP4
CALLV
pop
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $171
LABELV $168
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 voiceCommands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $167
CNSTI4 0
RETI4
LABELV $133
endproc BotVoiceChatCommand 340 12
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import maxclients
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import BotSetUserInfo
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $132
byte 1 119
byte 1 97
byte 1 110
byte 1 116
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
LABELV $131
byte 1 119
byte 1 97
byte 1 110
byte 1 116
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
LABELV $130
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $128
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
LABELV $127
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $126
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $124
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $123
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $122
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $121
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $117
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $116
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $113
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $88
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 101
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $78
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
LABELV $77
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
