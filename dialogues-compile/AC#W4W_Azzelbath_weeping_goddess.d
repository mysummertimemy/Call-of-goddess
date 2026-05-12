/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues Azzelbath, Merrenoloth, in area AC#W4W, tavern "Weeping Goddess"
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WAZEL~

CHAIN IF ~Global("Azzelbath_Steal","AC#W4W",1)~ THEN AC#WAZEL steal_failed
	@0
	DO ~Enemy()
	SetGlobal("Azzelbath_Steal","AC#W4W",10)~ EXIT
	
CHAIN IF ~True()~ THEN AC#WAZEL hello_0
@1
END
IF~Global("AC#WMefisto_helps_Gildaar","GLOBAL",11)
Global("TalkedAboutPrice","LOCALS",0)~THEN REPLY @2 EXTERN AC#WAZEL need_styx_water
IF~Global("AC#WMefisto_helps_Gildaar","GLOBAL",11)
Global("TalkedAboutPrice","LOCALS",1)~THEN REPLY @3 EXTERN AC#WAZEL give_phiole
IF~~THEN REPLY @4 EXTERN AC#WAZEL who_are_you
IF~~THEN REPLY @5 EXTERN AC#WAZEL bye
	
	CHAIN AC#WAZEL who_are_you
	@6
	END
	IF~Global("AC#WMefisto_helps_Gildaar","GLOBAL",11)~THEN REPLY @2 EXTERN AC#WAZEL need_styx_water
	IF~~THEN REPLY @5 EXTERN AC#WAZEL bye
	
	CHAIN AC#WAZEL need_styx_water
	@7
	END
	IF~~THEN REPLY @8 EXTERN AC#WAZEL influence_someone
	
		CHAIN AC#WAZEL influence_someone
		@9
		END
		IF~~THEN REPLY @10 EXTERN AC#WAZEL give_phiole
	
	CHAIN AC#WAZEL give_phiole
	@11
	END
	IF~~THEN REPLY @12 EXTERN AC#WAZEL high_price
	IF ~PartyGoldGT(4999)~ THEN REPLY @13 EXTERN AC#WAZEL give_water_styx
	IF ~PartyGoldLT(5000)~ THEN REPLY @14 + not_enough_gold
	IF ~~ THEN REPLY @15 + not_enough_gold
	
		CHAIN AC#WAZEL high_price
		@16
		END
		IF ~PartyGoldGT(4999)~ THEN REPLY @13 EXTERN AC#WAZEL give_water_styx
		IF ~PartyGoldLT(5000)~ THEN REPLY @14 + not_enough_gold
		IF ~~ THEN REPLY @15 + not_enough_gold
		
		CHAIN AC#WAZEL not_enough_gold
		@17
		DO ~SetGlobal("TalkedAboutPrice","LOCALS",1)~
		EXIT
	
	CHAIN AC#WAZEL bye
	@18
	EXIT
	
	CHAIN AC#WAZEL give_water_styx
	@19
	DO ~TakePartyGold(5000) DestroyGold(5000)
	GiveItem("AC#WSTYX",LastTalkedToBy)
	EraseJournalEntry(@110014)
	AddJournalEntry(@110015,QUEST)
	SetGlobal("AC#WMefisto_helps_Gildaar","GLOBAL",12)~ EXIT



