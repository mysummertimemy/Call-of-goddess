/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W71, test of lust chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W71I1~ //Incubus

BEGIN ~AC#W71S1~ // Succubus

CHAIN IF ~Global("Rested","AC#W71",1)~ THEN AC#W71S1 rested
@0
== AC#W71I1 @1
== AC#W71I1 @2
== AC#W71S1 @3
== AC#W71I1 @4 
== AC#W71S1 @5
		DO ~SetGlobal("Rested","AC#W71",2)
		GiveItem("AC#W71H1",LastTalkedToBy)
		ActionOverride("AC#W71I1",GiveItem("AC#W71H2",LastTalkedToBy))
		AddexperienceParty(2000)
		CreateVisualEffectObject("SPDIMNDR",Myself)
		CreateVisualEffectObject("SPDIMNDR","AC#W71I1")
	Wait(3)
	PlaySound("PORTAL2")
	ActionOverride("AC#W71I1",DestroySelf())
	DestroySelf()~ EXIT
		
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W71S1 hello_0
@6
== AC#W71I1 @7
==AerieJ IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN @8
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @9
==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @10
==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @11
==ViconiJ IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @12
END
IF~~THEN REPLY @13 EXTERN AC#W71S1 nope_01
IF~~THEN REPLY @14 EXTERN AC#W71S1 nope_01
IF~~THEN REPLY @15 EXTERN AC#W71S1 nope_01
IF~~THEN REPLY @16 EXTERN AC#W71S1 fight
IF~~THEN REPLY @17 EXTERN AC#W71S1 fight
IF~~THEN REPLY @18 EXTERN AC#W71S1 yes
IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN AC#W71S1 fight
IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN EXTERN AC#W71S1 fight
IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN EXTERN AC#W71S1 fight
IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID)~ THEN EXTERN AC#W71S1 fight

	CHAIN AC#W71S1 nope_01
	@19
	== AC#W71I1 @20
	END
	IF~~THEN REPLY @13 EXTERN AC#W71S1 nope_02
	IF~~THEN REPLY @21 EXTERN AC#W71S1 nope_02
	IF~~THEN REPLY @22 EXTERN AC#W71S1 fight
	IF~~THEN REPLY @23 EXTERN AC#W71S1 yes
	
		CHAIN AC#W71S1 nope_02
		@24
		== AC#W71I1 @25
		END
		IF~~THEN REPLY @26 EXTERN AC#W71S1 fight
		IF~~THEN REPLY @27 EXTERN AC#W71S1 fight
		IF~~THEN REPLY @18 EXTERN AC#W71S1 yes
		
		CHAIN AC#W71S1 fight
		@28
		== AC#W71I1 @29
		== AC#W71S1 @30
		DO ~ActionOverride("AC#W71I1",Enemy())
		Enemy()~ EXIT

CHAIN IF ~~ THEN AC#W71S1 yes
@31
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("AC#W71C1")~ EXIT

	
	
	


