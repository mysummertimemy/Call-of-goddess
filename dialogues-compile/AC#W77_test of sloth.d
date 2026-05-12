/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W77, test of sloth chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W77TR~

IF ~RandomNum(4,1)~ THEN BEGIN 1
SAY @0
IF ~~ THEN EXIT 
END

IF ~RandomNum(4,2)~ THEN BEGIN 2
SAY @1
IF ~~ THEN EXIT 
END

IF ~RandomNum(4,3)~ THEN BEGIN 3
SAY @2
IF ~~ THEN EXIT 
END

IF ~RandomNum(4,4)~ THEN BEGIN 4
SAY @3
IF ~~ THEN EXIT 
END

BEGIN ~AC#W77S1~ // Dreamstalker
BEGIN ~AC#W77S2~ // Dreamstalker
BEGIN ~AC#W77S3~ // Dreamstalker
BEGIN ~AC#W77S4~ // Dreamstalker
		
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W77S1 hello_0
@4
== AC#W77S2 @5
== AC#W77S3 @6
== AC#W77S4 @7
== AC#W77S1 @8
DO ~SetGlobal("AC#W_test_sloth","GLOBAL",10)
SetGlobal("JobDone","MYAREA",1)
ActionOverride("AC#W77S2",Enemy())
ActionOverride("AC#W77S3",Enemy())
ActionOverride("AC#W77S4",Enemy())
Enemy()~ EXIT




