/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in AC#W45: night hag
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W#NH1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @0
   IF ~~ THEN REPLY @1 + greetings
   IF ~~ THEN REPLY @2 + go_away
END

IF ~True()~ THEN BEGIN hello_again
   SAY @3
   IF ~GlobalGT("AC#W_Larva_quest","GLOBAL",0)
   GlobalLT("AC#W_Larva_quest","GLOBAL",3)~ THEN REPLY @4 + need_larva
   IF~!Dead("AC#W4ORM")
   Global("AC#W_Ormad_Quest","GLOBAL",3)
Global("AC#W_NighthagKillOrmad","GLOBAL",0)
Global("AC#W_NighthagKillOrmad","GLOBAL",0)~THEN REPLY @5 EXTERN AC#W#NH1 cancel_ormad
	IF ~Global("AC#W_NighthagKillOrmad","GLOBAL",5)~ THEN REPLY @6 + ormad_dead
   IF ~~ THEN REPLY @2 + go_away
END

	IF ~~ THEN BEGIN go_away
	SAY @7
	IF ~~ THEN EXIT 
	END
	
	IF ~~ THEN BEGIN greetings
	SAY @8
	IF ~~ THEN REPLY @9 GOTO what_do_you_do
	IF ~GlobalGT("AC#W_Larva_quest","GLOBAL",0)
	GlobalLT("AC#W_Larva_quest","GLOBAL",3)~ THEN REPLY @4 + need_larva
	END
	
		IF ~~ THEN BEGIN what_do_you_do
		SAY @10
		IF ~~ THEN REPLY @11 GOTO go_away
		IF ~GlobalGT("AC#W_Larva_quest","GLOBAL",0)
		GlobalLT("AC#W_Larva_quest","GLOBAL",3)~ THEN REPLY @4 + need_larva
		END
		
		IF ~~ THEN BEGIN need_larva
		SAY @12		
		IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",2)~ GOTO need_larva_02
		END
		
		IF ~~ THEN BEGIN need_larva_02
		SAY @13
		IF ~~ THEN REPLY @14 GOTO magrog_didnt_tell_gp
		IF ~~ THEN REPLY @15 + why_gp
		IF ~PartyGoldGT(999)~ THEN REPLY @16 + buy_larva
		IF ~PartyGoldLT(1000)~ THEN REPLY @17 + not_enough_gold
		IF ~~ THEN REPLY @18 + not_enough_gold
		END
		
			IF ~~ THEN BEGIN not_enough_gold
			SAY @19
			IF ~~ THEN EXIT
			END
		
				IF ~~ THEN BEGIN buy_larva
				SAY @20
				IF ~~ THEN DO ~TakePartyGold(1000)
				DestroyGold(1000)
				GiveItemCreate("AC#W45PS",LastTalkedToBy,1,0,0)
				AddJournalEntry(@470002,QUEST)~ GOTO deposit
				END
				
					IF ~~ THEN BEGIN deposit
					SAY @21
					IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",3)~ EXIT 
					END

			IF ~~ THEN BEGIN why_gp
			SAY @22
			IF ~~ THEN REPLY @23 GOTO magrog_didnt_tell_gp
			IF ~PartyGoldGT(999)~ THEN REPLY @16 + buy_larva
			IF ~PartyGoldLT(1000)~ THEN REPLY @17 + not_enough_gold
			IF ~~ THEN REPLY @18 + not_enough_gold
			END
		
			IF ~~ THEN BEGIN magrog_didnt_tell_gp
			SAY @24
			//IF ~~ THEN REPLY @25 GOTO talk_with_margrog_again
			IF ~PartyGoldGT(999)~ THEN REPLY @16 + buy_larva
			IF ~PartyGoldLT(1000)~ THEN REPLY @17 + not_enough_gold
			IF ~~ THEN REPLY @18 + not_enough_gold
			END
			
				IF ~~ THEN BEGIN talk_with_margrog_again
				SAY @26
				IF ~~ THEN EXIT 
				END

			CHAIN AC#W#NH1 cancel_ormad
			@27
			END
			IF ~~ THEN REPLY @28 + cancel_ormad_02 
			IF~~THEN REPLY @29 + go_away

				CHAIN AC#W#NH1 cancel_ormad_02
				@30
				END
				IF ~~ THEN REPLY @31 + ormad_pillow_understand
				IF~~THEN REPLY @32 + go_away

					CHAIN AC#W#NH1 ormad_pillow_understand
					@33
					END
					IF ~~ THEN REPLY @34 + ormad_pillow_01
					IF~~THEN REPLY @35 + go_away

					CHAIN AC#W#NH1 ormad_pillow_01
					@36
					END
					IF ~~ THEN REPLY @37 + ormad_pillow_02
					IF~~THEN REPLY @35 + go_away	

					CHAIN AC#W#NH1 ormad_pillow_02
					@38
					END
					IF ~~ THEN REPLY @39 + ormad_pillow_accept
					IF~~THEN REPLY @35 + go_away

					CHAIN AC#W#NH1 ormad_pillow_accept
					@40
					DO ~GiveItemCreate("AC#WNIPW",LastTalkedToBy,1,0,0)
					SetGlobal("AC#W_NighthagKillOrmad","GLOBAL",1)~
					EXIT
					
					
					CHAIN IF ~~ THEN AC#W#NH1 ormad_dead
			@41
			=
			@42
			DO ~SetGlobal("AC#W_NighthagKillOrmad","GLOBAL",10)
			AddJournalEntry(@410002,QUEST_DONE)
			GiveItemCreate("AC#WNHPN",LastTalkedToBy,1,0,0)
			CreateVisualEffectObject("SPDIMNDR",Myself) 
			Wait(1)	
			DestroySelf()~
			EXIT
					
