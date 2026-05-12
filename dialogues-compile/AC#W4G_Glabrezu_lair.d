/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W4G, Glabrezu Lair
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W4GGB~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W4GGB hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W4GGB defeat
IF~~THEN REPLY @2 EXTERN AC#W4GGB wrong_house

CHAIN AC#W4GGB wrong_house
@3
END
IF~~THEN EXTERN AC#W4GGB fight

CHAIN AC#W4GGB defeat
@4
END
IF~~THEN EXTERN AC#W4GGB fight

	CHAIN IF ~~ THEN AC#W4GGB fight
	@5
	DO ~SetGlobal("AC#W_Belthazaar","GLOBAL",2)
	Enemy()~ EXIT
	
	


