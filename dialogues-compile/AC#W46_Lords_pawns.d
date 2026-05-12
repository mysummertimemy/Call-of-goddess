/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W46, Tavern Lord's Pawn, Faylah (Inn keeper)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W#FAY~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W#FAY hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W#FAY drink
IF~~THEN REPLY @2 EXTERN AC#W#FAY why_lords_pawns
IF~~THEN REPLY @3 EXTERN AC#W#FAY bye
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @4 + search_nalfeshnee

CHAIN IF ~True()~ THEN AC#W#FAY hello_1
@5
END
IF~~THEN REPLY @1 EXTERN AC#W#FAY drink
IF~~THEN REPLY @2 EXTERN AC#W#FAY why_lords_pawns
IF~~THEN REPLY @3 EXTERN AC#W#FAY bye
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @4 + search_nalfeshnee

CHAIN AC#W#FAY search_nalfeshnee
@6
END
IF~~THEN REPLY @1 EXTERN AC#W#FAY drink
IF~~THEN REPLY @2 EXTERN AC#W#FAY why_lords_pawns
IF~~THEN REPLY @3 EXTERN AC#W#FAY bye

CHAIN AC#W#FAY why_lords_pawns
@7
END
IF~~THEN REPLY @8 EXTERN AC#W#FAY dark_atmosphere
IF~~THEN REPLY @1 EXTERN AC#W#FAY drink
IF~~THEN REPLY @3 EXTERN AC#W#FAY bye

	CHAIN AC#W#FAY dark_atmosphere
	@9
	END
	IF~~THEN REPLY @1 EXTERN AC#W#FAY drink
	IF~~THEN REPLY @3 EXTERN AC#W#FAY bye

CHAIN AC#W#FAY drink
@10
DO ~StartStore("AC#W#FAY",LastTalkedToBy())~ EXIT


	CHAIN IF ~~ THEN AC#W#FAY bye
	@11
	EXIT
	
	


