/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialoge in der Planaren Gilde
***********************************************************************************************************************************************
**********************************************************************************************************************************************/
// merchant
BEGIN ~AC#WPGSP~

CHAIN IF ~True()~ THEN AC#WPGSP hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#WPGSP buy_something
IF~~THEN REPLY @2 EXTERN AC#WPGSP bye

	CHAIN AC#WPGSP buy_something
	@3
	DO ~StartStore("AC#WPGSP",LastTalkedToBy())~ EXIT

	CHAIN AC#WPGSP bye
	@4
	EXIT 
	
// inn
BEGIN ~AC#WPGIN~

CHAIN IF ~Global("Steal","AC#W48",1)~ THEN AC#WPGIN stealing_fight
	@5
	DO ~SetGlobal("Steal","AC#W48",2)
	Enemy()~ EXIT
	
CHAIN IF ~Global("Steal_Warning","AC#W48",1)~ THEN AC#WPGIN stealing_warning
	@6
	DO ~SetGlobal("Steal_Warning","AC#W48",2)~ EXIT
	
CHAIN IF ~True()~ THEN AC#WPGIN hello_0
@7
END
IF~~THEN REPLY @8 EXTERN AC#WPGIN need_rest
IF~~THEN REPLY @9 EXTERN AC#WPGIN bye

	CHAIN AC#WPGIN need_rest
	@10
	DO ~StartStore("AC#WPGIN",LastTalkedToBy())~ EXIT

	CHAIN AC#WPGIN bye
	@4
	EXIT 

// healer
BEGIN ~AC#WPGHL~

IF ~True()~ THEN BEGIN 0
   SAY @11
   IF ~~ THEN REPLY @12 GOTO 1
   IF ~~ THEN REPLY @13 GOTO 2
END

IF ~~ THEN BEGIN 1
   SAY @14
   IF ~~ THEN DO ~StartStore("AC#WPGHL",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 2
   SAY @15
   IF ~~ THEN REPLY @16 GOTO 1
   IF ~~ THEN REPLY @17 GOTO bye
END

	IF ~~ THEN BEGIN bye
	SAY @18
	IF ~~ THEN EXIT 
	END

BEGIN ~AC#WPGCH~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @19
   IF ~~ THEN REPLY @20 GOTO 1
   IF ~~ THEN REPLY @21 GOTO 3
END 

IF ~True()~ THEN BEGIN hello_again
   SAY @22
      IF ~~ THEN REPLY @23 GOTO 5
      IF ~~ THEN REPLY @24 GOTO 6
      IF ~~ THEN REPLY @25 GOTO 7
      IF ~~ THEN REPLY @26 GOTO questions
	  IF~~THEN REPLY @27 EXTERN AC#WPGCH bye
END

	IF ~~ THEN BEGIN 1
	   SAY @28
	   IF ~~ THEN GOTO 3
	END

	IF ~~ THEN BEGIN 3
		  SAY @29
		  IF ~~ THEN REPLY @30 GOTO 5
		  IF ~~ THEN REPLY @24 GOTO 6
		  IF ~~ THEN REPLY @25 GOTO 7
		  IF ~~ THEN REPLY @26 GOTO questions
		  IF~~THEN REPLY @27 EXTERN AC#WPGCH bye
	END

	IF ~~ THEN BEGIN 5
		  SAY @31
		  IF ~~ THEN REPLY @24 GOTO 6
		  IF ~~ THEN REPLY @32 GOTO 7
		  IF ~~ THEN REPLY @33 GOTO questions
		  IF~~THEN REPLY @34 EXTERN AC#WPGCH bye
	END

	IF ~~ THEN BEGIN 6
	   SAY @35
		  IF ~~ THEN REPLY @36 GOTO 5
		  IF ~~ THEN REPLY @32 GOTO 7
		  IF ~~ THEN REPLY @33 GOTO questions
		  IF~~THEN REPLY @34 EXTERN AC#WPGCH bye
	END

	IF ~~ THEN BEGIN 7
	   SAY @37
		  IF ~~ THEN REPLY @36 GOTO 5
		  IF ~~ THEN REPLY @24 GOTO 6
		  IF ~~ THEN REPLY @33 GOTO questions
		  IF~~THEN REPLY @34 EXTERN AC#WPGCH bye
	END

CHAIN IF ~~ THEN AC#WPGCH questions
@38
END
IF~~THEN REPLY @39 EXTERN AC#WPGCH about_planar_guild
IF~~THEN REPLY @40 EXTERN AC#WPGCH how_long_exists_planar_guild
IF~~THEN REPLY @41 EXTERN AC#WPGCH door_abyss
IF~~THEN REPLY @42 EXTERN AC#WPGCH about_infinite_staircase
IF~~THEN REPLY @43 EXTERN AC#WPGCH bye

	CHAIN IF ~~ THEN AC#WPGCH about_planar_guild
	@44
	=
	@45
	=
	@46
	=
	@47
	END
	IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
	IF~~THEN REPLY @43 EXTERN AC#WPGCH bye
	
	CHAIN IF ~~ THEN AC#WPGCH how_long_exists_planar_guild
	@49
	=
	@50
	=
	@51
	=
	@52
	END
	IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
	IF~~THEN REPLY @43 EXTERN AC#WPGCH bye
	
	CHAIN IF ~~ THEN AC#WPGCH door_abyss
	@53
	=
	@54
	END
	IF ~~ THEN REPLY @55 EXTERN AC#WPGCH no_choice_abyss
	IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
	IF~~THEN REPLY @43 EXTERN AC#WPGCH bye
	
		CHAIN IF ~~ THEN AC#WPGCH no_choice_abyss
		@56
		=
		@57
		=
		@58
		END
		IF ~~ THEN REPLY @59 EXTERN AC#WPGCH corrupt_spells
		IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
		IF~~THEN REPLY @43 EXTERN AC#WPGCH bye
		
			CHAIN IF ~~ THEN AC#WPGCH corrupt_spells
			@60
			END
			IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
			IF~~THEN REPLY @43 EXTERN AC#WPGCH bye

	CHAIN IF ~~ THEN AC#WPGCH about_infinite_staircase
	@61
	=
	@62
	=
	@63
	END
	IF ~~ THEN REPLY @48 EXTERN AC#WPGCH questions
	IF~~THEN REPLY @43 EXTERN AC#WPGCH bye
CHAIN IF ~~ THEN AC#WPGCH bye
@64
EXIT


