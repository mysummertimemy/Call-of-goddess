/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Blood war area
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
// Dialogue with Cornugon general
BEGIN ~AC#W60CG~

IF ~True()~ THEN BEGIN 01
   SAY @0 
   =
   @47
   IF ~~ THEN DO ~Enemy()~ EXIT
END

// Dialogue with green Abishai
BEGIN ~AC#W60A2~

IF ~True()~ THEN BEGIN hello
   SAY @46
   IF ~~ THEN EXIT
END

// Dialogue Aphul, Abishai spy
BEGIN ~AC#W60A1~

CHAIN IF ~Global("Aphul_contact","AC#W60",1)~ THEN AC#W60A1 hello_again
@1
END
IF~PartyHasItem("AC#W61KY")~THEN REPLY @2 EXTERN AC#W60A1 yes_have_key
IF~~THEN REPLY @3 EXTERN AC#W60A1 attack
IF~~THEN REPLY @4 EXTERN AC#W60A1 not_have_key


	CHAIN AC#W60A1 not_have_key
	@5
	EXIT
	
	CHAIN AC#W60A1 yes_have_key
	@6
	DO ~TakePartyItem("AC#W61KY")
	EraseJournalEntry(@600000)
	AddJournalEntry(@600001,QUEST_DONE)
	SetGlobal("AC#W_Aphul_Samora","GLOBAL",1)
	SetGlobal("Aphul_contact","AC#W60",10)
	EscapeArea()~ EXIT
	
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W60A1 hello_0
@7
END
IF~~THEN REPLY @8 EXTERN AC#W60A1 met_staircase
IF~~THEN REPLY @9 EXTERN AC#W60A1 attack
IF~~THEN REPLY @10 EXTERN AC#W60A1 met_staircase
IF~~THEN REPLY @11 EXTERN AC#W60A1 what_do_you_want
	
	CHAIN AC#W60A1 met_staircase
	@12
	END
	IF~~THEN REPLY @13 EXTERN AC#W60A1 did_not_succeed
	IF~~THEN REPLY @14 EXTERN AC#W60A1 attack
	IF~~THEN REPLY @11 EXTERN AC#W60A1 what_do_you_want
	
	CHAIN AC#W60A1 did_not_succeed
	@15
	END
	IF~~THEN REPLY @14 EXTERN AC#W60A1 attack
	IF~~THEN REPLY @11 EXTERN AC#W60A1 what_do_you_want
	
	CHAIN AC#W60A1 what_do_you_want
	@16
	END
	IF~~THEN REPLY @17 EXTERN AC#W60A1 attack
	IF~~THEN REPLY @18 EXTERN AC#W60A1 forget_about_it
	IF~~THEN REPLY @19 EXTERN AC#W60A1 what_do_i_get
	
	CHAIN AC#W60A1 what_do_i_get
	@20
	END
	IF~~THEN REPLY @17 EXTERN AC#W60A1 attack
	IF~~THEN REPLY @21 EXTERN AC#W60A1 agree
	IF~~THEN REPLY @18 EXTERN AC#W60A1 forget_about_it
	
	
	
	CHAIN AC#W60A1 agree
	@22
	DO ~SetGlobal("Aphul_contact","AC#W60",1)
	AddJournalEntry(@600000,QUEST)~ EXIT
	
	CHAIN AC#W60A1 forget_about_it
	@23
	DO ~SetGlobal("Aphul_contact","AC#W60",10)
	EscapeArea()~ EXIT
	
	CHAIN AC#W60A1 attack
	@24
	DO ~SetGlobal("Abishai_attack","AC#W60",1)
	EraseJournalEntry(@600000)
	EraseJournalEntry(@600001)
	Enemy()~ EXIT

/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Blood war antechamber (AC#W61; PCs being summoned via Samora)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W61CA~

IF ~Global("GimmeHead","AC#W61",1)~ THEN BEGIN hello_head
SAY @25
IF ~~ THEN DO ~SetGlobal("GimmeHead","AC#W61",10)
Enemy()~ EXIT 
END

IF ~GlobalGT("ClosePortal","AC#W61",0)~ THEN BEGIN hello_again
SAY @26
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 01
   SAY @27 
   IF ~~ THEN REPLY @28 + whats_up
END

	IF ~~ THEN BEGIN whats_up
	SAY @29
	IF ~~ THEN REPLY @30 GOTO how_recon_general
	IF ~~ THEN REPLY @34 GOTO lets_go
	END

		IF ~~ THEN BEGIN how_recon_general
		SAY @31
		IF ~~ THEN REPLY @32 GOTO tactic
		IF ~~ THEN REPLY @34 GOTO lets_go
		END
		
			IF ~~ THEN BEGIN tactic
			SAY @33
			IF ~~ THEN REPLY @34 GOTO lets_go
			END
			
				IF ~~ THEN BEGIN lets_go
				SAY @35
				IF ~~ THEN REPLY @36 GOTO seriously_01
				IF ~~ THEN REPLY @40 GOTO to_battle
				END
				
					IF ~~ THEN BEGIN seriously_01
					SAY @37
					IF ~~ THEN REPLY @38 GOTO better_not_know 
					IF ~~ THEN REPLY @39 + back_samora
					IF ~~ THEN REPLY @40 GOTO to_battle
					END
					
							IF ~~ THEN BEGIN back_samora
							SAY @41
							IF ~~ THEN REPLY @38 GOTO better_not_know 
							IF ~~ THEN REPLY @40 GOTO to_battle
							END
					
						IF ~~ THEN BEGIN better_not_know
						SAY @42
						IF ~~ THEN REPLY @43 GOTO how_get_back_again	
						IF ~~ THEN REPLY @40 GOTO to_battle						
						END
						
							IF ~~ THEN BEGIN how_get_back_again
							SAY @44
							IF ~~ THEN REPLY @40 GOTO to_battle
							END
							
								IF ~~ THEN BEGIN to_battle
								SAY @45
								IF ~~ THEN DO ~SetGlobal("ClosePortal","AC#W61",1)~ EXIT 
								END


