/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W4W, Tavern Weeping goddess, 
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
//  Dialogue adventuring party: Glorious Gutslicers
BEGIN ~AC#W4WGF~
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W4WGF hello_0
@110
END
IF~~THEN REPLY @111 EXTERN AC#W4WGF make_way
IF~~THEN REPLY @112 EXTERN AC#W4WGF who_are_you
IF~~THEN REPLY @113 EXTERN AC#W4WGF fight

	CHAIN IF ~~ THEN AC#W4WGF make_way
	@114
	DO ~SetGlobal("Gutslicers","AC#W4W",10)
	EscapeArea()~ EXIT
	
	CHAIN AC#W4WGF who_are_you
	@115
	END
	IF~~THEN EXTERN AC#W4WGF fight
	
	CHAIN IF ~~ THEN AC#W4WGF fight
	@116
	DO ~SetGlobal("Gutslicers","AC#W4W",3)
	Enemy()~ EXIT
	
	

//  Dialog Fey'ri

BEGIN ~AC#W4WFY~

CHAIN IF ~Global("AC#W_Feyri_quest","GLOBAL",10)~ THEN AC#W4WFY hello_job_done
@0
EXIT
	
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W4WFY hello_0
@1
END
IF~~THEN REPLY @2 EXTERN AC#W4WFY who_are_you
IF~~THEN REPLY @3 EXTERN AC#W4WFY who_are_you
IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @4 EXTERN AC#W4WFY bye
IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @4 + bye_before_quest
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

CHAIN IF ~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)
GlobalLT("AC#W_Feyri_quest","GLOBAL",10)~ THEN AC#W4WFY hello_quest
@6
END
IF~PartyHasItem("AC#WDLAR")~THEN REPLY @7 EXTERN AC#W4WFY yes_have_insignia
IF~~THEN REPLY @8 EXTERN AC#W4WFY not_done_job
IF~~THEN REPLY @4 EXTERN AC#W4WFY bye
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

	
	CHAIN AC#W4WFY yes_have_insignia
	@9
	END
	IF~~THEN DO ~TakePartyItem("AC#WDLAR")~ EXTERN AC#W4WFY yes_have_insignia_02
	
		CHAIN AC#W4WFY yes_have_insignia_02
		@10
		END
		IF~~THEN DO ~GiveItemCreate("AC#WFEYR",LastTalkedToBy,1,0,0)
		SetGlobal("AC#W_Feyri_quest","GLOBAL",10)
		EraseJournalEntry(@460011)
		AddJournalEntry(@460012,QUEST_DONE)~ EXTERN AC#W4WFY yes_have_insignia_bye
		
	CHAIN IF ~~ THEN AC#W4WFY yes_have_insignia_bye
	@11
	EXIT

	
	CHAIN IF ~~ THEN AC#W4WFY not_done_job
	@12
	EXIT

CHAIN IF ~True()~ THEN AC#W4WFY hello_1
@13
END
IF~Global("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @2 EXTERN AC#W4WFY who_are_you
IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @4 EXTERN AC#W4WFY bye
IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @4 + bye_before_quest
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

CHAIN AC#W4WFY search_nalfeshnee
@14
END
IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @15 EXTERN AC#W4WFY bye
IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @15 + bye_before_quest

CHAIN AC#W4WFY who_are_you
@16
= @17
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @18
== AC#W4WFY IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ @19
== AC#W4WFY @20
== AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @21
== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @22
== KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @23
== AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @24
== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @25
END
IF~~THEN REPLY @26 EXTERN AC#W4WFY arrogant
IF~~THEN REPLY @27 EXTERN AC#W4WFY arrogant
IF~~THEN REPLY @28 EXTERN AC#W4WFY what_do_you_do
IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @4 EXTERN AC#W4WFY bye
IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @4 + bye_before_quest

	CHAIN AC#W4WFY arrogant
	@29
	END
	IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @4 EXTERN AC#W4WFY bye
	IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @4 + bye_before_quest

	CHAIN AC#W4WFY what_do_you_do
	@30
	END
	IF~GlobalGT("AC#W_Feyri_quest","GLOBAL",0)~THEN REPLY @4 EXTERN AC#W4WFY bye
	IF ~Global("AC#W_Feyri_quest","GLOBAL",0)~ THEN REPLY @4 + bye_before_quest
	
CHAIN AC#W4WFY bye_before_quest
@31
END
IF~~THEN REPLY @32 EXTERN AC#W4WFY not_my_problem
IF~~THEN REPLY @33 EXTERN AC#W4WFY mighty_feyri
IF~~THEN REPLY @34 EXTERN AC#W4WFY feyri_quest_01

	CHAIN AC#W4WFY mighty_feyri
	@35
	END
	IF~~THEN EXTERN AC#W4WFY feyri_quest_01
	
	CHAIN AC#W4WFY feyri_quest_01
	@36
	END
	IF~PartyHasItem("AC#WDLAR")~THEN REPLY @37 EXTERN AC#W4WFY already_have_insignia
	IF~~THEN REPLY @32 EXTERN AC#W4WFY not_my_problem
	IF~~THEN REPLY @38 EXTERN AC#W4WFY what_is_maurezhi
	IF~~THEN REPLY @39 EXTERN AC#W4WFY what_is_insignia
	IF~~THEN REPLY @40 EXTERN AC#W4WFY feyri_quest_03
	
		CHAIN AC#W4WFY already_have_insignia
		@41
		END
		IF~~THEN DO ~TakePartyItem("AC#WDLAR")~ EXTERN AC#W4WFY already_have_insignia_02
	
		CHAIN AC#W4WFY already_have_insignia_02
		@42
		END
		IF~~THEN DO ~GiveItemCreate("AC#WFEYR",LastTalkedToBy,1,0,0)
		SetGlobal("AC#W_Feyri_quest","GLOBAL",10)
		EraseJournalEntry(@460010)
		EraseJournalEntry(@460011)
		AddJournalEntry(@460012,QUEST_DONE)~ EXTERN AC#W4WFY yes_have_insignia_bye
		
		CHAIN AC#W4WFY what_is_insignia
		@43
		END
		IF~~THEN REPLY @32 EXTERN AC#W4WFY not_my_problem
		IF~~THEN REPLY @38 EXTERN AC#W4WFY what_is_maurezhi
		IF~~THEN REPLY @40 EXTERN AC#W4WFY feyri_quest_03
		
		CHAIN AC#W4WFY what_is_maurezhi
		@44
		END
		IF~~THEN REPLY @39 EXTERN AC#W4WFY what_is_insignia
		IF~~THEN REPLY @32 EXTERN AC#W4WFY not_my_problem
		IF~~THEN REPLY @40 EXTERN AC#W4WFY feyri_quest_03
		
			CHAIN AC#W4WFY feyri_quest_03
			@45
			==KorganJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @46
			==AC#W4WFY IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @47
			==KorganJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @48
			END
			IF~PartyHasItem("AC#WDLAR")~THEN REPLY @37 EXTERN AC#W4WFY already_have_insignia
			IF~~THEN REPLY @49 DO ~SetGlobal("AC#W_Feyri_quest","GLOBAL",30)~ EXTERN AC#W4WFY bye
			IF~~THEN REPLY @50 EXTERN AC#W4WFY know_more_about_amulet
			IF~~THEN REPLY @51 EXTERN AC#W4WFY feyri_quest_accept
			
			CHAIN AC#W4WFY know_more_about_amulet
			@52
			END
			IF~PartyHasItem("AC#WDLAR")~THEN REPLY @37 EXTERN AC#W4WFY already_have_insignia
			IF~~THEN REPLY @53 DO ~SetGlobal("AC#W_Feyri_quest","GLOBAL",30)~ EXTERN AC#W4WFY bye
			IF~~THEN REPLY @54 EXTERN AC#W4WFY feyri_quest_accept
			
			CHAIN AC#W4WFY feyri_quest_accept
			@55
			END
			IF~PartyHasItem("AC#WDLAR")~THEN REPLY @37 EXTERN AC#W4WFY already_have_insignia
			IF~~THEN REPLY @49 DO ~SetGlobal("AC#W_Feyri_quest","GLOBAL",30)~ EXTERN AC#W4WFY bye
			IF~~THEN REPLY @56 DO ~SetGlobal("AC#W_Feyri_quest","GLOBAL",1)
			AddJournalEntry(@460010,QUEST)~ EXTERN AC#W4WFY feyri_quest_accept_finish
			
			CHAIN AC#W4WFY feyri_quest_accept_finish
			@57
			END
			IF~~THEN REPLY @58 EXTERN AC#W4WFY messenger
			IF~~THEN REPLY @59 EXTERN AC#W4WFY messenger
			IF~~THEN REPLY @60 EXTERN AC#W4WFY bye
			
			CHAIN AC#W4WFY messenger
			@61
			END
			IF~~THEN REPLY @62 EXTERN AC#W4WFY bye
		
		CHAIN AC#W4WFY not_my_problem
		@63
		END
		IF~~THEN REPLY @64 DO ~SetGlobal("AC#W_Feyri_quest","GLOBAL",30)~ EXTERN AC#W4WFY bye
		IF~~THEN REPLY @65 EXTERN AC#W4WFY bye_before_quest

CHAIN IF ~~ THEN AC#W4WFY bye
@66
EXIT
	
	



// Maldrak (Inn keeper)
BEGIN ~AC#W4WBK~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W4WBK hello_0
@67
END
IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
IF~~THEN REPLY @69 EXTERN AC#W4WBK about_tavern
IF~~THEN REPLY @70 EXTERN AC#W4WBK weeping_goddess
IF~~THEN REPLY @71 EXTERN AC#W4WBK bye
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

CHAIN IF ~True()~ THEN AC#W4WBK hello_1
@13
END
IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
IF~~THEN REPLY @69 EXTERN AC#W4WBK about_tavern
IF~~THEN REPLY @70 EXTERN AC#W4WBK weeping_goddess
IF~~THEN REPLY @71 EXTERN AC#W4WBK bye
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

	CHAIN IF ~~ THEN AC#W4WBK weeping_goddess
	@72
	END
	IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
	IF~~THEN REPLY @73 EXTERN AC#W4WBK weeping_goddess_02
	IF~~THEN REPLY @71 EXTERN AC#W4WBK bye
	IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee
	
		CHAIN IF ~~ THEN AC#W4WBK weeping_goddess_02
		@74
		END
		IF~~THEN REPLY @75 EXTERN AC#W4WBK weeping_goddess_03
		IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
		IF~~THEN REPLY @71 EXTERN AC#W4WBK bye
		IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee
		
			CHAIN IF ~~ THEN AC#W4WBK weeping_goddess_03
			@76
			= @77
			== KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @117
			== JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @118
			== ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @119
			== AC#W4WBK @78
			= @79
			END
			IF~~THEN REPLY @80 EXTERN AC#W4WBK drink
			IF~~THEN REPLY @71 EXTERN AC#W4WBK bye
			IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @5 + search_nalfeshnee

CHAIN AC#W4WBK search_nalfeshnee
@81
END
IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
IF~~THEN REPLY @69 EXTERN AC#W4WBK about_tavern
IF~~THEN REPLY @71 EXTERN AC#W4WBK bye

CHAIN AC#W4WBK about_tavern
@82
END
IF~~THEN REPLY @68 EXTERN AC#W4WBK drink
IF~~THEN REPLY @71 EXTERN AC#W4WBK bye


CHAIN AC#W4WBK drink
@83
DO ~StartStore("AC#W4WBK",LastTalkedToBy())~ EXIT


	CHAIN IF ~~ THEN AC#W4WBK bye
	@84
	EXIT

// Dialogue of two Dretches in the tavern
	
BEGIN ~AC#DRETV~ //Dretch#1

BEGIN ~AC#DRETW~ // Dretch#2

CHAIN IF ~RandomNum(2,1)~ THEN AC#DRETW dretchtalk_01
@85
== AC#DRETV @86
== AC#DRETW @87
== AC#DRETV @88 
== AC#DRETW @89
== AC#DRETV @90
EXIT	

CHAIN IF ~RandomNum(2,2)~ THEN AC#DRETW dretchtalk_02
@91
== AC#DRETV @92
== AC#DRETW @93
== AC#DRETV @94 
EXIT	

CHAIN IF ~RandomNum(2,1)~ THEN AC#DRETV dretchtalk_03
@95
== AC#DRETW @96
== AC#DRETV @97 
EXIT	

CHAIN IF ~RandomNum(2,2)~ THEN AC#DRETV dretchtalk_04
@98
== AC#DRETW @99
== AC#DRETV @100 
EXIT	


