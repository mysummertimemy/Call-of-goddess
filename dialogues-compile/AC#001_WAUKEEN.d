/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialog bei der Rettung der Göttin
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WAUK1~

IF ~Global("AC_Waukeen_Heal","LOCALS",1)~ THEN BEGIN heal
SAY @0
IF ~~ THEN GOTO go
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @1
=
@2
++ @3 + 1
END

IF ~Global("AC_Waukeen_Free","GLOBAL",1)~ THEN BEGIN gogo
SAY @4
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
SAY @5
=
@6
++ @7 + 2
END

IF ~~ THEN BEGIN 2
SAY @8
++ @9 + reward
++ @10 + go
++ @11 + rest
END

IF ~~ THEN BEGIN reward
SAY @12
++ @13 + go
END

IF ~~ THEN BEGIN rest
SAY @14
IF ~~ THEN DO ~SetGlobal("AC_Waukeen_Heal","LOCALS",1)
StartCutsceneMode()
StartCutscene("AC#W90C4")~
EXIT
END

IF ~~ THEN BEGIN go
SAY @15
IF ~~ THEN DO ~SetGlobal("AC_Waukeen_Heal","LOCALS",2)
SetGlobal("AC_Waukeen_Free","GLOBAL",1)
AddexperienceParty(50000)
AddJournalEntry(@400022,QUEST_DONE)~
EXIT
END
