/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogue Zaehvielle Succubus (Ormad Sulpar Quest)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W4ASU~

IF ~Global("Gave_Contract","AC#W4A",1)~ THEN BEGIN hello_gave_contract
SAY @0
IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @1 
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN hello_again
   SAY @1 
  IF ~~ THEN REPLY @2 + bye
  IF ~Global("AC#W_Ormad_Quest","GLOBAL",3)~ THEN REPLY @3 + about_ormads_soul
END

	IF ~~ THEN BEGIN about_ormads_soul
	SAY @4
	IF ~~ THEN REPLY @5 GOTO give_contract
	IF ~~ THEN REPLY @6 GOTO bye
	IF ~~ THEN REPLY @18 + fight
	END
	
		IF ~~ THEN BEGIN give_contract
		SAY @7
		IF ~~ THEN REPLY @8 GOTO give_contract_02
		IF ~~ THEN REPLY @18 + fight
		IF ~~ THEN REPLY @6 GOTO bye
		END
		
			IF ~~ THEN BEGIN give_contract_02
			SAY @9
			IF ~CheckStatGT(LastTrigger,17,STR)~ THEN REPLY @10 GOTO strength_success
			IF ~CheckStatLT(LastTrigger,18,STR)~ THEN REPLY @10 GOTO strength_failure
			IF ~~ THEN REPLY @18 + fight
			IF ~~ THEN REPLY @6 GOTO bye
			END
			
				IF ~~ THEN BEGIN strength_failure
				SAY @11
				IF ~~ THEN REPLY @6 GOTO bye
				IF ~~ THEN REPLY @18 + fight
				END
				
				IF ~~ THEN BEGIN strength_success
				SAY @12
				IF ~~ THEN REPLY @13 GOTO give_contract_03
				IF ~~ THEN REPLY @18 + fight
				IF ~~ THEN REPLY @6 GOTO bye				
				END
				
					IF ~~ THEN BEGIN give_contract_03
					SAY @14
					IF ~~ THEN DO ~GiveItem("AC#WORM2",LastTalkedToBy)~ GOTO get_off
					END
					
						IF ~~ THEN BEGIN get_off
						SAY @15
						IF ~~ THEN DO ~SetGlobal("Gave_Contract","AC#W4A",1)~ EXIT 
						END

IF ~~ THEN BEGIN bye
SAY @16
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN fight
SAY @17
IF ~~ THEN DO ~Enemy()~ EXIT
END

