/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W4S, Gildaar questline; area of Succubus with her baby
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W4SSU~

// initial dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W4SSU hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W4SSU give_baby
	
	CHAIN AC#W4SSU give_baby
	@2
	END
	IF~~THEN REPLY @3 EXTERN AC#W4SSU reasons
	IF~~THEN REPLY @4 EXTERN AC#W4SSU mefisto_wants_child
	
		CHAIN AC#W4SSU mefisto_wants_child
		@5
		END
		IF~~THEN REPLY @6 EXTERN AC#W4SSU attack
		IF~~THEN REPLY @9 EXTERN AC#W4SSU attack
		IF~~THEN REPLY @10 EXTERN AC#W4SSU attack
	
	CHAIN AC#W4SSU reasons
	@7
	END
	IF~~THEN REPLY @6 EXTERN AC#W4SSU attack
	IF~~THEN REPLY @9 EXTERN AC#W4SSU attack
	IF~~THEN REPLY @10 EXTERN AC#W4SSU attack
	
	
	CHAIN AC#W4SSU attack
	@8
	DO ~Enemy()~ EXIT



