/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W71, test of lust chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/

BEGIN ~AC#W72FW~ // Gluttony demon
		
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W72FW hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W72FW nope_01
IF~~THEN REPLY @2 EXTERN AC#W72FW fight
IF~~THEN REPLY @3 EXTERN AC#W72FW nope_01

	CHAIN AC#W72FW nope_01
	@4
	END
	IF~~THEN REPLY @1 EXTERN AC#W72FW nope_02
	IF~~THEN REPLY @2 EXTERN AC#W72FW fight
	IF~~THEN REPLY @3 EXTERN AC#W72FW nope_02
	
		CHAIN AC#W72FW nope_02
		@5
		END
		IF~~THEN REPLY @6 EXTERN AC#W72FW fight
		IF~~THEN REPLY @8 EXTERN AC#W72FW fight
		IF~~THEN REPLY @10 EXTERN AC#W72FW fight
		IF~~THEN REPLY @9 EXTERN AC#W72FW fight
		
		CHAIN AC#W72FW fight
		@7
		DO ~SetGlobal("FeastFight","AC#W72",1)
		Enemy()~ EXIT


	
	
	


