/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W4B, abyssal blacksmith area
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W4BSM~

// initial dialogue
CHAIN IF ~True()~ THEN AC#W4BSM hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W4BSM smithy_store
IF~~THEN REPLY @2 EXTERN AC#W4BSM what_are_you
IF~~THEN REPLY @3 EXTERN AC#W4BSM what_are_you_02
IF~~THEN REPLY @4 EXTERN AC#W4BSM axe_not_hammer
IF~~THEN REPLY @5 EXTERN AC#W4BSM bye

	CHAIN IF ~~ THEN AC#W4BSM what_are_you
	@6
	END
	IF~~THEN REPLY @1 EXTERN AC#W4BSM smithy_store
	IF~~THEN REPLY @7 EXTERN AC#W4BSM what_are_you_02
	IF~~THEN REPLY @4 EXTERN AC#W4BSM axe_not_hammer
	IF~~THEN REPLY @5 EXTERN AC#W4BSM bye

		CHAIN IF ~~ THEN AC#W4BSM what_are_you_02
		@8
		END
		IF~~THEN REPLY @1 EXTERN AC#W4BSM smithy_store
		IF~~THEN REPLY @9 EXTERN AC#W4BSM about_grazzt
		IF~~THEN REPLY @4 EXTERN AC#W4BSM axe_not_hammer
		IF~~THEN REPLY @5 EXTERN AC#W4BSM bye

			CHAIN IF ~~ THEN AC#W4BSM about_grazzt
			@10
			END
			IF~~THEN REPLY @1 EXTERN AC#W4BSM smithy_store
			IF~~THEN REPLY @4 EXTERN AC#W4BSM axe_not_hammer
			IF~~THEN REPLY @5 EXTERN AC#W4BSM bye	

			CHAIN IF ~~ THEN AC#W4BSM axe_not_hammer
			@11
			END
			IF~~THEN REPLY @1 EXTERN AC#W4BSM smithy_store
			IF~~THEN REPLY @2 EXTERN AC#W4BSM what_are_you
			IF~~THEN REPLY @3 EXTERN AC#W4BSM what_are_you_02
			IF~~THEN REPLY @5 EXTERN AC#W4BSM bye			
	
	CHAIN AC#W4BSM bye
	@12
	EXIT		
	
	CHAIN AC#W4BSM smithy_store
	@13
	DO ~StartStore("AC#W4BSM",LastTalkedToBy)~ EXIT
	
BEGIN ~AC#W4BBS~

IF ~RandomNum(5,1)~ THEN BEGIN 1
SAY @14
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,2)~ THEN BEGIN 2
SAY @15
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,3)~ THEN BEGIN 3
SAY @16
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,4)~ THEN BEGIN 4
SAY @17
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,5)~ THEN BEGIN 5
SAY @18
IF ~~ THEN EXIT 
END	



