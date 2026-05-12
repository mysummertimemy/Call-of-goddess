/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Dialog mit Kyriani #2 im Haus des Mondes
**************************************************************************************************************************************************
**************************************************************************************************************************************************/

BEGIN ~AC#W#KY2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 16
   SAY @0
   IF ~~ THEN EXTERN ~ACMOONK1~ 1
END

IF ~~ THEN BEGIN 17
   SAY @1
   IF ~~ THEN DO ~SetGlobal("Sojourner_Portal","AC#W12",1)
   AddJournalEntry(@100031,QUEST)~ EXIT
END

IF ~Global("Sojourner_Portal","AC#W12",1)
Global("ReadytoGo","AC#W12",0)~ THEN BEGIN 18
   SAY @2
   IF ~~ THEN REPLY @3 GOTO 20
   IF ~~ THEN REPLY @4 GOTO 19
   IF ~~ THEN REPLY @5 GOTO rest_temple
   IF ~~ THEN REPLY @6 GOTO about_staircase
   IF ~~ THEN REPLY @7 GOTO look_waterdeep
END

	IF ~~ THEN BEGIN about_staircase
	SAY @8
	IF ~~ THEN REPLY @9 GOTO 20
	IF ~~ THEN REPLY @10 GOTO 19
	END
	
	IF ~~ THEN BEGIN look_waterdeep
	SAY @11
	IF ~~ THEN REPLY @9 GOTO 20
	IF ~~ THEN REPLY @10 GOTO 19
	END
	
	IF ~~ THEN BEGIN rest_temple
	SAY @12
	IF ~~ THEN REPLY @9 GOTO 20
	IF ~~ THEN REPLY @13 GOTO 19
	END

IF ~~ THEN BEGIN 19
   SAY @14
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
   SAY @15 IF ~~ THEN DO ~SetGlobal("ReadytoGo","AC#W12",1)
   MoveToPointNoInterrupt([738.359])
   Face(5)~ EXIT
END

IF ~Global("ReadytoGo","AC#W12",1)~ THEN BEGIN 21
   SAY @16
   =
   @17
   IF ~~ THEN GOTO 23
END

IF ~~ THEN BEGIN 23
   SAY @18
   IF ~~ THEN REPLY @19 GOTO 24
   IF ~~ THEN REPLY @20 GOTO 24
   IF ~~ THEN REPLY @21 GOTO about_staircase_02
END

	IF ~~ THEN BEGIN about_staircase_02
	SAY @8
	IF ~~ THEN GOTO 24
	END

IF ~~ THEN BEGIN 24
   SAY @22
   =
   @23
   IF ~~ THEN DO ~SetGlobal("ReadytoGo","AC#W12",2)
   SetGlobal("Sojourner_Portal","AC#W12",2)~ EXIT
END

IF ~True()~ THEN BEGIN good_luck
SAY @24
IF ~~ THEN EXIT
END

/*************************************************************************************************************************************************
**************************************************************************************************************************************************
Kleinere Dialoge im Haus des Mondes
**************************************************************************************************************************************************
**************************************************************************************************************************************************/

//Der Wächter an der Tür:

BEGIN ~ACMOONK1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @25
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
   SAY @26
   IF ~~ THEN EXTERN ~AC#W#KY2~ 17
END

IF ~RandomNum(3,1)~THEN BEGIN 2
   SAY @27
   IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~THEN BEGIN 3
   SAY @28
   IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~THEN BEGIN 4
   SAY @29
   IF ~~ THEN EXIT
END

/*****************************************************************************
// Die Wächter im Tempel:
******************************************************************************/

BEGIN ~ACMOONK2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @25
   IF ~~ THEN EXIT
END

IF ~RandomNum(3,1)~THEN BEGIN 1
   SAY @27
   IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~THEN BEGIN 2
   SAY @28
   IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~THEN BEGIN 3
   SAY @29
   IF ~~ THEN EXIT
END

