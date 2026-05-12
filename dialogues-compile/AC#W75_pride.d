/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W75, test of pride chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W75DV~

// initial dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W75DV hello_0
@0
= @1
= @2
END
IF~~THEN REPLY @3 EXTERN AC#W75DV nope_01
IF~~THEN REPLY @4 EXTERN AC#W75DV admire
IF~~THEN REPLY @5 EXTERN AC#W75DV not_admire
IF~~THEN REPLY @6 EXTERN AC#W75DV not_admire
IF~~THEN REPLY @7 EXTERN AC#W75DV attack
	
	CHAIN AC#W75DV nope_01
	@8
	END
	IF~~THEN REPLY @3 EXTERN AC#W75DV nope_02
	IF~~THEN REPLY @4 EXTERN AC#W75DV admire
	IF~~THEN REPLY @9 EXTERN AC#W75DV attack
	
	CHAIN AC#W75DV admire
	@10
	END
	IF~~THEN REPLY @11 EXTERN AC#W75DV nope_02
	IF~~THEN REPLY @12 EXTERN AC#W75DV admire_02
	IF~~THEN REPLY @13 EXTERN AC#W75DV not_admire
	IF~~THEN REPLY @14 EXTERN AC#W75DV not_admire
	IF~~THEN REPLY @7 EXTERN AC#W75DV attack
	
		CHAIN AC#W75DV admire_02
		@15
		END
		IF~~THEN REPLY @16 EXTERN AC#W75DV nope_02
		IF~~THEN REPLY @17 EXTERN AC#W75DV admire_03
		IF~~THEN REPLY @18 EXTERN AC#W75DV admire_03
		IF~~THEN REPLY @13 EXTERN AC#W75DV not_admire
		IF~~THEN REPLY @19 EXTERN AC#W75DV not_admire
		IF~~THEN REPLY @20 EXTERN AC#W75DV attack
		
			CHAIN AC#W75DV admire_03
			@21
			END
			IF~~THEN REPLY @22 EXTERN AC#W75DV nope_02
			IF~~THEN REPLY @23 EXTERN AC#W75DV admire_04
			IF~~THEN REPLY @7 EXTERN AC#W75DV attack
			
				CHAIN AC#W75DV admire_04
				@24
				END				
				IF~~THEN EXTERN AC#W75DV attack
				
	CHAIN AC#W75DV nope_02
	@25
	END
	IF~~THEN REPLY @3 EXTERN AC#W75DV not_admire
	IF~~THEN REPLY @4 EXTERN AC#W75DV admire
	IF~~THEN REPLY @7 EXTERN AC#W75DV attack
	
	CHAIN AC#W75DV not_admire
	@26
	END				
	IF~~THEN EXTERN AC#W75DV attack
				
	CHAIN AC#W75DV attack
	@27
	DO ~Enemy()~ EXIT



