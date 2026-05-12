// Tharundar dlg after the main quest
BEGIN ~AC#W04S2~
BEGIN ~AC#W04T2~

IF ~Global("Traitor_Cutscene","AC#W04",9)~ THEN BEGIN traitor_reward
SAY @2
IF ~~ THEN DO ~GiveGoldForce(1000)
		ReputationInc(1)
		SetGlobal("AC#W_Traitor_Goldspires","GLOBAL",10)
		SetGlobal("Traitor_Cutscene","AC#W04",10)
		EraseJournalEntry(@110018)
		EraseJournalEntry(@110019)
		AddJournalEntry(@110020,QUEST_DONE)~ GOTO bye_traitor
IF ~Dead("AC#WNAL2")
Global("TharunMargrogReward","AC#W04",0)
GlobalGT("AC#W_TharundarSoul","GLOBAL",19)~ THEN DO ~GiveGoldForce(1000)
		ReputationInc(1)
		SetGlobal("AC#W_Traitor_Goldspires","GLOBAL",10)
		SetGlobal("Traitor_Cutscene","AC#W04",10)
		EraseJournalEntry(@110018)
		EraseJournalEntry(@110019)
		AddJournalEntry(@110020,QUEST_DONE)~ GOTO thank_you_for_dead_margrog		
END

			IF ~~ THEN BEGIN thank_you_for_dead_margrog
			SAY @311
			IF ~~ THEN GOTO dead_margrog_reward 
			END
			
			IF ~~ THEN BEGIN dead_margrog_reward
			SAY @312
			IF ~~ THEN DO ~SetGlobal("TharunMargrogReward","AC#W04",1)
			GiveItemCreate("AC#WWSHL",Player1,1,0,0)~ GOTO bye_traitor 
			END

// IF ~Dead("AC#WNAL2")~ THEN REPLY @109 DO ~SetGlobal("AC#W_TharundarSoul","GLOBAL",20)~ + margrog_dead 
		
IF ~True()~ THEN BEGIN hello_01
SAY @0
IF ~~ THEN GOTO 02
IF ~Global("AC#W_Traitor_Goldspires","GLOBAL",1)~ THEN + about_traitor
END

	IF ~~ THEN BEGIN about_traitor
	SAY @1
	IF ~~ THEN GOTO found_traitor 
	END
	
	IF ~~ THEN BEGIN found_traitor
	SAY @300
	IF ~~ THEN DO ~
	SetGlobal("Traitor_Cutscene","AC#W04",1)
	StartCutSceneMode()
	StartCutScene("AC#W04TT")~ EXIT
	END
		
			IF ~~ THEN BEGIN bye_traitor
			SAY @3
			IF ~~ THEN EXIT 
			END

	IF ~~ THEN BEGIN 02
	SAY @4
	IF ~~ THEN REPLY @5 GOTO bye
	IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",0)
	GlobalLT("AC#W_TharundarSoul","GLOBAL",20)~ THEN REPLY @6 GOTO about_your_soul
	IF ~PartyHasItem("AC#WGIL4")~ THEN REPLY @7 + have_traitor_letter
	IF ~~ THEN REPLY @8 GOTO bye
	END
		
			IF ~~ THEN BEGIN have_traitor_letter
			SAY @9
			IF ~~ THEN REPLY @10 DO ~TakePartyItem("AC#WGIL4")
			SetGlobal("AC#W_Traitor_Goldspires","GLOBAL",1)~ GOTO have_traitor_letter_02
			END
			
				IF ~~ THEN BEGIN have_traitor_letter_02
				SAY @11
				=
				@12
				=				
				@13
				IF ~~ THEN GOTO found_traitor
				END
	
		IF ~~ THEN BEGIN about_your_soul
		SAY @14
		IF ~~ THEN REPLY @15 GOTO about_your_soul_02
		END
		
			IF ~~ THEN BEGIN about_your_soul_02
			SAY @16
			IF ~Dead("AC#WNAL2")~ THEN REPLY @17 DO ~SetGlobal("AC#W_TharundarSoul","GLOBAL",20)~ + margrog_dead 
			IF ~~ THEN REPLY @18 + difficult_decision
			IF ~~ THEN REPLY @19 GOTO bye
			END
			
				IF ~~ THEN BEGIN margrog_dead
				SAY @20
				IF ~~ THEN REPLY @21 GOTO margrod_thanks
				END
				
				IF ~~ THEN BEGIN difficult_decision
				SAY @22
				IF ~~ THEN REPLY @23 + 02
				IF ~~ THEN REPLY @24 GOTO bye
				END
				
					IF ~~ THEN BEGIN margrod_thanks
					SAY @25
					IF ~~ THEN GOTO dead_margrog_reward
					END
	
	IF ~~ THEN BEGIN bye
	SAY @26
	IF ~~ THEN EXIT
	END

// CHAIN
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W04S2 chain_hello_sariila
@301
== AC#W04T2 @302  
== AC#W04S2 @303 
== AC#W04T2 @304
== AC#W04S2 @305
== AC#W04T2 @306
== AC#W04S2 @310
== AC#W04T2 @307
== AC#W04S2 @308
== AC#W04T2 @309
END
IF ~~ THEN DO ~SetGlobal("Traitor_Cutscene","AC#W04",9)~ EXIT

// Barasta, Tharundar's acolythe
BEGIN ~AC#W04P1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @27
IF ~~ THEN EXTERN ~ACTHARUN~ lets_go_outside 
END

BEGIN ~ACTHARUN~

/***********************************************************
PCs return after their quest
**********************************************************/
IF ~Global("PC_Return","AC#W04",3)~ THEN BEGIN hello_back
SAY @28
=
@29
IF ~~ THEN REPLY @30 GOTO waukeens_save
END

	IF ~~ THEN BEGIN waukeens_save
	SAY @31
	IF ~~ THEN REPLY @32 GOTO waukeens_call_01
	END
	
		IF ~~ THEN BEGIN waukeens_call_01
		SAY @33
		IF ~~ THEN EXTERN ~ACHALAN~ halanna_cleared 
		END
		
		/*
		IF ~~ THEN BEGIN halanna_clear_02
		SAY @34
		IF ~~ THEN DO ~SetGlobal("PC_Return","AC#W04",4)~ EXIT 
		END
		*/
		
		IF ~~ THEN BEGIN halanna_clear_02
		SAY @34
		IF ~~ THEN DO ~SetGlobal("PC_Return","AC#W04",5)
		CreateCreature("AC#W04P1",[1264.1528],NWW)
		ActionOverride("AC#W04P1",Dialogue("actharun"))~ EXIT 
		END
		
IF ~~ THEN BEGIN lets_go_outside
SAY @35
IF ~~ THEN REPLY @36 GOTO your_advice
IF ~~ THEN REPLY @37 + no_secret 
IF ~~ THEN REPLY @38 + yes_tell_the_world 
IF ~~ THEN REPLY @39 + not_outside
END	

	IF ~~ THEN BEGIN your_advice
	SAY @40
	IF ~~ THEN REPLY @37 + no_secret 
	IF ~~ THEN REPLY @41 + yes_tell_the_world 
	IF ~~ THEN REPLY @39 + not_outside 
	END

	IF ~~ THEN BEGIN not_outside
	SAY @42
	IF ~~ THEN REPLY @37 + no_secret 
	IF ~~ THEN REPLY @41 + yes_tell_the_world 
	IF ~~ THEN REPLY @43 DO ~SetGlobal("No_Celebration","AC#W04",1)~ GOTO not_outside_sure 
	END	

			IF ~~ THEN BEGIN not_outside_sure
			SAY @44
			IF ~~ THEN GOTO give_50000_reward			
			IF ~Global("AC#W_No_Reward","GLOBAL",1)~ THEN GOTO give_no_reward_sure
			IF ~Global("250000_GP","AC#W04",2)~ THEN GOTO give_25000_reward
			END

				IF ~~ THEN BEGIN give_no_reward_sure
				SAY @315
				IF ~~ THEN REPLY @316 GOTO give_50000_reward
				IF ~~ THEN REPLY @317 GOTO give_no_reward_final
				END

					IF ~~ THEN BEGIN give_no_reward_final
					SAY @318
					IF ~Global("No_Celebration","AC#W04",0)~ THEN GOTO lets_go_celebration
					IF ~Global("No_Celebration","AC#W04",1)~ THEN GOTO bye_no_celebration
					END					
			
			IF ~~ THEN BEGIN give_25000_reward
			SAY @45
			IF ~Global("No_Celebration","AC#W04",0)~ THEN DO ~GiveGoldForce(25000)~ GOTO lets_go_celebration
			IF ~Global("No_Celebration","AC#W04",1)~ THEN DO ~GiveGoldForce(25000)~ GOTO bye_no_celebration
			END
			
			IF ~~ THEN BEGIN give_50000_reward
			SAY @46
			IF ~~ THEN REPLY @319 + before_50000_want_no_reward_really_sure
			IF ~Global("No_Celebration","AC#W04",0)~ THEN REPLY #3768 DO ~GiveGoldForce(50000)~ GOTO lets_go_celebration
			IF ~Global("No_Celebration","AC#W04",1)~ THEN REPLY #3768 DO ~GiveGoldForce(50000)~ GOTO bye_no_celebration
			END
			
					IF ~~ THEN BEGIN before_50000_want_no_reward_really_sure
					SAY #77620
					IF ~~ THEN REPLY @316 GOTO give_50000_reward_final
					IF ~~ THEN REPLY @317 GOTO give_no_reward_final
					END
					
						IF ~~ THEN BEGIN give_50000_reward_final
						SAY @46						
						IF ~Global("No_Celebration","AC#W04",0)~ THEN DO ~GiveGoldForce(50000)~ GOTO lets_go_celebration
						IF ~Global("No_Celebration","AC#W04",1)~ THEN DO ~GiveGoldForce(50000)~ GOTO bye_no_celebration
						END
			
				IF ~~ THEN BEGIN bye_no_celebration
				SAY @47
				IF ~~ THEN DO ~ActionOverride("AC#W04P1",EscapeArea())
				ActionOverride("ACHALAN1",DestroySelf())
				SetGlobal("PC_Return","AC#W04",10)
				EscapeArea()~ EXIT 
				END
	
		IF ~~ THEN BEGIN no_secret
		SAY @48
		IF ~~ THEN GOTO give_reward_01
		END
		
		IF ~~ THEN BEGIN yes_tell_the_world
		SAY @49
		IF ~~ THEN DO ~SetGlobal("AC#WaukeenWorldKnows","GLOBAL",1)~ GOTO give_reward_01
		END
		
		IF ~~ THEN BEGIN give_reward_01
		SAY @50
		IF ~~ THEN GOTO give_50000_reward_02
		IF ~Global("AC#W_No_Reward","GLOBAL",1)~ THEN GOTO give_no_reward_sure_02
		IF ~Global("250000_GP","AC#W04",2)~ THEN GOTO give_25000_reward_02 
		END

				IF ~~ THEN BEGIN give_no_reward_sure_02
				SAY @315
				IF ~~ THEN REPLY @316 GOTO give_50000_reward_02
				IF ~~ THEN REPLY @317 GOTO give_no_reward_final_02
				END

					IF ~~ THEN BEGIN give_no_reward_final_02
					SAY @318
					IF ~~ THEN GOTO lets_go_celebration
					END			
		
			IF ~~ THEN BEGIN give_25000_reward_02
			SAY @45
			IF ~~ THEN DO ~GiveGoldForce(25000)~ GOTO lets_go_celebration
			END
			
			IF ~~ THEN BEGIN give_50000_reward_02
			SAY @46
			IF ~~ THEN REPLY @319 + before_50000_want_no_reward_really_sure_celebration
			IF ~~ THEN REPLY #3768 DO ~GiveGoldForce(50000)~ GOTO lets_go_celebration
			END
			
					IF ~~ THEN BEGIN before_50000_want_no_reward_really_sure_celebration
					SAY #77620
					IF ~~ THEN REPLY @316 GOTO give_50000_reward_final_celebration
					IF ~~ THEN REPLY @317 GOTO give_no_reward_final_02
					END
					
						IF ~~ THEN BEGIN give_50000_reward_final_celebration
						SAY @46
						IF ~Global("No_Celebration","AC#W04",0)~ THEN DO ~GiveGoldForce(50000)~ GOTO lets_go_celebration
						IF ~Global("No_Celebration","AC#W04",1)~ THEN DO ~GiveGoldForce(50000)~ GOTO bye_no_celebration
						END
		
			IF ~~ THEN BEGIN lets_go_celebration
			SAY @51
			IF ~~ THEN DO ~SetGlobal("PC_Return","AC#W04",10)
			StartCutSceneMode()
			StartCutScene("AC#W04C9")~ EXIT 
			END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN First
   SAY @52
   IF ~~ THEN REPLY @53 GOTO 0
   IF ~~ THEN REPLY @54 GOTO 0
   IF ~~ THEN REPLY @55 GOTO 0
END

IF ~~ THEN BEGIN 0
  SAY @56
  IF ~~ THEN DO ~EraseJournalEntry(@100010)~ GOTO 1
END

IF ~~ THEN BEGIN 1
   SAY @57
   IF ~~ THEN GOTO NEW_Job_waukeen
END

	IF ~~ THEN BEGIN NEW_Job_waukeen
	SAY @58
	IF ~~ THEN REPLY @59 GOTO 3
	IF ~~ THEN REPLY @60 GOTO 3
	IF ~~ THEN REPLY @61 + NEW_nope
	END
	
		IF ~~ THEN BEGIN NEW_nope
		SAY @62
		IF ~~ THEN DO ~EscapeArea()~ EXIT 
		END

IF ~~ THEN BEGIN 3
   SAY @63
   IF ~~ THEN REPLY @64 GOTO 4
   IF ~~ THEN REPLY @65 GOTO 5
   IF ~~ THEN REPLY @66 GOTO 6
END

IF ~~ THEN BEGIN 4
   SAY @67 IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 5
   SAY @68 IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 6
   SAY @69 IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7
   SAY @70
   =
   @71
   IF ~~ THEN REPLY @72 GOTO 8
   IF ~~ THEN REPLY @73 GOTO 8_continue
   IF ~~ THEN REPLY @74 GOTO 8
   IF ~~ THEN REPLY @75 GOTO 8
END

	IF ~~ THEN BEGIN 8
	SAY @76
	IF ~~ THEN GOTO 8_continue
	END
	
	IF ~~ THEN BEGIN 8_continue
	SAY @77
   =
   @78
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Waukeen_Back
   IF ~!IsValidForPartyDialog("Anomen")~ THEN REPLY @79 GOTO 9
END

IF ~~ THEN BEGIN 9
   SAY @80
   IF ~~ THEN REPLY @81 GOTO 10
   IF ~~ THEN REPLY @82 GOTO 10_not_heal   
   IF ~~ THEN REPLY @83 GOTO 10_goon   
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Halanna_Heal
   IF ~IsValidForPartyDialog("Viconia")
   !IsValidForPartyDialog("Aerie")~ THEN EXTERN ~VICONIJ~ Viconia_Halanna_Heal
END

	IF ~~ THEN BEGIN 10
	SAY @84
	IF ~~ THEN GOTO 10_goon 
	END

	IF ~~ THEN BEGIN 10_goon
	SAY @85
	IF ~~ THEN GOTO 10_not_heal 
	END

	IF ~~ THEN BEGIN 10_not_heal
	SAY @86 
   =
   @87
   IF ~~ THEN GOTO 50
	END


/*****************************************************************
Besuch bei Halanna
******************************************************************/

IF ~Global("AC_VisitHalanna","GLOBAL",2)~ THEN BEGIN 11
   SAY @88 
   IF ~~ THEN EXIT
END

IF ~Global("AC_VisitHalanna","GLOBAL",4)~ THEN BEGIN 12
   SAY @89
   IF ~~ THEN REPLY @90 GOTO 13
   IF ~~ THEN REPLY @91 GOTO 13
   IF ~~ THEN REPLY @92 GOTO 14
END

IF ~~ THEN BEGIN 13
   SAY @93 IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14
   SAY @94
   IF ~~ THEN REPLY @96 GOTO 16
   IF ~~ THEN REPLY @314 GOTO 16
   //IF ~~ THEN REPLY @313 GOTO 15
   IF ~~ THEN REPLY @95 GOTO 15
   IF ~~ THEN REPLY @268 GOTO 16
END

IF ~~ THEN BEGIN 15
   SAY @97 IF ~~ THEN GOTO 16
END

IF ~~ THEN BEGIN 16
   SAY @98
   IF ~~ THEN GOTO 17
END

IF ~~ THEN BEGIN 17
   SAY @99
   IF ~~ THEN GOTO 18
END

/******************************
Tharundar spricht von Graz'zt:
*******************************/

IF ~~ THEN BEGIN 18 
   SAY @100
   IF ~~ THEN REPLY @101 GOTO 19
   IF ~~ THEN REPLY @102 GOTO 19
   IF ~~ THEN REPLY @103 GOTO 19
   IF ~~ THEN REPLY @104 GOTO 19
END

IF ~~ THEN BEGIN 19
   SAY @105
   IF ~~ THEN REPLY @106 GOTO 20
   IF ~~ THEN REPLY @107 GOTO 21
   IF ~~ THEN REPLY @108 GOTO 20
   IF ~~ THEN REPLY @109 GOTO 20
   IF ~~ THEN REPLY @110 GOTO 21
END

IF ~~ THEN BEGIN 20
   SAY @111
   IF ~~ THEN REPLY @112 GOTO 22
   IF ~~ THEN REPLY @113 GOTO 23
   IF ~~ THEN REPLY @114 GOTO 23
   IF ~~ THEN REPLY @115 GOTO 23
END

IF ~~ THEN BEGIN 21
   SAY @116
   IF ~~ THEN REPLY @112 GOTO 22
   IF ~~ THEN REPLY @113 GOTO 23
   IF ~~ THEN REPLY @114 GOTO 23
   IF ~~ THEN REPLY @115 GOTO 23
END

IF ~~ THEN BEGIN 22
   SAY @117 IF ~~ THEN GOTO 23
END

IF ~~ THEN BEGIN 23
   SAY @118
   =
   @119
   =
   @120
   IF ~~ THEN REPLY @121 GOTO 24
   IF ~~ THEN REPLY @122 GOTO 25
   IF ~~ THEN REPLY @123 GOTO 26
   IF ~~ THEN REPLY @124 GOTO 26
   IF ~~ THEN REPLY @125 GOTO 27
   IF ~~ THEN REPLY @126 GOTO 27
   IF ~~ THEN REPLY @127 GOTO 28
END

IF ~~ THEN BEGIN 24
   SAY @128 IF ~~ THEN GOTO 29
END

IF ~~ THEN BEGIN 25
   SAY @129 IF ~~ THEN GOTO 29
END

IF ~~ THEN BEGIN 26
   SAY @130
   IF ~~ THEN REPLY @131 GOTO 29
   IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @132 GOTO 30
   IF ~CheckStatLT(Player1,17,CHR)~ THEN REPLY @132 GOTO 31
   IF ~~ THEN REPLY @133 GOTO 32
   IF ~~ THEN REPLY @319 GOTO no_reward_before_quest // NO REWARD AT ALL   
END

IF ~~ THEN BEGIN 27
   SAY @134 IF ~~ THEN GOTO 29
END

IF ~~ THEN BEGIN 28
SAY @135
++ @136 GOTO unbelievable
++ @137 GOTO where
++ @138 GOTO where
END

IF ~~ THEN BEGIN unbelievable
SAY @139
IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Demon_Comment
IF ~!IsValidForPartyDialog("Nalia")~ THEN REPLY @140 GOTO where
END

IF ~~ THEN BEGIN where
SAY @141
IF ~!IsValidForPartyDialog("Mazzy")~ THEN REPLY @142 GOTO help
IF ~!IsValidForPartyDialog("Mazzy")~ THEN REPLY @143 GOTO help
IF ~!IsValidForPartyDialog("Mazzy")~ THEN REPLY @144 GOTO help
IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ search
END

IF ~~ THEN BEGIN help
SAY @145
    IF ~!IsValidForPartyDialog("Anomen")
    !IsValidForPartyDialog("Keldorn")
    !IsValidForPartyDialog("Viconia")~ THEN REPLY @146 GOTO warn
    IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ demonologe
    IF ~IsValidForPartyDialog("Anomen")
    !IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~ANOMENJ~ demonologe
    IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ demonologe
END

IF ~~ THEN BEGIN warn
SAY @147
IF ~~ THEN GOTO samora
END

/***********************************************************************************************************************************************
Tharundar stellt den PCs Kyriani, die Priesterin der Selûne, vor:
*****************************************************************************************************************************************/
IF ~~ THEN BEGIN samora
SAY @148
IF ~~ THEN GOTO Kyriani
END

IF ~~ THEN BEGIN Kyriani
   SAY @149
   =
   @150
   IF ~~ THEN DO ~SetGlobal("AC_Kyriani","GLOBAL",1) ~ EXIT
END

IF ~~ THEN BEGIN 29
   SAY @151
   IF ~~ THEN REPLY @121 GOTO 24
   IF ~~ THEN REPLY @152 GOTO 25
   IF ~Global("AC#W_No_Reward","GLOBAL",0)~ THEN REPLY @123 GOTO 26
   IF ~Global("AC#W_No_Reward","GLOBAL",0)~ THEN REPLY @124 GOTO 26
   IF ~~ THEN REPLY @125 GOTO 27
   IF ~~ THEN REPLY @126 GOTO 27
   IF ~~ THEN REPLY @127 GOTO 28
END

IF ~~ THEN BEGIN 30
   SAY @153
   IF ~~ THEN DO ~SetGlobal("250000_GP","AC#W04",1)~ GOTO 29
END

IF ~~ THEN BEGIN no_reward_before_quest
SAY @320
IF ~~ THEN DO ~SetGlobal("AC#W_No_Reward","GLOBAL",1)~ GOTO 29
END

IF ~~ THEN BEGIN 31
   SAY @154 IF ~~ THEN GOTO 29
END

IF ~~ THEN BEGIN 32
   SAY @155 IF ~~ THEN GOTO 29
END

IF ~~ THEN BEGIN 33
   SAY @156
   IF ~~ THEN EXTERN ~ACKYRIAN~ 12
END

/***************************** Tharundar fragt, ob PCs die Aufgabe annehmen:***********************************/

IF ~~ THEN BEGIN 34
   SAY @157 IF ~~ THEN GOTO chain_accept
	END  


IF ~~ THEN BEGIN 35
   SAY @158
   IF ~~ THEN DO ~SetGlobal("AC_RESPITE","GLOBAL",2)~ EXTERN ~ACKYRIAN~ 8
END

IF ~~ THEN BEGIN 36
   SAY @159
   IF ~~ THEN EXTERN ~ACKYRIAN~ 9
END

IF ~~ THEN BEGIN 37
   SAY @160
   IF ~Global("250000_GP","AC#W04",1)~ THEN GOTO 38
   IF ~True()~ THEN DO ~SetGlobal("AC_VisitHalanna","GLOBAL",5)
   SetGlobal("AC_Accepted","GLOBAL",1)
   AddJournalEntry(@100030,QUEST)
   ~ EXIT
END

IF ~~ THEN BEGIN 38
   SAY @161
   IF ~~ THEN DO ~SetGlobal("250000_GP","AC#W04",2)
   SetGlobal("AC_VisitHalanna","GLOBAL",5)
   SetGlobal("AC_Accepted","GLOBAL",1)
   AddJournalEntry(@100030,QUEST)
   GiveGoldForce(25000)~ EXIT
END

IF ~~ THEN BEGIN 39
   SAY @162
   IF ~~ THEN DO ~SetGlobal("AC_RESPITE","GLOBAL",1)
   SetGlobal("AC_VisitHalanna","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN 40
   SAY @163
   IF ~~ THEN REPLY @164 GOTO 41
   IF ~~ THEN REPLY @165 GOTO 39
END

IF ~~ THEN BEGIN 41
   SAY @166
   IF ~~ THEN DO ~ActionOverride("ACKyrian",EscapeArea())
   EscapeArea()
   ~ EXIT
END

IF ~~ THEN BEGIN 42
   SAY @167
   IF ~Global("250000_GP","AC#W04",1)~ THEN GOTO 43
   IF ~~ THEN GOTO 45
END

IF ~~ THEN BEGIN 43
   SAY @168 IF ~~ THEN GOTO 44
END

IF ~~ THEN BEGIN 44
   SAY @169
   IF ~~ THEN REPLY @170 GOTO 35
   IF ~~ THEN REPLY @171 GOTO 39
   IF ~~ THEN REPLY @172 GOTO 40
   IF ~~ THEN REPLY @173 GOTO 42
END

IF ~~ THEN BEGIN 45
   SAY @130
   IF ~~ THEN REPLY @131 GOTO 44
   IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @174 GOTO 46
   IF ~CheckStatLT(Player1,17,CHR)~ THEN REPLY @174 GOTO 47
   IF ~~ THEN REPLY @133 GOTO 48
END

IF ~~ THEN BEGIN 46
   SAY @175
   IF ~~ THEN DO ~SetGlobal("250000_GP","AC#W04",1)~ GOTO 44
END

IF ~~ THEN BEGIN 47
   SAY @154 IF ~~ THEN GOTO 44
END

IF ~~ THEN BEGIN 48
   SAY @155 IF ~~ THEN GOTO 44
END

IF ~Global("AC_RESPITE","GLOBAL",1)~ THEN BEGIN 49
   SAY @169
   IF ~~ THEN REPLY @170 GOTO 35
   IF ~~ THEN REPLY @171 GOTO 39
   IF ~~ THEN REPLY @172 GOTO 40
   IF ~~ THEN REPLY @173 GOTO 42
END

IF ~~ THEN BEGIN 50
   SAY @176
   IF ~~ THEN DO ~SetGlobal("AC_VisitHalanna","GLOBAL",1) ~ EXIT
END

IF ~Global("AC_Accepted","GLOBAL",1)~ THEN BEGIN 52
   SAY @177
   IF ~~ THEN REPLY @178 GOTO 53
   IF ~~ THEN REPLY @179 GOTO 54
END

IF ~~ THEN BEGIN 53
   SAY @180
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 54
   SAY @181
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 55
   SAY @182
   =
   @183
   =
   @184
   =  
   @185
	IF ~~ THEN REPLY @186 GOTO pact_what_nalfeshnee
	IF ~~ THEN REPLY @187 GOTO pact_deal_with_nalfeshnee
	IF ~~ THEN REPLY @188 GOTO pact_deal_with_nalfeshnee
	IF ~~ THEN REPLY @189 EXTERN ~ACKYRIAN~ kyriani_no_time
	END
	
		IF ~~ THEN BEGIN pact_what_nalfeshnee
		SAY @190
		IF ~~ THEN REPLY @187 EXTERN ~ACKYRIAN~ kyriani_no_time
		IF ~~ THEN REPLY @188 EXTERN ~ACKYRIAN~ kyriani_no_time
		IF ~~ THEN REPLY @189 EXTERN ~ACKYRIAN~ kyriani_no_time
		END
		
		IF ~~ THEN BEGIN pact_deal_with_nalfeshnee
		SAY @191
		IF ~~ THEN REPLY @188 EXTERN ~ACKYRIAN~ kyriani_no_time
		IF ~~ THEN REPLY @189 EXTERN ~ACKYRIAN~ kyriani_no_time
		END
	
IF ~~ THEN BEGIN good_luck
SAY @192
   IF ~~ THEN DO ~SetGlobal("AC_Accepted","GLOBAL",4)  
   StartCutSceneMode()
   StartCutScene("AC#W#CT2")~ EXIT
END
/*****************************************************************************************
******************************************************** ********************************************************************************************
****************************************************** Dialog mit Halanna Jashire *******************************************************************
******************************************************************************* *********************************************************************
*****************************************************************************/

BEGIN ~ACHALAN~

IF ~Global("PC_Return","AC#W04",1)~ THEN BEGIN hello_again_01
SAY @193
=
@194
=
@195
IF ~~ THEN DO ~SetGlobal("PC_Return","AC#W04",2)~ EXIT 
END

IF ~Global("AC_VisitHalanna","GLOBAL",2)~ THEN BEGIN 0
   SAY @196
   IF ~~ THEN DO ~SetGlobal("AC_VisitHalanna","GLOBAL",3)~ EXIT
END

IF ~True()~ THEN BEGIN 1
   SAY @200 IF ~~ THEN EXIT
END

	IF ~~ THEN BEGIN halanna_cleared
	SAY @201
	IF ~~ THEN EXTERN ~ACTHARUN~ halanna_clear_02 
	END

/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Dialog mit Kyriani
**************************************************************************************************************************************************
**************************************************************************************************************************************************/

BEGIN ~ACKYRIAN~

/****************************************************************
Cutscene: Kyriani betritt durch die Geheimtür den Raum.
Global("AC_Kyriani","GLOBAL",1)->Global("AC_Kyriani","GLOBAL",2)
*****************************************************************/

IF ~Global("AC_Kyriani","GLOBAL",2)~ THEN BEGIN 0
   SAY @202
   IF ~~ THEN DO ~SetGlobal("AC_Kyriani","GLOBAL",3)~ EXTERN ~ACTHARUN~ 33
END

IF ~~ THEN BEGIN 1
   SAY @203
   IF ~~ THEN REPLY @204 GOTO 2
   IF ~~ THEN REPLY @205 GOTO 3
   IF ~~ THEN REPLY @206 GOTO 3
END

IF ~~ THEN BEGIN 2
   SAY @207
   IF ~~ THEN REPLY @205 GOTO 3
   IF ~~ THEN REPLY @206 GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY @208
   =
   @209
   IF ~~ THEN REPLY @210 GOTO 4
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Infinite_Staircase
   IF ~!IsValidForPartyDialog("Jaheira")
   IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Infinite_Staircase
END

IF ~~ THEN BEGIN 4
   SAY @211 IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5
   SAY @212
   IF ~~ THEN REPLY @213 GOTO 6
   END

IF ~~ THEN BEGIN 6
   SAY @214
   IF ~~ THEN REPLY @215 GOTO 7
END

IF ~~ THEN BEGIN 7
   SAY @216
   =
   @217
   IF ~~ THEN EXTERN ~ACTHARUN~ 34
END

IF ~~ THEN BEGIN 8
   SAY @218
   IF ~~ THEN EXTERN ~ACTHARUN~ 36
END

IF ~~ THEN BEGIN 9
   SAY @219
   IF ~~ THEN REPLY @220 GOTO 10
   IF ~~ THEN REPLY @221 GOTO 10
   IF ~~ THEN REPLY @222 GOTO 10_callback
   IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Waterdeep
   // IF ~InParty("Korgan")~ THEN EXTERN ~KORGANJ~ 999
END

	IF ~~ THEN BEGIN 10
	SAY @223
	IF ~~ THEN GOTO 10_callback
	END

	IF ~~ THEN BEGIN 10_callback
	SAY @224
	IF ~~ THEN REPLY @225 GOTO 11
	IF ~~ THEN REPLY @140 GOTO 11
	END

IF ~~ THEN BEGIN 11
   SAY @226
   IF ~~ THEN EXTERN ~ACTHARUN~ 37
END

IF ~~ THEN BEGIN 12
   SAY @227
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ KorganKyriani
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 13
   SAY @228 IF ~~ THEN GOTO 1
END

IF ~Global("AC_Accepted","GLOBAL",1)~ THEN BEGIN 14
   SAY @229
   IF ~~ THEN REPLY @230 GOTO need_more_time
   IF ~~ THEN REPLY @231 GOTO 15
END

	IF ~~ THEN BEGIN need_more_time
	SAY @232
	IF ~~ THEN EXIT
	END

IF ~~ THEN BEGIN 15
   SAY @233
   IF ~~ THEN DO ~SetGlobal("AC_Accepted","GLOBAL",2)~ EXIT
END

IF ~Global("AC_Accepted","GLOBAL",3)~ THEN BEGIN 16
   SAY @234
   IF ~~ THEN EXTERN ~ACTHARUN~ 55
END

IF ~~ THEN BEGIN kyriani_no_time
SAY @235
IF ~~ THEN EXTERN ~ACTHARUN~ good_luck 
END

// Nach der Teleportation ins Haus des Mondes
/*
IF ~Global("AC_Accepted","GLOBAL",6)~ THEN BEGIN 16
   SAY ~So, da wären wir. Sind wir vollzählig? Ich glaube, ja.~
   IF ~~ THEN EXTERN ~ACMOONK1~ 1
END

IF ~~ THEN BEGIN 17
   SAY ~Ihr befindet Euch nun im Haus des Mondes in Tiefwasser, <CHARNAME>. Von hier aus kann ich Euch zur Endlosen Steige bringen. Ich benötige allerdings noch etwas Zeit für Vorbereitungen, Ihr könnt Euch solange hier noch etwas umsehen. Ihr trefft mich dann später im Quartier der Priesterinnen.~
   IF ~~ THEN DO ~SetGlobal("AC_Accepted","GLOBAL",7)~ EXIT
END

IF ~Global("AC_Accepted","GLOBAL",8)~ THEN BEGIN 18
   SAY ~Seid Ihr bereit, den entscheidenden Teil Eurer Reise anzutreten, <CHARNAME>? Ich empfehle Euch, Euch hier noch einmal auszuruhen, denn auf der Treppe werdet Ihr vielleicht lange Zeit keine Gelegenheit dazu haben.~
   IF ~~ THEN REPLY ~Ich habe mich gestärkt und bin gerüstet zum Aufbruch. Sagt mir, wie ich die Endlose Steige betreten kann.~ GOTO 20
   IF ~~ THEN REPLY ~Nein, ich bin noch nicht bereit. Ich werde zurückkommen.~ EXIT
   IF ~~ THEN REPLY ~Ja, ich würde mich gerne noch einmal ausruhen. Wo kann ich in diesem Tempel rasten?~ GOTO 19
END

IF ~~ THEN BEGIN 19
   SAY ~Geht zu Tellwyn im südlichen Korridor. Er wird Euch ein Zimmer bereitstellen.~
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
   SAY ~Gut. Folgt mir.~
   IF ~~ THEN DO ~
   //SetGlobal("AC_Accepted","GLOBAL",9)
  StartCutSceneMode()
	//StartCutScene("AC#W#CT3")
	StartCutScene("AC#W#CT4")~ EXIT
END

IF ~Global("AC_Accepted","GLOBAL",10)~ THEN BEGIN 21
   SAY ~Dieser Spiegel, den Ihr hier hinter mir seht, ist in Wirklichkeit ein mächtiges magisches Artefakt, ein Geschenk der Mondmaid höchstpersönlich. Es ist ein Portal, welches direkt an den Beginn der Endlosen Steige führt- in das Reich meiner Göttin, in die Stadt Argentil nach Ysgard.~
   =
   ~Normalerweise ist die Benutzung für nicht Nichtgläubige streng verboten, doch in Eurem Fall wird der Tempel eine Ausnahme machen. Es ist eine große Ehre für Euch, dieses Portal benutzen zu dürfen - bitte verhaltet Euch entsprechend. Bevor Ihr aufbrecht, werde ich Euch noch wie versprochen zwei magische Gegenstände übergeben, die Ihr auf Eurer Reise dringend benötigen werdet.~
   =
   ~Dies hier ist ein Amulett, welches Euch vor den telepathischen Fähigkeiten der Dämonen in der Abyss etwas schützen soll. Die Tanar'ri sind wahre Meister im Gedankenlesen, und wenn Ihr Euch davor nicht schützt, wird in Kürze die gesamte Abyss von Eurer Mission erfahren. Außerdem verhindert das Amulett, dass andere Wesen Eure Gesinnung erkennen können. Seine magische Aura wirkt in einem großen Radius, deshalb reicht es, wenn ein Mitglied Eurer Gruppe es anlegt, wenn Ihr in der Abyss seid.~
   IF ~~ THEN DO ~GiveItemCreate("ACAMUL01",LastTalkedToBy,1,0,0)~ GOTO 22
END

IF ~~ THEN BEGIN 22
   SAY ~Und dies hier ist ein besonders wertvoller Gegenstand. Es ist ein planarer Sextant, der von einem unserer Priester auf Azzagrat geeicht wurde. Mit seiner Hilfe werdet Ihr den Weg in Graz'zts Reich verhältnismäßig einfach finden.~
   IF ~~ THEN DO ~GiveItemCreate("ACSEXTAN",LastTalkedToBy,1,0,0)~ GOTO 23
END

IF ~~ THEN BEGIN 23
   SAY ~Denn denkt daran: Die Endlose Steige ist unendlich. Ihr könnt dort leicht vom Weg abkommen und Euch verirren - im schlimmsten  Falle wäret Ihr dann auf immer und ewig dort gefangen.~
   IF ~~ THEN REPLY ~Ich werde meinen Weg schon finden, seid unbesorgt. Gibt es sonst noch etwas, das ich wissen müsste?~ GOTO 24
   IF ~~ THEN REPLY ~Ich werde an Eure Worte denken. Worauf muss ich noch achten?~ GOTO 24
END

IF ~~ THEN BEGIN 24
   SAY ~Der Sextant wird Euch an den Eingang von Azzagrat bringen. Das Tor in die Abyss ist auch mit dem Symbol einer sechs-fingerigen Hand markiert, sodass Ihr es nicht verfehlen könnt.~
   =
   ~Damit wäre alles gesagt. Ihr könnt jetzt durch den Spiegel schreiten. Ich wünsche Euch viel Glück, <CHARNAME>. Passt gut auf Euch auf.~
   IF ~~ THEN DO ~SetGlobal("AC_Accepted","GLOBAL",11)
   SetGlobal("AC_Mirror","GLOBAL",1)~ EXIT
END
*/
CHAIN IF ~~ THEN ACTHARUN chain_accept
@236
== AnomenJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @237
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @238
== MazzyJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @239
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @240
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @241
== MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @242
= @243
== YoshJ IF ~InParty("yoshimo") !StateCheck("yoshimo",CD_STATE_NOTVALID)~ THEN @284
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @244
= @245
== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @246
= @247
== ValygarJ IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN @248
== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @249
= @250
== JANJ IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @282
== NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @283
== HAERDAJ IF ~InParty("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @280
== CERNDJ IF ~InParty("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @281
== IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @251
== DORNJ IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @285
== HEXXATJ IF ~InParty("hexxat") !StateCheck("hexxat",CD_STATE_NOTVALID)~ THEN @286
== RASAADJ IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @287
== NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @288
END
IF ~~ THEN REPLY @170 GOTO 35
IF ~~ THEN REPLY @252 GOTO 35
IF ~~ THEN REPLY @253 GOTO 35
IF ~~ THEN REPLY @171 GOTO 39
IF ~~ THEN REPLY @172 GOTO 40
IF ~~ THEN REPLY @173 GOTO 42	
	
/*   
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Accept_Quest
   IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
   IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_Decline_Quest
   IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
   IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN ~IMOEN2J~ Imoen_Accept_Quest */

/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W04, Sariila Tebrentan, the traitor priestess
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W04ST~ 
		
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W04ST hello_0
@269
==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @270
==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)
OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @271
END
IF~~THEN REPLY @272 EXTERN AC#W04ST away_01
IF~~THEN REPLY @273 EXTERN AC#W04ST away_01
IF~~THEN REPLY @274 EXTERN AC#W04ST out_of_the_way
IF~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~THEN EXTERN AC#W04ST tharundar_audience
IF~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~THEN EXTERN AC#W04ST tharundar_audience


	CHAIN AC#W04ST away_01
	@275
	END
	IF~~THEN REPLY @276 EXTERN AC#W04ST tharundar_audience
	IF~~THEN REPLY @277 EXTERN AC#W04ST out_of_the_way
	IF~~THEN REPLY @274 EXTERN AC#W04ST out_of_the_way

	CHAIN AC#W04ST out_of_the_way
	@278
	END
	IF~~THEN REPLY @276 EXTERN AC#W04ST tharundar_audience
	
		CHAIN AC#W04ST tharundar_audience
		@279
		DO ~EscapeArea()~ EXIT
/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Erweiterungen der NPC-Dialoge
**************************************************************************************************************************************************
**************************************************************************************************************************************************/
APPEND ~AERIEJ~
IF ~~ THEN BEGIN Aerie_Halanna_Heal
   SAY @254
   IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~ACTHARUN~ 10
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Aerie_Foolish
END

// hier noch checken!!!
IF ~~ THEN BEGIN Aerie_Accept_Quest
SAY @251
   IF ~True()~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~True()~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~True()~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~True()~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
   IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_Decline_Quest
   IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
END
END

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN Aerie_Foolish
   SAY @255
   IF ~~ THEN EXTERN ~ACTHARUN~ 10
END

IF ~~ THEN BEGIN Jaheira_Accept_Quest
   SAY @244
   =
   @245
      IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~!IsValidForPartyDialog("Anomen")
   IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   IF ~!IsValidForPartyDialog("Anomen")
   !IsValidForPartyDialog("Keldorn")
   IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   IF ~!IsValidForPartyDialog("Anomen")
   !IsValidForPartyDialog("Keldorn")
   !IsValidForPartyDialog("Edwin")
   IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
   IF ~~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
END

IF ~~ THEN BEGIN Jaheira_Infinite_Staircase
   SAY @256
   IF ~~ THEN EXTERN ~ACKYRIAN~ 5
END
END

APPEND ~ANOMENJ~
IF ~~ THEN BEGIN Waukeen_Back
   SAY @79
   IF ~~ THEN EXTERN ~ACTHARUN~ 9
END

IF ~~ THEN BEGIN Anomen_Accept_Quest
   SAY @237
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   IF ~!IsValidForPartyDialog("Keldorn")
   IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   IF ~!IsValidForPartyDialog("Keldorn")
   !IsValidForPartyDialog("Edwin")
   IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
   IF ~~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
END

IF ~~ THEN BEGIN demonologe
   SAY @257
   IF ~~ THEN EXTERN ~ACTHARUN~ warn
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN Viconia_Halanna_Heal
   SAY @258
   IF ~~ THEN EXTERN ~ACTHARUN~ 10
END

// hier noch checken!!!
IF ~~ THEN BEGIN Viconia_Accept_Quest
SAY @251
   IF ~True()~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~True()~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~True()~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~True()~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
   IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_Decline_Quest
   IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
END

IF ~~ THEN BEGIN demonologe
   SAY @259
   IF ~~ THEN EXTERN ~ACTHARUN~ warn
END
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN KorganKyriani
   SAY @260
   IF ~~ THEN REPLY @261 EXTERN ~ACKYRIAN~ 13
END

IF ~~ THEN BEGIN Korgan_Accept_Quest
   SAY @249
   =
   @250
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   IF ~!IsValidForPartyDialog("Jaheira")
   IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~!IsValidForPartyDialog("Jaheira")
   !IsValidForPartyDialog("Anomen")
   IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   IF ~!IsValidForPartyDialog("Jaheira")
   !IsValidForPartyDialog("Anomen")
   !IsValidForPartyDialog("Keldorn")
   IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   IF ~!IsValidForPartyDialog("Jaheira")
   !IsValidForPartyDialog("Anomen")
   !IsValidForPartyDialog("Keldorn")
   !IsValidForPartyDialog("Edwin")
   IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
   IF ~~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
END
END

APPEND ~JANJ~
END

APPEND ~KELDORJ~
IF ~~ THEN BEGIN Keldorn_Accept_Quest
   SAY @240
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   IF ~!IsValidForPartyDialog("Edwin")
   IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
   IF ~~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
END

IF ~~ THEN BEGIN demonologe
   SAY @262
   IF ~~ THEN EXTERN ~ACTHARUN~ warn
END
END

APPEND ~EDWINJ~
IF ~~ THEN BEGIN Edwin_Decline_Quest
   SAY @246
   =
   @247
   IF ~~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
END
END

APPEND ~HAERDAJ~
IF ~~ THEN BEGIN HaerDalis_Infinite_Staircase
   SAY @263
   IF ~~ THEN EXTERN ~ACKYRIAN~ 5
END
END

APPEND ~VALYGARJ~
IF ~~ THEN BEGIN Valygar_Decline_Quest
   SAY @248
   IF ~True()~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~True()~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~True()~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~True()~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Accept_Quest
   IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
END
END

APPEND ~MINSCJ~
IF ~~ THEN BEGIN Minsc_Accept_Quest
   SAY @264
   =
   @243
   IF ~True()~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~True()~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~True()~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~True()~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Accept_Quest
   IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
   IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_Decline_Quest
END
END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN Waterdeep
   SAY @265
   IF ~~ THEN EXTERN ~ACKYRIAN~ 10
END

IF ~~ THEN BEGIN Demon_Comment
   SAY @266
   IF ~~ THEN EXTERN ~ACTHARUN~ where
END
END

APPEND ~MAZZYJ~ 
IF ~~ THEN BEGIN search
SAY @267
    IF ~~ THEN EXTERN ~ACTHARUN~ help
END

IF ~~ THEN BEGIN Mazzy_Decline_Quest
SAY @239
    IF ~~ THEN EXTERN ~ACTHARUN~ help
END

END

APPEND ~IMOEN2J~
IF ~~ THEN BEGIN Imoen_Accept_Quest
SAY @251
   IF ~True()~ THEN REPLY @170 EXTERN ~ACTHARUN~ 35
   IF ~True()~ THEN REPLY @171 EXTERN ~ACTHARUN~ 39
   IF ~True()~ THEN REPLY @172 EXTERN ~ACTHARUN~ 40
   IF ~True()~ THEN REPLY @173 EXTERN ~ACTHARUN~ 42
   IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_Accept_Quest
   IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ Aerie_Accept_Quest
   IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ Viconia_Accept_Quest
   IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_Accept_Quest
   //IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ Cernd_Accept_Quest
   //IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_Accept_Quest
   IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_Accept_Quest
   IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_Accept_Quest
   //IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ HaerDalis_Accept_Quest
   IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ Edwin_Decline_Quest
   //IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_Decline_Quest
   IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ Mazzy_Decline_Quest
   IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ Valygar_Decline_Quest
   IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ Minsc_Accept_Quest
END
END
