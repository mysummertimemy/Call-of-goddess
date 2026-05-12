/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialogues in Samora
***********************************************************************************************************************************************
**********************************************************************************************************************************************/
// Blackguard in Samora

CHAIN IF ~Global("Jump","LOCALS",2)~ THEN AC#WBLK2 hello_1
@281
END
IF~~THEN REPLY @282 EXTERN AC#WBLK2 get_rose
IF~~THEN REPLY @287 EXTERN AC#WBLK2 who_are_you
IF~~THEN REPLY @283 EXTERN AC#WBLK2 bye
IF~~THEN REPLY @284 EXTERN AC#WBLK2 bye


	CHAIN AC#WBLK2 get_rose
	@285
	DO ~EscapeAreaObject("TrAC#W4W")~ EXIT

	CHAIN IF ~~ THEN AC#WBLK2 bye
	@286
	DO ~EscapeAreaObject("TrAC#W4W")~ EXIT
	
	CHAIN IF ~~ THEN AC#WBLK2 who_are_you
	@288
	END
	IF~~THEN REPLY @282 EXTERN AC#WBLK2 get_rose
	IF~~THEN REPLY @283 EXTERN AC#WBLK2 bye
	IF~~THEN REPLY @284 EXTERN AC#WBLK2 bye
	
BEGIN ~AC#WBLK2~
CHAIN IF ~True()~ THEN AC#WBLK2 hello_0
@280
==DORNJ IF ~InParty("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @289
EXIT

/*
Dialogues mage - Dretches magic fails
*/
BEGIN ~AC#W40MG~ //Mage	
BEGIN ~AC#W40M1~ //Dretch#1
BEGIN ~AC#W40MD~ //Dretch#2

CHAIN IF ~Global("MageSpellFail","AC#W40",1)~ THEN AC#W40M1 dretch_mage_02
@258
== AC#W40MD @259
== AC#W40M1 @260
DO ~SetGlobal("MageSpellFail","AC#W40",10)
CreateVisualEffectObject("SPDIMNDR",Myself)
CreateVisualEffectObject("SPDIMNDR","AC#W40MD")
Wait(3)
AddJournalEntry(@400502,QUEST)
PlaySound("PORTAL2")
ActionOverride("AC#W40MD",DestroySelf())
DestroySelf()~ EXIT	

CHAIN IF ~True()~ THEN AC#W40MG dretch_mage_01
@261
== AC#W40M1 @262
== AC#W40MD @263
== AC#W40MG @264 
== AC#W40M1 @265
== AC#W40MG @266
== AC#W40MD @267
== AC#W40MG @268
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#W40MF")~ EXIT	

// Bebilith
BEGIN ~AC#W#BE2~

CHAIN IF ~True()~ THEN AC#W#BE2 hello_bebilith
@257 
EXIT

// Alu-fiend that tells player that Margrog the Nalfeshnee is gone
BEGIN ~AC#WALMG~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WALMG hello_0
@0
END
IF~Global("AC#W_TharundarSoul","GLOBAL",0)~THEN EXTERN AC#WALMG suspicious
IF~GlobalGT("AC#W_TharundarSoul","GLOBAL",0)~THEN DO ~EraseJournalEntry(@470700)
AddJournalEntry(@470701,QUEST)
SetGlobal("AC#W_TharundarSoul","GLOBAL",2)~ EXTERN AC#WALMG suspicious

	CHAIN AC#WALMG suspicious
	@1
	END
	IF~Global("AC#W_EnteredAcidSwamp","GLOBAL",0)~THEN EXTERN AC#WALMG bye_tell_maretta
	IF~GlobalGT("AC#W_EnteredAcidSwamp","GLOBAL",0)~THEN EXTERN AC#WALMG bye_go_counting_house

	CHAIN IF ~~ THEN AC#WALMG bye_go_counting_house
	@2
	DO ~AddJournalEntry(@470601,QUEST)
	EscapeArea()~ EXIT


	CHAIN IF ~~ THEN AC#WALMG bye_tell_maretta
	@3
	DO ~AddJournalEntry(@470601,QUEST)
	EscapeArea()~ EXIT
	
// Dretch watching the PC enter the fiery oven and take damage
BEGIN ~AC#DRETP~

CHAIN IF ~GlobalGT("Ovenreaction","AC#W40",0)
GlobalLT("Ovenreaction","AC#W40",10)~ THEN AC#DRETP hello_0
@4
END
IF~~THEN REPLY @5 EXTERN AC#DRETP bye
IF~~THEN REPLY @6 EXTERN AC#DRETP bye
IF~~THEN REPLY @7 EXTERN AC#DRETP how_access_oven


	CHAIN AC#DRETP how_access_oven
	@8
	END
	IF~~THEN EXTERN AC#DRETP bye

	CHAIN IF ~~ THEN AC#DRETP bye
	@9
	DO ~SetGlobal("Ovenreaction","AC#W40",10)
	EscapeArea()~ EXIT
	
// Annia Greystockings, if player mentioned Infinite Staircase
BEGIN ~AC#W#AG2~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W#AG2 hello_0
@10
END
IF~~THEN REPLY @11 EXTERN AC#W#AG2 bye
IF~~THEN REPLY @12 EXTERN AC#W#AG2 not_leave_behind
IF~~THEN REPLY @13 EXTERN AC#W#AG2 not_leave_behind

CHAIN AC#W#AG2 not_leave_behind
@14
END
IF~~THEN REPLY @15 EXTERN AC#W#AG2 bye
IF~~THEN REPLY @12 EXTERN AC#W#AG2 not_leave_behind_02

	CHAIN AC#W#AG2 not_leave_behind_02
	@16
	END
	IF~~THEN EXTERN AC#W#AG2 bye

	CHAIN IF ~~ THEN AC#W#AG2 bye
	@17
	DO ~SetGlobal("AC#W_Annia_Staircase","GLOBAL",10)
	Attack("AC#DRET4")~ EXIT
	
CHAIN IF ~True()~ THEN AC#W#AG2 hello_hurry_up
@256 
EXIT

// Alu-fiend that summons players to Maretta after the talk with Mefisto
BEGIN ~AC#WAL4A~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WAL4A hello_0
@18
END
IF~~THEN REPLY @19 EXTERN AC#WAL4A bye
IF~~THEN REPLY @20 EXTERN AC#WAL4A bye
IF~~THEN REPLY @21 EXTERN AC#WAL4A wheres_counting_house

CHAIN AC#WAL4A wheres_counting_house
@22
END
IF~~THEN EXTERN AC#WAL4A bye


	CHAIN IF ~~ THEN AC#WAL4A bye
	@23
	END
	IF~GlobalLT("AC#W_Samoras_Arena","GLOBAL",10)~ THEN EXTERN AC#WAL4A bye_mefisto 
	IF~Global("AC#W_Samoras_Arena","GLOBAL",10)~ THEN EXTERN AC#WAL4A bye_champion 
	
		CHAIN IF ~~ THEN AC#WAL4A bye_mefisto
		@24
		END
		IF~~ THEN DO ~AddJournalEntry(@470501,QUEST)
		SetGlobal("AudienceMarettaDeliver","AC#W40",10)
		EscapeArea()~ EXIT
		
		CHAIN IF ~~ THEN AC#WAL4A bye_champion
		@24
		END
		IF~~ THEN DO ~AddJournalEntry(@470502,QUEST)
		SetGlobal("AudienceMarettaDeliver","AC#W40",10)
		EscapeArea()~ EXIT

// Tortured mage
BEGIN ~AC#W40TR~

CHAIN IF ~True()~ THEN AC#W40TR hello_0
@25
END
IF~~THEN REPLY @26 EXTERN AC#W40TR help_01
IF~~THEN REPLY @27 EXTERN AC#W40TR punishment
IF~~THEN REPLY @28 EXTERN AC#W40TR bye

	CHAIN IF ~~ THEN AC#W40TR help_01
	@29
	END
	IF~~THEN REPLY @30 EXTERN AC#W40TR bye
	IF~~THEN REPLY @31 EXTERN AC#W40TR help_02
	
	CHAIN IF ~~ THEN AC#W40TR help_02
	@32
	END
	IF~~THEN REPLY @30 EXTERN AC#W40TR bye
	IF~~THEN REPLY @31 EXTERN AC#W40TR bye

	CHAIN IF ~~ THEN AC#W40TR punishment
	@33
	END
	IF~~THEN REPLY @30 EXTERN AC#W40TR bye
	IF~~THEN REPLY @31 EXTERN AC#W40TR help_01


	CHAIN IF ~~ THEN AC#W40TR bye
	@34
	EXIT

// General store
BEGIN ~AC#W40S6~

IF ~True()~ THEN BEGIN hello_desc
SAY @35 
IF ~~ THEN REPLY @36 GOTO lets_shop
IF ~~ THEN REPLY @37 + no_interest
END

			IF ~~ THEN BEGIN no_interest
			SAY @38
			IF ~~ THEN EXIT 
			END
		
			IF ~~ THEN BEGIN lets_shop
			SAY @39
			IF ~~ THEN DO ~StartStore("AC#W40S6",LastTalkedToBy())~ EXIT 
			END
			
// Gildaar in Samora, cutscene
BEGIN ~AC#WGIL3~

// Lady's lancers in Samora, cutscene
BEGIN ~AC#WALU6~
BEGIN ~AC#WALU7~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WGIL3 hello_accusation
@40
==AC#WALU6 @41
==AC#WALU7 @42
==AC#WGIL3 @43
==AC#WALU6 @44
==AC#WALU7 @45
END
IF~~THEN REPLY @46 EXTERN AC#WGIL3 hes_lying
IF~~THEN REPLY @301 EXTERN AC#WGIL3 hes_lying
IF~OR(8)
Class(Player1,FIGHTER_CLERIC)
Class(Player1,FIGHTER_MAGE_THIEF)
Class(Player1,FIGHTER_DRUID)
Class(Player1,FIGHTER_MAGE_CLERIC)
Class(Player1,FIGHTER_ALL)
Class(Player1,RANGER_ALL)
Class(Player1,PALADIN_ALL)
Class(Player1,CLERIC_RANGER)~THEN REPLY @47 EXTERN AC#WGIL3 hes_lying
IF~Class(Player1,BARD_ALL)~THEN REPLY @48 EXTERN AC#WGIL3 hes_lying
IF~OR(4)
Class(Player1,SORCERER)
Class(Player1,MAGE_ALL)
Class(Player1,FIGHTER_MAGE)
Class(Player1,FIGHTER_MAGE_THIEF)~THEN REPLY @49 EXTERN AC#WGIL3 hes_lying

	CHAIN AC#WGIL3 hes_lying
	@50
	==AC#WALU6 @51
	END
	IF~~THEN REPLY @52 EXTERN AC#WALU6 no_problem
	IF~~THEN REPLY @292 EXTERN AC#WALU6 suspicious_answer_trouble
	IF~~THEN REPLY @293 EXTERN AC#WALU6 suspicious_answer_honorable
	IF~~THEN REPLY @290 EXTERN AC#WALU6 no_problem
	
		CHAIN AC#WALU6 no_problem
		@291
		END
		IF~~THEN EXTERN AC#WGIL3 hes_lying_02
		
		CHAIN AC#WALU6 suspicious_answer_trouble
		@294
		END
		IF~~THEN EXTERN AC#WALU7 suspicious_tutti
		
		CHAIN AC#WALU6 suspicious_answer_honorable
		@295
		END
		IF~~THEN EXTERN AC#WALU7 suspicious_tutti
		
		CHAIN AC#WALU7 suspicious_tutti
		@296
		== BEDWIN IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @297
		== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @298
		== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @299
		END
		IF~~THEN EXTERN AC#WGIL3 hes_lying_02

		CHAIN AC#WGIL3 hes_lying_02
		@53
		==AC#WALU6 @54
		==AC#WALU7 @55
		==AC#WGIL3 @56
		==AC#WALU7 @57
		==AC#WGIL3 @58
		DO ~SetGlobal("AC#WGildaarAbyss","GLOBAL",2)
		EraseJournalEntry(@110010)
		AddJournalEntry(@110011,QUEST)
		ActionOverride("AC#WALU6",EscapeArea())
		ActionOverride("AC#WALU7",EscapeArea())
		EscapeArea()~ EXIT

// Belthazaar, soul trader and quest NPC for Ormad Sulpar's questline
BEGIN ~AC#W40GB~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40GB hello_0
@59
END
IF~~THEN REPLY @60 EXTERN AC#W40GB offer_01
IF~~THEN REPLY @61 EXTERN AC#W40GB bye
IF~!Dead("AC#W4ORM")
Global("AC#W_Ormad_Quest","GLOBAL",3)
Global("AC#W_OrmadGlabrezu","GLOBAL",0)~THEN REPLY @62 EXTERN AC#W40GB cancel_ormad

CHAIN IF ~True()~ THEN AC#W40GB hello_0
@63
END
IF~~THEN REPLY @60 EXTERN AC#W40GB offer_01
IF~~THEN REPLY @61 EXTERN AC#W40GB bye
IF~!Dead("AC#W4ORM")
Global("AC#W_Ormad_Quest","GLOBAL",3)
Global("AC#W_OrmadGlabrezu","GLOBAL",0)
Global("AC#W_GlabKillOrmad","GLOBAL",0)~THEN REPLY @62 EXTERN AC#W40GB cancel_ormad
IF ~Global("AC#W_GlabKillOrmad","GLOBAL",5)~ THEN REPLY @64 EXTERN AC#W40GB ormad_dead

			CHAIN IF ~~ THEN AC#W40GB ormad_dead
			@65
			= @66
			= @67
			DO ~SetGlobal("AC#W_GlabKillOrmad","GLOBAL",10)
			AddJournalEntry(@410007,QUEST_DONE)
			GiveItemCreate("AC#WGLAD",LastTalkedToBy,1,0,0)
			CreateVisualEffectObject("SPDIMNDR",Myself) 
			Wait(1)	
			DestroySelf()~
			EXIT
			
			CHAIN AC#W40GB cancel_ormad
			@68
			END
			IF ~~ THEN REPLY @69 + cancel_ormad_02 
			IF~~THEN REPLY @70 EXTERN AC#W40GB bye							
			
		CHAIN AC#W40GB offer_01
		@71
		END
		IF~~THEN REPLY @72 EXTERN AC#W40GB offer_02
		IF~~THEN REPLY @73 EXTERN AC#W40GB bye
		IF~~THEN REPLY @74 EXTERN AC#W40GB bye
		IF~~THEN REPLY @75 EXTERN AC#W40GB bye
		IF ~Global("AC#W_Ormad_Quest","GLOBAL",3)~ THEN REPLY @76 + ormad_book
		
				CHAIN AC#W40GB ormad_book
				@77
				END
				IF ~~ THEN REPLY @69 + cancel_ormad_02 
				IF ~~ THEN REPLY @78 + cancel_ormad_02 
				
				
				CHAIN AC#W40GB cancel_ormad_02
				@79 
				END
				IF ~~ THEN + ormad_deal
				
				CHAIN AC#W40GB ormad_deal
				@80
				END
				IF ~~ THEN REPLY @81 + ormad_deal_02 
				IF ~~ THEN REPLY @82 + ormad_riddle 
				IF ~~ THEN REPLY @83 + ormad_riddle 
				
				CHAIN AC#W40GB ormad_deal_02
				@84
				END
				IF ~~ THEN REPLY @85 + ormad_deal_yes
				IF ~~ THEN REPLY @86 + ormad_deal_think
				IF ~~ THEN REPLY @87 + ormad_riddle

					CHAIN AC#W40GB ormad_deal_think
					@88
					END
					IF ~~ THEN REPLY @89 + ormad_deal_yes
					IF ~~ THEN REPLY @87 + ormad_riddle

						CHAIN AC#W40GB ormad_deal_yes
						@90
						END
						IF~~THEN DO ~GiveItemCreate("AC#WGLDG",LastTalkedToBy,1,0,0)
						AddJournalEntry(@410005,QUEST)
						SetGlobal("AC#W_GlabKillOrmad","GLOBAL",1)~ EXIT					
				
				CHAIN AC#W40GB ormad_riddle
				@91
				END
				IF~~THEN DO ~GiveItem("AC#WGBRI",LastTalkedToBy)
				AddJournalEntry(@410100,QUEST)
				SetGlobal("AC#W_OrmadGlabrezu","GLOBAL",1)~ EXIT
				
						
			CHAIN AC#W40GB offer_02
			@92
			END
			IF~~THEN REPLY @93 EXTERN AC#W40GB bye
			IF~~THEN REPLY @74 EXTERN AC#W40GB bye
			IF~~THEN REPLY @75 EXTERN AC#W40GB bye
		
			CHAIN IF ~~ THEN AC#W40GB bye
			@94
			EXIT
		
// Unicorn merchant
BEGIN ~AC#W40UM~

CHAIN IF ~True()~ THEN AC#W40UM hello_0
@95
END
IF~~THEN REPLY @96 EXTERN AC#W40UM what_do_you_have
IF~~THEN REPLY @61 EXTERN AC#W40UM bye

	CHAIN AC#W40UM what_do_you_have
	@97
	==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID) Global("JaheiraUnicornReact","AC#W40",0)~ THEN @98 DO ~SetGlobal("JaheiraUnicornReact","AC#W40",1)~ 
	==AC#W40UM @99
	END
	IF~~THEN REPLY @100 EXTERN AC#W40UM unicorns_01
	IF~~THEN REPLY @101 EXTERN AC#W40UM unicorns_ingredients
	IF~~THEN REPLY @74 EXTERN AC#W40UM bye
	IF~~THEN REPLY @61 EXTERN AC#W40UM bye

		CHAIN AC#W40UM unicorns_01
		@102
		END
		IF~~THEN REPLY @101 EXTERN AC#W40UM unicorns_ingredients
		IF~~THEN REPLY @74 EXTERN AC#W40UM bye
		IF~~THEN REPLY @75 EXTERN AC#W40UM bye
		
		CHAIN AC#W40UM unicorns_ingredients
		@103
		END
		IF~~THEN REPLY @104 EXTERN AC#W40UM disgusting
		IF~~THEN REPLY @74 EXTERN AC#W40UM bye
		IF~~THEN REPLY @75 EXTERN AC#W40UM bye
		
		CHAIN AC#W40UM disgusting
		@105
		END
		IF~~THEN REPLY @74 EXTERN AC#W40UM bye
		IF~~THEN REPLY @75 EXTERN AC#W40UM bye

	CHAIN IF ~~ THEN AC#W40UM bye
	@106
	EXIT
	
// Quasit in service of Margrog the Nalfeshnee
BEGIN ~AC#W4QU2~

IF ~True()~ THEN BEGIN hello_0
SAY @107
IF ~~ THEN REPLY @108 GOTO bye
IF ~~ THEN REPLY @109 GOTO bye
END

	IF ~~ THEN BEGIN bye
	SAY @110
	IF ~~ THEN DO ~SetGlobal("AC#W_Margrog_trouble","GLOBAL",2)
	AddJournalEntry(@470100,QUEST)
	CreateVisualEffectObject("SPDIMNDR",Myself) 
	Wait(1)				
	DestroySelf()~ EXIT 
	END
// Vrock, Deva wings seller

BEGIN ~AC#VROC2~

IF ~True()~ THEN BEGIN hello_0
SAY @111
IF ~~ THEN REPLY @112 GOTO what_looks_like
IF ~~ THEN REPLY @113 + where_come_from
IF ~~ THEN REPLY @114 GOTO what_for
IF ~~ THEN REPLY @115 GOTO awful
IF ~Global("Bought_Deva_wing","LOCALS",0)~ THEN REPLY @116 + buy_deva_wing
IF ~~ THEN REPLY @117 + another_time
IF ~Global("AC#W_Verin_dispute","GLOBAL",4)~ THEN REPLY @118 + search_angel_wing
END

	IF ~~ THEN BEGIN search_angel_wing
	SAY @119
	IF ~~ THEN REPLY @120 GOTO maretta_feather
	END
	
		IF ~~ THEN BEGIN maretta_feather
		SAY @121
		IF ~~ THEN GOTO maretta_feather_02
		END
		
			IF ~~ THEN BEGIN maretta_feather_02
			SAY @122
			IF ~~ THEN DO ~GiveItemCreate("AC#WDVFT",LastTalkedToBy,1,0,0)
			SetGlobal("AC#W_Verin_dispute","GLOBAL",5)
			EraseJournalEntry(@400200)
			AddJournalEntry(@400201,QUEST)
			~ EXIT 
			END

	IF ~~ THEN BEGIN buy_deva_wing
	SAY @123
	IF ~~ THEN GOTO buy_deva_wing_02
	IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID) Global("Aerie_wing_reaction","LOCALS",0)~ THEN DO ~SetGlobal("Aerie_wing_reaction","LOCALS",1)~ EXTERN AERIEJ aerie_deva_wing
	END
	
	IF ~~ THEN BEGIN buy_deva_wing_02
	SAY @124
	IF ~PartyGoldLT(10000)~ THEN REPLY @125 GOTO no_buy_deva_wing
	IF ~PartyGoldGT(9999)~ THEN REPLY @126 GOTO yes_buy_deva_wing
	IF ~~ THEN REPLY @127 + another_time
	END
	
		IF ~~ THEN BEGIN yes_buy_deva_wing
		SAY @128
		IF ~~ THEN DO ~TakePartyGold(10000)
		DestroyGold(10000)
		SetGlobal("Bought_Deva_wing","LOCALS",1)
		GiveItemCreate("AC#WDVWG",LastTalkedToBy,1,0,0)~ EXIT 
		END
		
		IF ~~ THEN BEGIN no_buy_deva_wing
		SAY @129
		IF ~~ THEN EXIT 
		END

	IF ~~ THEN BEGIN where_come_from
	SAY @130
	IF ~~ THEN REPLY @115 GOTO awful
	END

	IF ~~ THEN BEGIN what_looks_like
	SAY @131
	IF ~~ THEN REPLY @114 GOTO what_for
	IF ~~ THEN REPLY @113 + where_come_from
	END
	
		IF ~~ THEN BEGIN what_for
		SAY @132
		IF ~Global("Bought_Deva_wing","LOCALS",0)~ THEN REPLY @116 + buy_deva_wing
		IF ~~ THEN REPLY @117 + another_time		
		END
		
		IF ~~ THEN BEGIN another_time
		SAY @133
		IF ~~ THEN EXIT 
		END

		IF ~~ THEN BEGIN awful
		SAY @134
		IF ~~ THEN EXIT 
		END

// Tiefling, talking about cleric spells

BEGIN ~AC#W40SW~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @135
IF ~~ THEN REPLY @136 GOTO what_do_you_mean
IF ~~ THEN REPLY @137 + bye
END

	IF ~~ THEN BEGIN what_do_you_mean
	SAY @138
	IF ~~ THEN DO ~EscapeArea()~ EXIT
	END
	
	IF ~~ THEN BEGIN bye
	SAY @139
	IF ~~ THEN DO ~EscapeArea()~ EXIT
	END


// Encounter with 2 Vrocks and a captured Deva, see CHAIN below

BEGIN ~AC#W40V1~

BEGIN ~AC#W40V2~

BEGIN ~AC#W40DV~

// Zeep: Quasit, Ormad's familiar
BEGIN ~AC#W4QU1~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @140
IF ~~ THEN REPLY @141 + yes_i_do
IF ~~ THEN REPLY @142 + no_i_dont
END

	IF ~~ THEN BEGIN no_i_dont
	SAY @143
	IF ~~ THEN GOTO job_offer
	END
	
	IF ~~ THEN BEGIN yes_i_do
	SAY @144
	IF ~~ THEN GOTO job_offer
	END
	
		IF ~~ THEN BEGIN job_offer
		SAY @145
		IF ~~ THEN REPLY @146 GOTO who_is_master
		END
		
			IF ~~ THEN BEGIN who_is_master
			SAY @147
			IF ~~ THEN REPLY @148 GOTO job_offer_02
			IF ~~ THEN REPLY @149 GOTO job_offer_02
			IF ~~ THEN REPLY @150 + what_does_he_want
			END
			
				IF ~~ THEN BEGIN what_does_he_want
				SAY @151
				IF ~~ THEN GOTO job_offer_02
				END
			
				IF ~~ THEN BEGIN job_offer_02
				SAY @152
				IF ~~ THEN DO ~AddJournalEntry(@400900,QUEST)
				SetGlobal("AC#W_Ormad_Quest","GLOBAL",2)
				CreateVisualEffectObject("SPDIMNDR",Myself) 
				Wait(1)				
				DestroySelf()~ EXIT 
				END

// Arcanaloth, Book seller
BEGIN ~AC#WARC1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_01
	SAY @156
	IF ~~ THEN REPLY @157 GOTO do_you_sell_books 
	IF ~~ THEN REPLY @158 + what_is_arcanaloth
	IF ~~ THEN REPLY @36 GOTO lets_shop
	IF ~~ THEN REPLY @159 + no_interest
	END

IF ~True()~ THEN BEGIN hello_again
SAY @154
IF ~!PartyHasItem("AC#WBKFD")
Global("Fiendbook_sold","AC#W40",0)~ THEN REPLY @155 + recommend
IF ~~ THEN REPLY @36 GOTO lets_shop
IF ~~ THEN REPLY @37 + no_interest
END
/*
	IF ~~ THEN BEGIN hello_01
	SAY @156
	IF ~~ THEN REPLY @157 GOTO do_you_sell_books 
	IF ~~ THEN REPLY @158 + what_is_arcanaloth
	IF ~~ THEN REPLY @36 GOTO lets_shop
	IF ~~ THEN REPLY @159 + no_interest
	END
*/	
		IF ~~ THEN BEGIN what_is_arcanaloth
		SAY @160
		IF ~~ THEN REPLY @157 GOTO do_you_sell_books
		IF ~~ THEN REPLY @36 GOTO lets_shop
		IF ~~ THEN REPLY @159 + no_interest
		END
	
		IF ~~ THEN BEGIN do_you_sell_books
		SAY @161
		IF ~!PartyHasItem("AC#WBKFD")~ THEN REPLY @155 + recommend
		IF ~~ THEN REPLY @162 GOTO lets_shop
		IF ~~ THEN REPLY @159 + no_interest
		END

			IF ~~ THEN BEGIN recommend
			SAY @163
			IF ~~ THEN GOTO fiend_book
			END
			
				IF ~~ THEN BEGIN fiend_book
				SAY @164
				IF ~~ THEN REPLY @162 GOTO lets_shop
				IF ~~ THEN REPLY @159 + no_interest
				END
		
			IF ~~ THEN BEGIN no_interest
			SAY @165
			IF ~~ THEN EXIT 
			END
		
			IF ~~ THEN BEGIN lets_shop
			SAY @166
			IF ~~ THEN DO ~StartStore("AC#WARC1",LastTalkedToBy())~ EXIT 
			END

// Babau - Blood war recruiter
BEGIN ~AC#W40BB~

IF ~GlobalGT("BloodWarJob","AC#W40",9)~ THEN BEGIN hello_good_job
SAY @167
IF ~~ THEN EXIT 
END

IF ~Global("BloodWarJob","AC#W40",5)~ THEN BEGIN hello_have_head
SAY @168
IF ~~ THEN DO ~SetGlobal("BloodWarJob","AC#W40",9)~ GOTO reward  
END

	IF ~~ THEN BEGIN reward
	SAY @169
	IF ~~ THEN DO ~GiveGoldForce(666)
	AddexperienceParty(1000)~ GOTO go_to_maretta
	END
	
		IF ~~ THEN BEGIN go_to_maretta
		SAY @170
		IF ~~ THEN DO ~EraseJournalEntry(@470023)
		AddJournalEntry(@470030,QUEST)~ EXIT 
		END

IF ~Global("BloodWarJob","AC#W40",4)~ THEN BEGIN hello_portal_jump_finally
SAY @171
IF ~~ THEN EXIT 
END

IF ~Global("BloodWarJob","AC#W40",3)~ THEN BEGIN hello_portal_jump_now
SAY @172
IF ~~ THEN DO ~SetGlobal("BloodWarJob","AC#W40",4)~ EXIT 
END

IF ~Global("BloodWarJob","AC#W40",1)~ THEN BEGIN hello_portal
SAY @173
IF ~~ THEN REPLY @174 GOTO not_ready_yet
IF ~~ THEN REPLY @175 + lets_go_portal
END

	IF ~~ THEN BEGIN lets_go_portal
	SAY @176
	IF ~~ THEN DO ~EraseJournalEntry(@470020)
	EraseJournalEntry(@470021)
	AddJournalEntry(@470022,QUEST)
	ForceSpell(Myself,DO_NOTHING)
	SetGlobal("BloodWarJob","AC#W40",2)~ EXIT 
	END

	IF ~~ THEN BEGIN not_ready_yet
	SAY @177
	IF ~~ THEN EXIT 
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @178
IF ~Global("AC#W_Bloowar_quest","GLOBAL",1)~ THEN GOTO bloodwar_job
IF ~Global("AC#W_Bloowar_quest","GLOBAL",0)~ THEN GOTO get_lost
END

	IF ~~ THEN BEGIN get_lost
	SAY @179
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN bloodwar_job
	SAY @180
	IF ~~ THEN REPLY @181 GOTO which_job
	IF ~~ THEN REPLY @182 DO ~SetGlobal("Yes_bloodwar","AC#W40",1)~ GOTO fine_lets_go
	END
	
		IF ~~ THEN BEGIN which_job
		SAY @183
		IF ~~ THEN REPLY @184 GOTO about_bloodwar 
		IF ~~ THEN REPLY @182 DO ~SetGlobal("Yes_bloodwar","AC#W40",1)~ GOTO fine_lets_go
		END
		
			IF ~~ THEN BEGIN about_bloodwar
			SAY @185
			IF ~~ THEN REPLY @182 DO ~SetGlobal("Yes_bloodwar","AC#W40",1)~ GOTO fine_lets_go
			END
			
				IF ~~ THEN BEGIN fine_lets_go
				SAY @186
				IF ~~ THEN GOTO baatezu_general
				END
				
					IF ~~ THEN BEGIN baatezu_general
					SAY @187
					IF ~~ THEN REPLY @188 GOTO head_maretta
					END
					
						IF ~~ THEN BEGIN head_maretta
						SAY @189
						IF ~~ THEN GOTO rest_strength
						END
						
							IF ~~ THEN BEGIN rest_strength
							SAY @190
							IF ~~ THEN REPLY @191 GOTO wait_here
							IF ~~ THEN REPLY @192 DO ~SetGlobal("BloodWarJob","AC#W40",1)
							SetGlobal("AC#W_Bloowar_quest","GLOBAL",2)~ + i_am_ready
							END
							
								IF ~~ THEN BEGIN i_am_ready
								SAY @193
								IF ~~ THEN GOTO lets_go_portal
								END

								IF ~~ THEN BEGIN wait_here
								SAY @194
								IF ~~ THEN DO ~SetGlobal("BloodWarJob","AC#W40",1)
								SetGlobal("AC#W_Bloowar_quest","GLOBAL",2)
								EraseJournalEntry(@470020)
								AddJournalEntry(@470021,QUEST)~ EXIT
								END

IF ~True()~ THEN BEGIN hello_again
SAY @195
IF ~Global("AC#W_Bloowar_quest","GLOBAL",1)~ THEN GOTO bloodwar_job
IF ~Global("AC#W_Bloowar_quest","GLOBAL",0)~ THEN + get_lost
END

// Alu-Fiend guards in fornt of the counting house
BEGIN ~AC#WALU4~

IF ~Global("Rose_Quest","AC#W40",1)~ THEN BEGIN hello_rose
SAY @196
IF ~~ THEN DO ~SetGlobal("Rose_Quest","AC#W40",2)~ EXIT 
END

IF ~Global("Audience_Maretta","AC#W40",3)~ THEN BEGIN hello_audience
SAY @197
IF ~~ THEN DO ~SetGlobal("Audience_Maretta","AC#W40",4)~ EXIT 
END

IF ~GlobalGT("Rose_Quest","AC#W40",2)
GlobalLT("AC#W_Rose_Abyss","GLOBAL",10)~ THEN BEGIN hello_wait_audience
SAY @198
IF ~~ THEN EXIT 
END
/*
IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",1)
!Dead("AC#WNAL2")~ THEN REPLY @275 + search_margrog
IF ~~ THEN REPLY @274 + get_lost_bye 
END
*/

	IF ~~ THEN BEGIN search_margrog
	SAY @276
	IF ~~ THEN REPLY @274 + get_lost_bye 
	END

	IF ~~ THEN BEGIN get_lost_bye
	SAY @273
	IF ~~ THEN EXIT 
	END

IF ~GlobalGT("Audience_Maretta","AC#W40",3)
GlobalLT("Audience_Maretta","AC#W40",10)~ THEN BEGIN hello_wait_audience
SAY @198
IF ~~ THEN EXIT 
END

IF ~Global("AC#W_Verin_dispute","GLOBAL",3)~ THEN BEGIN hello_deva_feather
SAY @199
IF ~~ THEN REPLY @200 GOTO bye_deva_feather
IF ~~ THEN REPLY @201 + where_deva_feather
END

	IF ~~ THEN BEGIN where_deva_feather
	SAY @202
	IF ~~ THEN REPLY @203 GOTO bye_deva_feather
	END

	IF ~~ THEN BEGIN bye_deva_feather
	SAY @204
	IF ~~ THEN DO ~SetGlobal("AC#W_Verin_dispute","GLOBAL",4)
	AddJournalEntry(@400300,QUEST)
	AddJournalEntry(@400200,QUEST)~ EXIT 
	END

IF ~Global("Bebilith_Warning","AC#W40",1)~ THEN BEGIN hello_bebilith
SAY @205
IF ~~ THEN REPLY @206 GOTO better_not_know
IF ~~ THEN REPLY @207 + i_am_happy_about_it
END

	IF ~~ THEN BEGIN better_not_know
	SAY @208
	IF ~~ THEN REPLY @207 + i_am_happy_about_it
	IF ~~ THEN REPLY @209 + what_exactly
	END
	
		IF ~~ THEN BEGIN what_exactly
		SAY @210
		IF ~~ THEN DO ~SetGlobal("Bebilith_Warning","AC#W40",2) ~ EXIT 
		END

		IF ~~ THEN BEGIN i_am_happy_about_it
		SAY @211
		IF ~~ THEN DO ~SetGlobal("Bebilith_Warning","AC#W40",2)~ EXIT 
		END

IF ~GlobalGT("EnterCountingHouse","AC#W40",1)~ THEN BEGIN hello_again
SAY @198
IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",1)
!Dead("AC#WNAL2")~ THEN REPLY @275 + search_margrog
IF ~~ THEN REPLY @274 + get_lost_bye 
END
/*
IF ~~ THEN EXIT 
END
*/

// Alu-fiend warning about Gildaar encounter
IF ~Global("EnterCountingHouse","AC#W40",1)~ THEN BEGIN hello_head
SAY @269
IF ~~ THEN REPLY @270 GOTO hello_head_02 
IF ~~ THEN REPLY @271 GOTO hello_head_gildaar 
END

	IF ~~ THEN BEGIN hello_head_gildaar
	SAY @272
	IF ~~ THEN REPLY @270 GOTO hello_head_02 
	END

IF ~~ THEN BEGIN hello_head_02
SAY @212
IF ~~ THEN DO ~SetGlobal("EnterCountingHouse","AC#W40",2)
AddJournalEntry(@110003,QUEST)~ EXIT 
END

IF ~True()~ THEN BEGIN 0
   SAY @213
IF ~~ THEN EXIT
END

// Alu-Fiend guards in fornt of the counting house
BEGIN ~AC#WALU5~

IF ~True()~ THEN BEGIN 0
   SAY @214
IF ~~ THEN EXIT
END

// Alu-Fiend guards rest interrupt
BEGIN ~AC#WALUR~

IF ~OR(2)
GlobalGT("AC_Waukeen_Free","GLOBAL",0)
GlobalGT("AC#W_AttackedMaretta","GLOBAL",0)~ THEN BEGIN hello_angry
   SAY @215
IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~True()~ THEN BEGIN 0
   SAY @216
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

// Dialogue Saarixal, shadow fiend
BEGIN ~AC#WSHAF~

IF ~True()~ THEN BEGIN hello_0
SAY @217
IF ~PartyHasItem("AC#W45PS")~ THEN REPLY @218 + need_larva
IF ~~ THEN REPLY @219 GOTO bye
IF ~~ THEN REPLY @220 + bye
END

	IF ~~ THEN BEGIN bye
	SAY @221
	IF ~~ THEN EXIT 
	END
	
		IF ~~ THEN BEGIN need_larva
		SAY @222
		IF ~~ THEN DO ~TakePartyItem("AC#W45PS")
		DestroyItem("AC#W45PS")
		SetGlobal("AC#W_Larva_quest","GLOBAL",4)~ GOTO give_larva
		END
		
			IF ~~ THEN BEGIN give_larva
			SAY @223
			IF ~~ THEN DO ~GiveItemCreate("AC#W40LV",LastTalkedToBy,1,0,0)
			EraseJournalEntry(@470002)
			AddJournalEntry(@470003,QUEST)
			ActionOverride("AC#W40LV",DestroySelf())~ EXIT 
			END

// CHAIN

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40V1 chain_captured_deva
@224
== AC#W40DV @225  
== AC#W40V2 @226
== AC#W40V1 @227  
END
IF ~~ THEN DO ~SetGlobal("DevaEncounter","AC#W40",2)
SetGlobal("AC#W_Met_Deva","GLOBAL",1)
ActionOverride("AC#W40V2",EscapeAreaObject("Fieryoven_grazzt"))
ActionOverride("AC#W40DV",EscapeAreaObject("Fieryoven_grazzt"))
EscapeAreaObject("Fieryoven_grazzt")~ EXIT

// Dialogue Dretches

BEGIN ~AC#DRET2~

IF ~RandomNum(8,1)~ THEN BEGIN 1
SAY @228
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,2)~ THEN BEGIN 2
SAY @229
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,3)~ THEN BEGIN 3
SAY @230
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,4)~ THEN BEGIN 4
SAY @231
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,5)~ THEN BEGIN 5
SAY @232
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,6)~ THEN BEGIN 6
SAY @233
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,7)~ THEN BEGIN 7
SAY @234
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,8)~ THEN BEGIN 7
SAY @235
IF ~~ THEN EXIT 
END

// Dialogue damned souls

BEGIN ~AC#W40G1~

IF ~RandomNum(8,1)~ THEN BEGIN 1
SAY @236
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,2)~ THEN BEGIN 2
SAY @237
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,3)~ THEN BEGIN 3
SAY @238
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,4)~ THEN BEGIN 4
SAY @239
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,5)~ THEN BEGIN 5
SAY @240
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,6)~ THEN BEGIN 6
SAY @241
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,7)~ THEN BEGIN 7
SAY @242
IF ~~ THEN EXIT 
END

IF ~RandomNum(8,8)~ THEN BEGIN 7
SAY @243
IF ~~ THEN EXIT 
END

// Dialogue Manes

BEGIN ~AC#W40MN~

IF ~True()~ THEN BEGIN 0
SAY @244
IF ~~ THEN EXIT 
END

/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues Zombie Crier for Margrog in Samora AC#W40
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W40ZM~


CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40ZM hello_0
@248
==IMOEN2J IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @249
==KORGANJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @250 
END
IF~~THEN REPLY @251 EXTERN AC#W40ZM what_you_want
IF~~THEN REPLY @252 EXTERN AC#W40ZM bye

CHAIN AC#W40ZM what_you_want
@253
= @254
END
IF~~THEN EXTERN AC#W40ZM bye


	CHAIN IF ~~ THEN AC#W40ZM bye
	@255
	EXIT

	CHAIN IF ~True()~ THEN AC#W40ZM hello_again
	@255
	EXIT
	
// NPC Dialogues
APPEND ~AERIEJ~
IF ~~ THEN BEGIN aerie_deva_wing
   SAY @245
   IF ~~ THEN REPLY @246 EXTERN AC#VROC2 buy_deva_wing_02
   IF ~~ THEN REPLY @247 EXTERN AC#VROC2 no_buy_deva_wing
END
END

