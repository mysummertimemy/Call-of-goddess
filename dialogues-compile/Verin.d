/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialog Verins in AC#W90:
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W#VE1~

IF ~True()~ THEN BEGIN 0
   SAY @0
	=
	@21
   IF ~~ THEN REPLY @1 + who_are_you
   IF ~~ THEN REPLY @2 + why_fail
   IF ~~ THEN REPLY @3 + why_fail
   IF ~~ THEN REPLY @4 + go_away
END

	IF ~~ THEN BEGIN go_away
	SAY @5
	IF ~~ THEN REPLY @6 GOTO whos_best 
	END
	
		IF ~~ THEN BEGIN whos_best
		SAY @7
		IF ~~ THEN GOTO fight
		END
	
	IF ~~ THEN BEGIN why_fail
	SAY @8
	IF ~~ THEN REPLY @9 + where_waukeen
	IF ~~ THEN REPLY @10 GOTO you_fiend 
	IF ~~ THEN REPLY @11 + fight
	IF ~~ THEN REPLY @12 + fight
	END

	IF ~~ THEN BEGIN who_are_you
	SAY @13
	IF ~GlobalGT("AC#W_Verin_dispute","GLOBAL",0)~ THEN GOTO who_are_you_02
	IF ~Global("AC#W_Verin_dispute","GLOBAL",0)~ THEN GOTO who_are_you_dont_know
	END
	
	IF ~~ THEN BEGIN who_are_you_dont_know
	SAY @14
	IF ~~ THEN REPLY @9 + where_waukeen
	IF ~~ THEN REPLY @10 GOTO you_fiend 
	IF ~~ THEN REPLY @11 + fight
	IF ~~ THEN REPLY @12 + fight
	END
	
	IF ~~ THEN BEGIN who_are_you_02
	SAY @15
	IF ~~ THEN REPLY @9 + where_waukeen
	IF ~~ THEN REPLY @10 GOTO you_fiend 
	IF ~~ THEN REPLY @11 + fight
	IF ~~ THEN REPLY @12 + fight
	END
	
		IF ~~ THEN BEGIN where_waukeen
		SAY @16
		IF ~~ THEN GOTO give_up
		END
		
		IF ~~ THEN BEGIN give_up
		SAY @17
		IF ~~ THEN REPLY @10 GOTO you_fiend 
		IF ~~ THEN REPLY @11 + fight
		END
		
			IF ~~ THEN BEGIN you_fiend
			SAY @18
			IF ~~ THEN REPLY @19 GOTO fight
			END

IF ~~ THEN BEGIN fight
   SAY @20
   IF ~~ THEN DO ~EraseJournalEntry(@400300)
   AddJournalEntry(@400301,QUEST_DONE)
   SetGlobal("AC#W_VerinFight","GLOBAL",1)
   Enemy()~ EXIT
END


