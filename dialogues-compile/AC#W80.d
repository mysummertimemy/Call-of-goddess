/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialogues in Graz'zt's prison
***********************************************************************************************************************************************
**********************************************************************************************************************************************/

BEGIN ~AC#W80MA~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W80MA hello_01
@0
==AC#WAUK1 @1
==AC#W80MA @2
==AC#W80MA @3
==AC#W80MA @4
==AC#WAUK1 @5
==AC#W80MA @6
==AC#WAUK1 @7
==AC#W80MA @8
=@9 
=@10
DO ~SetGlobal("AC#W80MarettaSpawn","GLOBAL",3)
Enemy()~ EXIT



//Deva
BEGIN ~AC#W80DV~
CHAIN IF ~GlobalGT("Retrieve_DevaSpark","AC#W80",10)~ THEN AC#W80DV hello_spark
@11
END
IF~~THEN EXTERN AC#W80DV bye_finished

	CHAIN AC#W80DV bye_finished
	@12
	END
	IF~~THEN DO ~EraseJournalEntry(@800010)
	AddJournalEntry(@800011,QUEST_DONE)
	AddexperienceParty(3500)
	ReallyForceSpell([PC],GENIE_LIMITED_WISH_HEAL_ALL)  
	EscapeArea()~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W80DV hello_0
@13
END
IF~~THEN REPLY @14 DO ~SetGlobal("About_Waukeen","LOCALS",1)~ EXTERN AC#W80DV searching_waukeen
IF~~THEN REPLY @15 EXTERN AC#W80DV not_telling
IF~GlobalGT("AC#W_Met_Deva","GLOBAL",0)~THEN REPLY @16 EXTERN AC#W80DV met_before
IF~~THEN REPLY @17 EXTERN AC#W80DV bye
IF~~THEN REPLY @18 EXTERN AC#W80DV bye
IF~~THEN REPLY @19 EXTERN AC#W80DV bye_leave

CHAIN IF ~True()~ THEN AC#W80DV hello_again
@20
END
IF~Global("About_Waukeen","LOCALS",0)~THEN REPLY @21 DO ~SetGlobal("About_Waukeen","LOCALS",1)~ EXTERN AC#W80DV searching_waukeen
IF~Global("About_Waukeen","LOCALS",1)~THEN REPLY @22 DO ~SetGlobal("About_Waukeen","LOCALS",2)~ EXTERN AC#W80DV help_me_with_waukeen
IF~GlobalGT("Retrieve_DevaSpark","AC#W80",0)
GlobalLT("Retrieve_DevaSpark","AC#W80",10)~THEN REPLY @23 EXTERN AC#W80DV about_deva_spark
IF~~THEN REPLY @24 EXTERN AC#W80DV which_enemies
IF~~THEN REPLY @18 EXTERN AC#W80DV bye
IF~~THEN REPLY @19 EXTERN AC#W80DV bye_leave

		CHAIN IF ~~ THEN AC#W80DV which_enemies
		@25
		END
		IF~~THEN REPLY @26 EXTERN AC#W80DV marilith
		IF~~THEN REPLY @18 EXTERN AC#W80DV bye
		
		CHAIN IF ~~ THEN AC#W80DV marilith
		@27
		END
		IF~~THEN REPLY @18 EXTERN AC#W80DV bye
			
			CHAIN IF ~~ THEN AC#W80DV about_deva_spark
			@28
			END
			IF~PartyHasItem("AC#WDVSP")~THEN REPLY @29 DO ~TakePartyItem("AC#WDVSP")~ EXTERN AC#W80DV have_deva_spark_01
			IF~~THEN REPLY @30 EXTERN AC#W80DV bye_spark
			
				CHAIN IF ~~ THEN AC#W80DV have_deva_spark_01
				@31
				END
				IF~~THEN DO ~SetGlobal("Retrieve_DevaSpark","AC#W80",10)~ EXIT
			
		CHAIN IF ~~ THEN AC#W80DV met_before
		@32
		END
		IF~~THEN REPLY @14 DO ~SetGlobal("About_Waukeen","LOCALS",1)~ EXTERN AC#W80DV searching_waukeen
		IF~~THEN REPLY @15 EXTERN AC#W80DV not_telling
		IF~~THEN REPLY @17 EXTERN AC#W80DV bye
		IF~~THEN REPLY @18 EXTERN AC#W80DV bye
		
		CHAIN IF ~~ THEN AC#W80DV not_telling
		@33
		END
		IF~~THEN EXTERN AC#W80DV thanks_for_opening_door

		CHAIN IF ~~ THEN AC#W80DV thanks_for_opening_door
		@34
		END
		IF~~THEN REPLY @35 EXTERN AC#W80DV deva_spark_01
		IF~~THEN REPLY @36 EXTERN AC#W80DV bye_leave
		
	CHAIN IF ~~ THEN AC#W80DV searching_waukeen
	@37
	END
	IF~~THEN REPLY @38 EXTERN AC#W80DV show_waukeen_cell
	IF~~THEN REPLY @39 EXTERN AC#W80DV show_waukeen_cell
	IF~~THEN REPLY @18 EXTERN AC#W80DV bye
	
		CHAIN IF ~~ THEN AC#W80DV show_waukeen_cell
		@40
		END
		IF~~THEN REPLY @22 DO ~SetGlobal("About_Waukeen","LOCALS",2)~ EXTERN AC#W80DV help_me_with_waukeen
		IF~~THEN REPLY @18 EXTERN AC#W80DV bye
		
		CHAIN IF ~~ THEN AC#W80DV help_me_with_waukeen
		@41
		END
		IF~~THEN EXTERN AC#W80DV deva_spark_01

		
			CHAIN IF ~~ THEN AC#W80DV deva_spark_01
			@42
			END
			IF~~THEN DO ~SetGlobal("Deva_Spark","LOCALS",1)~ EXTERN AC#W80DV deva_spark_02
			
			CHAIN IF ~~ THEN AC#W80DV deva_spark_02
			@43
			END
			IF~~THEN REPLY @44 EXTERN AC#W80DV deva_spark_03
			IF~~THEN REPLY @18 EXTERN AC#W80DV bye
			
				CHAIN IF ~~ THEN AC#W80DV deva_spark_03
				@45
				END
				IF~~THEN REPLY @46 DO ~SetGlobal("Retrieve_DevaSpark","AC#W80",1)
				AddJournalEntry(@800010,QUEST)~ EXTERN AC#W80DV bye_spark
				IF~~THEN REPLY @18 EXTERN AC#W80DV bye

	CHAIN AC#W80DV bye
	@47
	EXIT
	
	CHAIN AC#W80DV bye_leave
	@48
	END
	IF~~THEN DO ~EscapeArea()~ EXIT
	
	CHAIN AC#W80DV bye_spark
	@49
	END
	IF~~THEN EXIT
	
// Lich Morgrath the Corruptor in prison (AC#W80)
BEGIN ~AC#W80LI~
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W80LI hello_0
@50
END
IF~~THEN REPLY @51 EXTERN AC#W80LI a_little_thank_you
IF~~THEN REPLY @52 EXTERN AC#W80LI bye
IF~~THEN REPLY @53 EXTERN AC#W80LI bye

	CHAIN IF ~~ THEN AC#W80LI a_little_thank_you
	@54
	END
	IF~~THEN REPLY @52 EXTERN AC#W80LI bye
	IF~~THEN REPLY @53 EXTERN AC#W80LI bye

	CHAIN AC#W80LI bye
	@55
	DO ~Enemy()~ EXIT

// Shadowsong, the undead bard in prison (AC#W80)
BEGIN ~AC#W80BR~

CHAIN IF ~True()~ THEN AC#W80BR hello_0
@56
END
IF~~THEN REPLY @57 EXTERN AC#W80BR what_happened
IF~~THEN REPLY @58 EXTERN AC#W80BR get_out
IF ~Global("Grazzt_song","LOCALS",1)~ THEN REPLY @59 + sing_grazzt_song_again
IF~~THEN REPLY @60 EXTERN AC#W80BR bye

	CHAIN AC#W80BR sing_grazzt_song_again
	@61
	EXIT
	
	CHAIN IF ~~ THEN AC#W80BR what_happened
	@62
	END
	IF~~THEN REPLY @63 EXTERN AC#W80BR what_happened_02
	IF~~THEN REPLY @58 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
	CHAIN IF ~~ THEN AC#W80BR what_happened_02
	@64 
	=
	@65
	=
	@66
	END
	IF~~THEN REPLY @67 EXTERN AC#W80BR how_can_i_help
	IF ~~ THEN REPLY @68 + sing_song
	IF ~Global("Grazzt_song","LOCALS",0)~ THEN REPLY @69 + sing_grazzt_song_01
	IF ~Global("Grazzt_song","LOCALS",1)~ THEN REPLY @59 + sing_grazzt_song_again
	IF~~THEN REPLY @70 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
		CHAIN IF ~~ THEN AC#W80BR sing_grazzt_song_01
		@71
		END
		IF~~THEN REPLY @72 EXTERN AC#W80BR sing_grazzt_song_02
		IF~~THEN REPLY @73 EXTERN AC#W80BR get_out
		IF~~THEN REPLY @60 EXTERN AC#W80BR bye
		
			CHAIN IF ~~ THEN AC#W80BR sing_grazzt_song_02
			@74
			END
			IF~~THEN REPLY @75 EXTERN AC#W80BR bye
			IF~~THEN REPLY @76 DO ~SetGlobal("Grazzt_song","LOCALS",1)~ EXTERN AC#W80BR sing_grazzt_song_03
			IF~~THEN REPLY @77 DO ~SetGlobal("Grazzt_song","LOCALS",1)~ EXTERN AC#W80BR sing_grazzt_song_03
			
				CHAIN IF ~~ THEN AC#W80BR sing_grazzt_song_03
				@78
=
@79
=
@80
=
@81
=
@82
END
IF~~THEN EXTERN AC#W80BR add_special_ability

				CHAIN IF ~~ THEN AC#W80BR add_special_ability
				@83
				END
				IF~~THEN DO ~ActionOverride(Player1,AddSpecialAbility("AC#WBD1"))
				SetGlobal("Learned_Grazzt_song","AC#W80",1)~ EXTERN AC#W80BR nothing_happened

				CHAIN IF ~~ THEN AC#W80BR nothing_happened
				@84
				END
				IF~~THEN REPLY @85 EXTERN AC#W80BR sing_grazzt_song_04
				IF~~THEN REPLY @86 EXTERN AC#W80BR sing_grazzt_song_04
				IF~~THEN REPLY @87 EXTERN AC#W80BR get_out
				IF~~THEN REPLY @60 EXTERN AC#W80BR bye
			
			CHAIN IF ~~ THEN AC#W80BR sing_grazzt_song_04
		@88
		END
		IF~~THEN REPLY @89 EXTERN AC#W80BR get_out
		IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
	CHAIN IF ~~ THEN AC#W80BR sing_song
	@90
=
@91
=
@92
	END
	IF~~THEN REPLY @93 EXTERN AC#W80BR nice_song
	IF ~Global("Grazzt_song","LOCALS",0)~ THEN REPLY @69 + sing_grazzt_song_01
	IF ~Global("Grazzt_song","LOCALS",1)~ THEN REPLY @59 + sing_grazzt_song_again
	IF~~THEN REPLY @94 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @58 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
		CHAIN IF ~~ THEN AC#W80BR nice_song
		@95
		END
		IF ~Global("Grazzt_song","LOCALS",0)~ THEN REPLY @69 + sing_grazzt_song_01
		IF ~Global("Grazzt_song","LOCALS",1)~ THEN REPLY @59 + sing_grazzt_song_again
		IF~~THEN REPLY @70 EXTERN AC#W80BR get_out
		IF~~THEN REPLY @60 EXTERN AC#W80BR bye

	CHAIN IF ~~ THEN AC#W80BR how_can_i_help
	@96
	END
	IF~~THEN REPLY @97 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @58 EXTERN AC#W80BR get_out
	IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
	CHAIN IF ~~ THEN AC#W80BR get_out
	@98
	END
	IF~~THEN REPLY @99 EXTERN AC#W80BR bye
	IF~~THEN REPLY @60 EXTERN AC#W80BR bye
	
	CHAIN AC#W80BR bye
	@100
	EXIT
 
 
// Emer the mad in prison (AC#W80)
BEGIN ~AC#W80BG~

CHAIN IF ~True()~ THEN AC#W80BG hello_0
@101
END
IF~~THEN REPLY @102 EXTERN AC#W80BG 01
IF~~THEN REPLY @103 EXTERN AC#W80BG 01
IF~~THEN REPLY @104 EXTERN AC#W80BG 01
IF~~THEN REPLY @105 EXTERN AC#W80BG bye

	CHAIN IF ~~ THEN AC#W80BG 01
	@106
	END
	IF~~THEN REPLY @107 EXTERN AC#W80BG 02
	IF~~THEN REPLY @108 EXTERN AC#W80BG 02
	
	CHAIN IF ~~ THEN AC#W80BG 02
	@109
	= @110
	END
	IF~~THEN REPLY @111 EXTERN AC#W80BG bye_women
	IF~~THEN REPLY @112 EXTERN AC#W80BG bye_women
	
	CHAIN AC#W80BG bye_women
	@113
	EXIT
	
	CHAIN AC#W80BG bye
	@114
	EXIT
 
BEGIN ~AC#W80Q1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @115
   IF ~~ THEN REPLY @116 GOTO 1
   IF ~~ THEN REPLY @117 GOTO 2
END

IF ~~ THEN BEGIN 1
   SAY @118
   IF ~~ THEN REPLY @119 GOTO 3
   IF ~~ THEN REPLY @120 GOTO 4
END

IF ~~ THEN BEGIN 2
   SAY @121
   IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
   Wait(1)
   DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 3
   SAY @122
   IF ~~ THEN REPLY @123 GOTO 2
   IF ~~ THEN REPLY @124 GOTO 5
END 

IF ~~ THEN BEGIN 4
   SAY @125
   IF ~~ THEN REPLY @126 GOTO 2
   IF ~~ THEN REPLY @124 GOTO 5
   IF ~~ THEN REPLY @119 GOTO 3
END

IF ~~ THEN BEGIN 5
   SAY @127
   IF ~~ THEN REPLY @128 GOTO 6
END

IF ~~ THEN BEGIN 6
   SAY @129
   IF ~~ THEN DO ~Face(4)
   Swing()
   Wait(3)
   NoAction()
   ~EXIT
END

/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Der gefangene Succubus
**************************************************************************************************************************************************
**************************************************************************************************************************************************/
BEGIN ~AC#W80S1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @130
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ KELDORN_SUCCUBUS
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @131 GOTO 1
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @132 GOTO 2
END

IF ~~ THEN BEGIN 1
   SAY @133
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
   SAY @134
   IF ~~ THEN EXIT
END

IF ~Global("AC_Succubus_Free","AC#W80",1)
Gender(LastTalkedToBy,MALE)~ THEN BEGIN 3
   SAY @135
IF ~~ THEN GOTO reward
IF ~NumInPartyGT(1)~ THEN GOTO barbarians
END


IF ~~ THEN BEGIN barbarians
SAY @136
   IF ~~ THEN REPLY @137 GOTO 4
   IF ~~ THEN REPLY @138 GOTO reward
END

IF ~~ THEN BEGIN 4
   SAY @139
   IF ~~ THEN DO ~SetGlobal("AC_Succubus_Free","AC#W80",2)~ EXIT
END

IF ~Global("AC_Succubus_Free","AC#W80",1)
Gender(LastTalkedToBy,FEMALE)~ THEN BEGIN 3
   SAY @140
IF ~~ THEN GOTO reward
END

IF ~~ THEN BEGIN reward
SAY @141
   IF ~~ THEN DO ~SetGlobal("AC_Succubus_Free","AC#W80",2)~ EXIT
END
   /*************************************************************************************************************************************************
**************************************************************************************************************************************************
Die falsche Waukeen
**************************************************************************************************************************************************
**************************************************************************************************************************************************/

BEGIN ~AC#WMRL1~

IF ~Global("NasmaeraeIlluDetect","AC#W80",1)~ THEN BEGIN ILLUSION_DETECTED
   SAY @145
   IF ~~ THEN DO ~SetGlobal("AC_Marilith_Reveal","AC#W80",1)
   SetGlobal("AC_Nasmaerae_Free","AC#W80",7)~ EXIT
END

IF ~Global("AC_Nasmaerae_Free","AC#W80",3)~ THEN BEGIN WAIT_1
   SAY @142
   IF ~~ THEN REPLY @143 GOTO WAIT_2
   IF ~~ THEN REPLY @144 GOTO 7
END

IF ~Global("AC_Nasmaerae_Free","AC#W80",6)~ THEN BEGIN WAIT_3
   SAY @145
   IF ~~ THEN DO ~SetGlobal("AC_Marilith_Reveal","AC#W80",1)
   SetGlobal("AC_Nasmaerae_Free","AC#W80",7)~ EXIT
END

IF ~Global("AC_Nasmaerae_Free","AC#W80",9)~ THEN BEGIN GAME_OVER_1
   SAY @146
   IF ~~ THEN REPLY @147 GOTO GAME_OVER_2
   IF ~~ THEN REPLY @148 GOTO GAME_OVER_3
END

IF ~~ THEN BEGIN GAME_OVER_2
   SAY @149
   IF ~~ THEN DO ~SetGlobal("AC_Marilith_Reveal","AC#W80",1)~ EXIT
END

IF ~~ THEN BEGIN GAME_OVER_3
   SAY @150
   IF ~~ THEN DO ~SetGlobal("AC_Marilith_Reveal","AC#W80",1)~ EXIT
END

IF ~Global("AC_Cell_Open","AC#W80",1)
   Global("AC_Marilith_Reveal","AC#W80",0)~ THEN BEGIN TRAP_1
   SAY @151
   IF ~~ THEN REPLY @152 GOTO GAME_OVER_00
   IF ~~ THEN REPLY @153 GOTO 7
   IF ~~ THEN REPLY @154 GOTO 7
END  
   
 IF ~~ THEN BEGIN GAME_OVER_00
SAY @155
   IF ~~ THEN DO ~SetGlobal("AC_Nasmaerae_Free","AC#W80",8)~ EXIT
END

IF ~~ THEN BEGIN WAIT_2
   SAY @156
   IF ~~ THEN DO ~SetGlobal("AC_Nasmaerae_Free","AC#W80",4)~ EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @157
   IF ~~ THEN DO ~SetGlobal("AC_Waukeen_Ambush","AC#W80",1)~ EXIT
END

IF ~Global("AC_Waukeen_Ambush","AC#W80",3)~ THEN BEGIN 1
   SAY @158
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @159 GOTO 2
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @160 GOTO 3
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @161 GOTO 4
   IF ~!IsValidForPartyDialog("Keldorn")~ THEN REPLY @162 GOTO 5
   IF ~!IsValidForPartyDialog("Keldorn")
   OR(2)
   CheckStatGT(LastTalkedToBy,15,WIS)
   CheckStatGT(LastTalkedToBy,13,INT)~ THEN REPLY @163 GOTO 6
   IF ~!IsValidForPartyDialog("Keldorn")
   GlobalGT("AC_Succubus_Free","AC#W80",1)
   ~ THEN REPLY @164 GOTO 6
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ KELDORN_WAUKEEN
END

IF ~~ THEN BEGIN 2
   SAY @165
   IF ~~ THEN REPLY @160 GOTO 3
   IF ~~ THEN REPLY @162 GOTO 5
   IF ~~ THEN REPLY @161 GOTO 4
   IF ~GlobalGT("AC_Succubus_Free","AC#W80",1)~ THEN REPLY @164 GOTO 6
   IF ~OR(2)
   CheckStatGT(LastTalkedToBy,15,WIS)
   CheckStatGT(LastTalkedToBy,13,INT)~ THEN REPLY @163 GOTO 6
END

IF ~~ THEN BEGIN 3
   SAY @166
   IF ~~ THEN DO ~SetGlobal("AC_Nasmaerae_Free","AC#W80",1)~ EXIT
END

IF ~~ THEN BEGIN 4
   SAY @167
   IF ~~ THEN REPLY @160 GOTO 3
   IF ~~ THEN REPLY @162 GOTO 5
   IF ~GlobalGT("AC_Succubus_Free","AC#W80",1)~ THEN REPLY @164 GOTO 6
   IF ~OR(2)
   CheckStatGT(LastTalkedToBy,15,WIS)
   CheckStatGT(LastTalkedToBy,13,INT)~ THEN REPLY @163 GOTO 6
END

IF ~~ THEN BEGIN 5
   SAY @168
   =
   @169
   IF ~~ THEN REPLY @170 GOTO 7
   IF ~~ THEN REPLY @171 GOTO 3
END

IF ~~ THEN BEGIN 6
   SAY @172
   IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ NALIA_WAUKEEN
   IF ~IsValidForPartyDialog("Edwin")
   !IsValidForPartyDialog("Nalia")~ THEN EXTERN ~EDWINJ~ EDWIN_WAUKEEN
   IF ~!IsValidForPartyDialog("Nalia")
   !IsValidForPartyDialog("Edwin")
   CheckStatGT(LastTalkedToBy,16,INT)~ THEN REPLY @173 GOTO 8
   IF ~!IsValidForPartyDialog("Nalia")
   !IsValidForPartyDialog("Edwin")
   CheckStatLT(LastTalkedToBy,17,INT)~ THEN REPLY @174 GOTO 3
   IF ~!IsValidForPartyDialog("Nalia")
   !IsValidForPartyDialog("Edwin")
   CheckStatLT(LastTalkedToBy,17,INT)~ THEN REPLY @175 GOTO 7
END

IF ~~ THEN BEGIN 7
   SAY @176
   IF ~~ THEN DO ~SetGlobal("AC_Marilith_Reveal","AC#W80",1)~ EXIT
END

IF ~~ THEN BEGIN 8
   SAY @177
   IF ~~ THEN REPLY @178 GOTO 9
   IF ~~ THEN REPLY @179 GOTO 9
   IF ~~ THEN REPLY @180 + 3
END

IF ~~ THEN BEGIN 9
   SAY @181
   IF ~~ THEN REPLY @182 GOTO 10
   IF ~~ THEN REPLY @183 + 3
END

IF ~~ THEN BEGIN 10
   SAY @184
   IF ~~ THEN DO ~SetGlobal("Player1","AC#W80",1)~ EXIT
END

IF ~~ THEN BEGIN 11
   SAY @185
   IF ~~ THEN REPLY @186 GOTO 12
   IF ~~ THEN REPLY @187 GOTO 12
   IF ~~ THEN REPLY @188 GOTO 12
END

IF ~~ THEN BEGIN 12
   SAY @189
   =
   @190
   IF ~~ THEN REPLY @191 GOTO 7
   IF ~~ THEN REPLY @192 GOTO 3
END

IF ~~ THEN BEGIN 13
   SAY @193
   IF ~~ THEN REPLY @194 GOTO 7
END

IF ~~ THEN BEGIN 14
   SAY @195
   IF ~~ THEN REPLY @194 GOTO 7
END

IF ~~ THEN BEGIN 15
   SAY @196
   IF ~~ THEN REPLY @194 GOTO 7
END

   /*************************************************************************************************************************************************
**************************************************************************************************************************************************
Nasmaerae, die Marilith
**************************************************************************************************************************************************
**************************************************************************************************************************************************/
BEGIN ~AC#WMAR2~

IF ~NumTimesTalkedTo(0)
   !Global("AC_Nasmaerae_Free","AC#W80",9)~ THEN BEGIN 0
   SAY @197
   IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~NumTimesTalkedTo(0)
   Global("AC_Nasmaerae_Free","AC#W80",9)~ THEN BEGIN 1
   SAY @198
   IF ~~ THEN REPLY @199 GOTO 2
END

IF ~~ THEN BEGIN 2
   SAY @200
   IF ~~ THEN DO ~SetGlobal("AC#W_Game_Over","GLOBAL",1)
   EscapeArea()~ EXIT
END
/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Erweiterungen der NPC-Dialoge
**************************************************************************************************************************************************
**************************************************************************************************************************************************/
BEGIN ~ACPLAYER~
IF ~Global("Player1","AC#W80",2)~ THEN BEGIN PLAYER_MIND
   SAY @201
      IF ~CheckStatLT(Player1,11,WIS)~ THEN GOTO PLAYER_MIND_2
      IF ~CheckStatGT(Player1,10,WIS)~ THEN GOTO PLAYER_MIND_3
END

IF ~~ THEN BEGIN PLAYER_MIND_2
   SAY @202
   IF ~~ THEN GOTO PLAYER_MIND_4
END
   
IF ~~ THEN BEGIN PLAYER_MIND_3
   SAY @203
   IF ~~ THEN REPLY @204 EXTERN ~AC#WMRL1~ 13
   IF ~~ THEN REPLY @205 EXTERN ~AC#WMRL1~ 14
   IF ~~ THEN REPLY @206 EXTERN ~AC#WMRL1~ 15
   IF ~~ THEN REPLY @207 GOTO PLAYER_MIND_4
END

IF ~~ THEN BEGIN PLAYER_MIND_4
   SAY @208
   IF ~~ THEN EXTERN ~AC#WMRL1~ 11
END


APPEND ~KELDORJ~
IF ~~ THEN BEGIN KELDORN_SUCCUBUS
   SAY @209
   =
   @210
   IF ~~ THEN EXTERN ~AC#W80S1~ 2
END

IF ~~ THEN BEGIN KELDORN_WAUKEEN
   SAY @211
   IF ~~ THEN EXTERN ~AC#WMRL1~ 7
END
END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN NALIA_WAUKEEN
   SAY @212
   IF ~~ THEN EXTERN ~AC#WMRL1~ 8
END
END

APPEND ~EDWINJ~
IF ~~ THEN BEGIN EDWIN_WAUKEEN
   SAY @213
   IF ~~ THEN EXTERN ~AC#WMRL1~ 8
END
END


