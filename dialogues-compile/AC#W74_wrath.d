/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W74, test of wrath chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W74KN~

// Dialogue when scored 10 hits to the player
CHAIN IF ~Global("WrathCheck","AC#W74",1)~ THEN AC#W74KN defend_yourself_01
@0
DO ~SetGlobal("WrathCheck","AC#W74",2)~ EXIT

// Dialogue #2 when scored another 10 hits to the player
CHAIN IF ~Global("WrathCheck","AC#W74",3)~ THEN AC#W74KN defend_yourself_02
@1
DO ~SetGlobal("WrathCheck","AC#W74",4)~ EXIT

// Dialogue #2 when scored another 10 hits to the player
CHAIN IF ~Global("WrathCheck","AC#W74",5)~ THEN AC#W74KN defend_yourself_final
@2
DO ~SetGlobal("WrathCheck","AC#W74",10)
CreateItem("AC#W74S1",0,0,0)
AddexperienceParty(20000)
ReallyForceSpell(Myself,RED_HOLY_MIGHT)
Kill(Myself)~ EXIT

// Dialogue after the first resurrection
CHAIN IF ~Global("WrathSpawn","AC#W74",1)~ THEN AC#W74KN hello_1
@3
DO ~SetGlobal("WrathSpawn","AC#W74",2)~ EXIT

// initial dialogue
CHAIN IF ~Global("WrathSpawn","AC#W74",0)~ THEN AC#W74KN hello_0
@4
END
IF~~THEN REPLY @5 EXTERN AC#W74KN nope_01
IF~~THEN REPLY @6 EXTERN AC#W74KN peace
IF~~THEN REPLY @7 EXTERN AC#W74KN wrath_01
IF~~THEN REPLY @8 EXTERN AC#W74KN attack
	
	CHAIN AC#W74KN nope_01
	@9
	END
	IF~~THEN EXTERN AC#W74KN attack
	
	CHAIN AC#W74KN wrath_01
	@10
	END
	IF~~THEN EXTERN AC#W74KN attack
	
	CHAIN IF ~~ THEN AC#W74KN peace
	@11
	END
	IF~~THEN EXTERN AC#W74KN attack
	
	CHAIN AC#W74KN attack
	@12
	DO ~SetGlobal("WrathSpawn","AC#W74",1)
	Enemy()~ EXIT

// Dialogue after each other resurrection
CHAIN IF ~True()~ THEN AC#W74KN hello_resurrected
@13
EXIT

