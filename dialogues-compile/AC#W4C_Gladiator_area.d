/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogue referee Babau in area AC#W4C (Gladiator area)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W4CBB~

IF ~Global("AC#W_Samoras_Arena","GLOBAL",10)~ THEN BEGIN hello_champion
SAY @0
=
@1
=
@2 
IF ~~ THEN EXIT 
END

IF ~Global("Solar","AC#W4C",1)~ THEN BEGIN hello_killed_champion
SAY @3 
=
@4
IF ~~ THEN DO ~SetGlobal("Solar","AC#W4C",10)
SetGlobal("AC#W_Samoras_Arena","GLOBAL",10)
GiveGoldForce(1000)
AddexperienceParty(1000)~ EXIT 
END

IF ~Global("Piscoloth","AC#W4C",10)~ THEN BEGIN hello_before_last_fight
   SAY @5 
  IF ~~ THEN REPLY @6 + who_is_last_fighter
  IF ~~ THEN REPLY @7 + last_fight
  IF ~~ THEN REPLY @8 GOTO no_interest
END

	IF ~~ THEN BEGIN who_is_last_fighter
	SAY @9
	IF ~~ THEN REPLY @7 + last_fight
	IF ~~ THEN REPLY @8 GOTO no_interest
	END

	IF ~~ THEN BEGIN last_fight
	SAY @10
	IF ~~ THEN DO ~SetGlobal("Gladiator_fight_start","AC#W4C",1)
	StartCutSceneMode()
	StartCutScene("AC#W4C_1")~ EXIT 
	END

IF ~Global("Piscoloth","AC#W4C",1)~ THEN BEGIN hello_piscoloth
SAY @11 
IF ~~ THEN DO ~SetGlobal("Piscoloth","AC#W4C",10)~ EXIT 
END

IF ~Global("Deathtyrant","AC#W4C",1)~ THEN BEGIN hello_eyetyrant
SAY @12 
IF ~~ THEN DO ~SetGlobal("Deathtyrant","AC#W4C",10)~ EXIT 
END

IF ~Global("tieflings","AC#W4C",1)~ THEN BEGIN hello_tiefling
SAY @13 
IF ~~ THEN DO ~SetGlobal("tieflings","AC#W4C",10)~ EXIT 
END

IF ~Global("barlgura","AC#W4C",1)~ THEN BEGIN hello_barlgura
SAY @14
IF ~~ THEN DO ~SetGlobal("barlgura","AC#W4C",10)~ EXIT 
END

IF ~Global("Cambion","AC#W4C",1)~ THEN BEGIN hello_cambion
SAY @15
IF ~~ THEN DO ~SetGlobal("Cambion","AC#W4C",10)~ EXIT 
END

IF ~Global("Minotaurs","AC#W4C",1)~ THEN BEGIN hello_minotaurs
SAY @16
IF ~~ THEN DO ~SetGlobal("Minotaurs","AC#W4C",10)~ EXIT 
END

IF ~Global("Dretches","AC#W4C",1)~ THEN BEGIN hello_dretches
SAY @17
IF ~~ THEN DO ~SetGlobal("Dretches","AC#W4C",10)~ EXIT 
END

IF ~Global("Tanarukk","AC#W4C",1)~ THEN BEGIN hello_tanarukk
SAY @18
IF ~~ THEN DO ~SetGlobal("Tanarukk","AC#W4C",10)~ EXIT 
END

IF ~Global("Frostgiant","AC#W4C",1)~ THEN BEGIN hello_frostgiant
SAY @19
IF ~~ THEN DO ~SetGlobal("Frostgiant","AC#W4C",10)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @20 
  IF ~~ THEN REPLY @21 + what_place
  IF ~~ THEN REPLY @22 + fight_01
  IF ~~ THEN REPLY @23 + rules
  IF ~~ THEN REPLY @8 GOTO no_interest
END

	IF ~~ THEN BEGIN what_place
	SAY @24
	IF ~~ THEN REPLY @22 + fight_01
	IF ~~ THEN REPLY @8 GOTO no_interest
	END
	
	IF ~~ THEN BEGIN rules
	SAY @25
	IF ~~ THEN REPLY @21 + what_place
	IF ~~ THEN REPLY @22 + fight_01
	IF ~~ THEN REPLY @8 GOTO no_interest
	END
	
	IF ~~ THEN BEGIN fight_01
	SAY @10
	IF ~~ THEN DO ~SetGlobal("Gladiator_fight_start","AC#W4C",1)
	StartCutSceneMode()
	StartCutScene("AC#W4C_1")~ EXIT 
	END
	
	IF ~~ THEN BEGIN no_interest
	SAY @26
	IF ~~ THEN EXIT 
	END

IF ~True()~ THEN BEGIN hello_again
   SAY @27 
  IF ~~ THEN REPLY @21 + what_place
  IF ~~ THEN REPLY @22 + fight_01
  IF ~~ THEN REPLY @8 GOTO no_interest
END

