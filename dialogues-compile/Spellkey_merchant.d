/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues spell key seller in Abyss
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WSPLK~

IF ~True()~ THEN BEGIN 0
   SAY @0 
   IF ~~ THEN REPLY @1 + show_service
   IF ~~ THEN REPLY @2 GOTO no_interest
   IF ~~ THEN REPLY @3 GOTO questions
END

IF ~~ THEN BEGIN show_service
   SAY @4
   IF ~~ THEN DO ~StartStore("AC#WSPLK",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN questions
   SAY @5
   IF ~~ THEN REPLY @6 + what_are_spellkeys
END

	IF ~~ THEN BEGIN what_are_spellkeys
	SAY @7
	IF ~~ THEN REPLY @8 GOTO yes_did_notice
	IF ~~ THEN REPLY @9 GOTO no_did_not_notice
	END
	
			IF ~~ THEN BEGIN yes_did_notice
			SAY @10
			IF ~~ THEN GOTO spell_failure_01
			END
			
			IF ~~ THEN BEGIN no_did_not_notice
			SAY @11
			IF ~~ THEN GOTO spell_failure_01
			END
		
		IF ~~ THEN BEGIN spell_failure_01
		SAY @12
		IF ~Global("UpdateJournal","LOCALS",1)~ THEN GOTO spell_failure_desc
		IF ~Global("UpdateJournal","LOCALS",0)~ THEN DO ~AddJournalEntry(@400501,QUEST) SetGlobal("UpdateJournal","LOCALS",1)~ GOTO spell_failure_desc
		END
		
			IF ~~ THEN BEGIN spell_failure_desc
			SAY @13			
			IF ~~ THEN GOTO spell_failure_desc_02
			IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID) Global("Neera_React_Keys","AC#W40",0)~ THEN EXTERN NEERAJ neera_spellkeys_prime
			END
			
			IF ~~ THEN BEGIN spell_failure_desc_02
			SAY @30
			IF ~~ THEN REPLY @14 GOTO spell_failure_02
			IF ~~ THEN REPLY @15 + why_fail_clerical_spells
			IF ~~ THEN REPLY @16 + why_fail_alteration
			END
			
				IF ~~ THEN BEGIN why_fail_alteration
				SAY @17
				IF ~~ THEN GOTO why_fail_alteration_02
				END
				
					IF ~~ THEN BEGIN why_fail_alteration_02
					SAY @18
					IF ~~ THEN REPLY @19 GOTO except_spellkey
					END
					
						IF ~~ THEN BEGIN except_spellkey
						SAY @20
						IF ~~ THEN REPLY @21 GOTO questions
						IF ~~ THEN REPLY @22 + show_service
						IF ~~ THEN REPLY @23 + whats_wrong
						IF ~~ THEN REPLY @2 GOTO no_interest
						END
			
				IF ~~ THEN BEGIN why_fail_clerical_spells
				SAY @24
				IF ~~ THEN GOTO why_fail_clerical_spells_02
				END
				
					IF ~~ THEN BEGIN why_fail_clerical_spells_02
					SAY @25
					IF ~~ THEN GOTO why_fail_clerical_spells_03
					END
					
						IF ~~ THEN BEGIN why_fail_clerical_spells_03
						SAY @26
						IF ~~ THEN REPLY @21 GOTO questions
						IF ~~ THEN REPLY @22 + show_service
						IF ~~ THEN REPLY @23 + whats_wrong
						IF ~~ THEN REPLY @2 GOTO no_interest
						END
			
				IF ~~ THEN BEGIN spell_failure_02
				SAY @27
				IF ~~ THEN REPLY @22 + show_service
				IF ~~ THEN REPLY @23 + whats_wrong
				IF ~~ THEN REPLY @2 GOTO no_interest
				END
				
					IF ~~ THEN BEGIN whats_wrong
					SAY @28
					IF ~~ THEN REPLY @1 + show_service
					IF ~~ THEN REPLY @2 GOTO no_interest
					END
					
					IF ~~ THEN BEGIN no_interest
					SAY @29
					IF ~~ THEN EXIT
					END

APPEND ~NEERAJ~
IF ~~ THEN BEGIN neera_spellkeys_prime
   SAY @31
   IF ~~ THEN DO ~SetGlobal("Neera_React_Keys","AC#W40",1)~ EXTERN ~AC#WSPLK~ spell_failure_desc_02
END
END
