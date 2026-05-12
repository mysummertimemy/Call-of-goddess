/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues at the start of the Infinite Staircase AC#W19
****************************************************************************************************************************************************
****************************************************************************************************************************************************/

// Dialogue AC#W19SE, Selunite merchant, at the start of the Infinite Staircase AC#W19

BEGIN ~AC#W19SE~

// start quest: search for Riven
CHAIN IF ~Global("AC#W_SeluniteQuest","GLOBAL",1)~ THEN AC#W19SE hello_quest
@80
END
IF~~THEN REPLY @81 EXTERN AC#W19SE yes_quest
IF~~THEN REPLY @82 EXTERN AC#W19SE no_quest

	CHAIN AC#W19SE no_quest
	@83
	DO ~SetGlobal("AC#W_SeluniteQuest","GLOBAL",20)~ EXIT
	
	CHAIN IF ~~ THEN AC#W19SE yes_quest
	@84
	=
	@85
	END
	IF~~THEN REPLY @86 EXTERN AC#W19SE accept_quest
	IF~PartyHasItem("AC#W30PO")~THEN REPLY @87 DO ~TakePartyItem("AC#W30PO")~ EXTERN AC#W19SE bard_dead
	IF~~THEN REPLY @82 EXTERN AC#W19SE no_quest

	CHAIN AC#W19SE accept_quest
	@88
	DO ~SetGlobal("AC#W_SeluniteQuest","GLOBAL",2)
	AddJournalEntry(@190000,QUEST)~ EXIT
	
	CHAIN IF ~~ THEN AC#W19SE bard_dead
	@89
	=
	@90
	=
	@91
	DO ~SetGlobal("AC#W_SeluniteQuest","GLOBAL",10)
	GiveItemCreate("AC#W19SN",LastTalkedToBy,1,1,1)
	EraseJournalEntry(@190000)
	EraseJournalEntry(@190001)
	AddJournalEntry(@190002,QUEST_DONE)~ EXIT
	
// initial dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W19SE hello_firsttime
@112
END
IF~~THEN REPLY @93 EXTERN AC#W19SE start_store
IF~~THEN REPLY @94 EXTERN AC#W19SE what_items
IF~~THEN REPLY @95 EXTERN AC#W19SE why_are_you_here
IF~PartyHasItem("AC#W30PO")~THEN REPLY @96 DO ~TakePartyItem("AC#W30PO")~ EXTERN AC#W19SE bard_dead
IF~~THEN REPLY @97 EXTERN AC#W19SE bye

CHAIN IF ~True()~ THEN AC#W19SE hello_0
@92
END
IF~~THEN REPLY @93 EXTERN AC#W19SE start_store
IF~~THEN REPLY @94 EXTERN AC#W19SE what_items
IF~~THEN REPLY @95 EXTERN AC#W19SE why_are_you_here
IF~PartyHasItem("AC#W30PO")~THEN REPLY @96 DO ~TakePartyItem("AC#W30PO")~ EXTERN AC#W19SE bard_dead
IF~~THEN REPLY @97 EXTERN AC#W19SE bye

CHAIN IF ~~ THEN AC#W19SE what_items
@98
END
IF~~THEN REPLY @93 EXTERN AC#W19SE start_store
IF~~THEN REPLY @95 EXTERN AC#W19SE why_are_you_here
IF~~THEN REPLY @99 EXTERN AC#W19SE bye

CHAIN IF ~~ THEN AC#W19SE why_are_you_here
@100
END
IF~~THEN REPLY @101 EXTERN AC#W19SE start_store
IF~~THEN REPLY @102 EXTERN AC#W19SE not_talk_about_abyss
IF~~THEN REPLY @103 EXTERN AC#W19SE yes_talk_about_abyss
IF~~THEN REPLY @99 EXTERN AC#W19SE bye

CHAIN IF ~~ THEN AC#W19SE not_talk_about_abyss
@104
END
IF~~THEN REPLY @93 EXTERN AC#W19SE start_store
IF~~THEN REPLY @94 EXTERN AC#W19SE what_items
IF~~THEN REPLY @105 EXTERN AC#W19SE bye	

CHAIN IF ~~ THEN AC#W19SE yes_talk_about_abyss
@106
= @107 
=@108
END
IF~~THEN REPLY @109 EXTERN AC#W19SE start_store
IF~~THEN REPLY @94 EXTERN AC#W19SE what_items
IF~~THEN REPLY @105 EXTERN AC#W19SE bye			
	
	CHAIN AC#W19SE bye
	@110
	EXIT		
	
	CHAIN AC#W19SE start_store
	@111
	DO ~StartStore("AC#W19SE",LastTalkedToBy)~ EXIT



// the three travelers: Bariaur, Satyr, Elf
BEGIN ~AC#W19E1~

IF ~Global("Talked_to_Adventurers","AC#W19",1)~ THEN BEGIN hello_1
SAY @0
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @1
IF ~~ THEN EXTERN AC#W19E1 chain_01 
END

BEGIN ~AC#W19E2~

IF ~Global("Talked_to_Adventurers","AC#W19",1)~ THEN BEGIN hello_1
SAY @0
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @2
IF ~~ THEN EXTERN AC#W19E1 chain_01 
END

BEGIN ~AC#W19E3~

IF ~Global("Talked_to_Adventurers","AC#W19",1)~ THEN BEGIN hello_1
SAY @0
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @3
IF ~~ THEN EXTERN AC#W19E1 chain_01 
END


CHAIN AC#W19E1 chain_01
@4
==AC#W19E2 @5
==AC#W19E3 @6
==AC#W19E1 @7
END
IF~~THEN REPLY @8 EXTERN AC#W19E1 chain_who_are_you
IF~~THEN REPLY @9 EXTERN AC#W19E1 chain_about_staircase
IF~~THEN REPLY @10 EXTERN AC#W19E1 chain_bye

CHAIN AC#W19E1 chain_who_are_you
@11
==AC#W19E2 @12
==AC#W19E3 @13
==AC#W19E1 @14
END
IF~~THEN REPLY @15 EXTERN AC#W19E1 about_charname
IF~~THEN REPLY @16 EXTERN AC#W19E1 chain_bye_02

	CHAIN AC#W19E1 about_charname
	@17
	END
	IF~~THEN REPLY @18 EXTERN AC#W19E1 to_abyss
	IF~~THEN REPLY @16 EXTERN AC#W19E1 chain_bye_02
	
	CHAIN AC#W19E1 to_abyss
	@19
	==AC#W19E2 @20
	==AC#W19E3 @21
	END
	IF~~THEN REPLY @22 EXTERN AC#W19E1 chain_bye_02
	IF~~THEN REPLY @23 EXTERN AC#W19E1 chain_bye_02

CHAIN AC#W19E1 chain_about_staircase
@24
==AC#W19E2 @25
==AC#W19E3 @26
==AC#W19E1 @27
END
IF~~THEN REPLY @28 EXTERN AC#W19E1 chain_bye_02
IF~~THEN REPLY @29 EXTERN AC#W19E1 chain_bye

CHAIN AC#W19E1 chain_bye_02
@30
DO ~SetGlobal("Talked_to_Adventurers","AC#W19",1)~ EXIT

CHAIN AC#W19E1 chain_bye
@31
DO ~ActionOverride("AC#W19E2",EscapeArea())
ActionOverride("AC#W19E3",EscapeArea())
EscapeArea()
~ EXIT

// Bariaur Startrail
BEGIN ~AC#W30BR~

IF ~GlobalGT("Bariaur","AC#W19",0)~ THEN BEGIN hello_charname
SAY @32
IF ~~ THEN REPLY @33 GOTO drink
IF ~~ THEN REPLY @34 GOTO what_creature
IF ~~ THEN REPLY @35 + what_do_you_do
IF ~~ THEN REPLY @36 + bye_01
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY @37
IF ~~ THEN REPLY @34 GOTO what_creature
IF ~~ THEN REPLY @35 + what_do_you_do
IF ~Global("Bariaur","AC#W19",0)~ THEN REPLY @38 DO ~SetGlobal("Bariaur","AC#W19",1)~ + nice_to_meet_you
IF ~~ THEN REPLY @39 + bye_01
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @40
IF ~~ THEN REPLY @34 GOTO what_creature
IF ~~ THEN REPLY @35 + what_do_you_do
IF ~Global("Bariaur","AC#W19",0)~ THEN REPLY @38 DO ~SetGlobal("Bariaur","AC#W19",1)~ + nice_to_meet_you
IF ~~ THEN REPLY @39 + bye_01
END

	IF ~~ THEN BEGIN what_creature
	SAY @41
	IF ~~ THEN REPLY @35 + what_do_you_do
	IF ~Global("Bariaur","AC#W19",0)~ THEN REPLY @38 DO ~SetGlobal("Bariaur","AC#W19",1)~ + nice_to_meet_you
	IF ~~ THEN REPLY @39 + bye_01
	END
	
	IF ~~ THEN BEGIN what_do_you_do
	SAY @42
	IF ~~ THEN REPLY @34 GOTO what_creature
	IF ~Global("Bariaur","AC#W19",0)~ THEN REPLY @38 DO ~SetGlobal("Bariaur","AC#W19",1)~ + nice_to_meet_you
	IF ~~ THEN REPLY @39 + bye_01
	END
	
	IF ~~ THEN BEGIN nice_to_meet_you
	SAY @43
	IF ~~ THEN REPLY @44 GOTO way_abyss
	IF ~~ THEN REPLY @45 + not_telling
	END
		
		IF ~~ THEN BEGIN not_telling
		SAY @46
		IF ~~ THEN GOTO drink_with_me
		END
		
		IF ~~ THEN BEGIN way_abyss
		SAY @47
		IF ~~ THEN GOTO drink_with_me 
		END
		
			IF ~~ THEN BEGIN drink_with_me
			SAY @48
			IF ~~ THEN REPLY @33 GOTO drink
			IF ~~ THEN REPLY @36 + bye_01
			END
			
				IF ~~ THEN BEGIN drink
				SAY @49
				IF ~~ THEN DO ~StartStore("AC#W30BR",LastTalkedToBy())~ EXIT 
				END
	
IF ~~ THEN BEGIN bye_01
SAY @50
IF ~~ THEN EXIT 
END

// Rumors in tavern Startrail

BEGIN ~AC#W30RU~

IF ~RandomNum(5,1)~ THEN BEGIN 1
SAY @51
END

IF ~RandomNum(5,2)~ THEN BEGIN 2
SAY @52
END

IF ~RandomNum(5,3)~ THEN BEGIN 3
SAY @53
END

IF ~RandomNum(5,4)~ THEN BEGIN 4
SAY @54
END

IF ~RandomNum(5,5)~ THEN BEGIN 5
SAY @55
END
BEGIN ~AC#W19LI~

IF ~NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0
  SAY @56 /* #77529 */
  IF ~~ THEN REPLY @57 /* #77530 */ GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @58 /* #77531 */
  IF ~~ THEN REPLY @59 /* #77532 */ GOTO 3
  IF ~~ THEN REPLY @60 /* #77533 */ GOTO 2
  IF ~~ THEN REPLY @61 /* #77534 */ GOTO 6
END

IF ~~ THEN BEGIN 2
  SAY @62 /* #77535 */
  IF ~~ THEN REPLY @59 /* #77532 */ GOTO 3
  IF ~~ THEN REPLY @61 /* #77534 */ GOTO 6
END

IF ~~ THEN BEGIN 3
  SAY @63 /* #77536 */
  IF ~~ THEN REPLY @64 /* #77537 */ GOTO 4
  IF ~~ THEN REPLY @60 /* #77533 */ GOTO 2
  IF ~~ THEN REPLY @61 /* #77534 */ GOTO 6
END

IF ~~ THEN BEGIN 4
  SAY @65 /* #77538 */
  IF ~!IfValidForPartyDialogue("Viconia")
~ THEN REPLY @66 /* #77539 */ GOTO 5
  IF ~IfValidForPartyDialogue("Viconia")
~ THEN REPLY @66 /* #77539 */ EXTERN ~VICONIJ~ VICONIA_SHAR
  IF ~~ THEN REPLY @61 /* #77534 */ GOTO 6
END

IF ~~ THEN BEGIN 5
  SAY @67 /* #77540 */
  IF ~~ THEN REPLY @61 /* #77534 */ GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @68 /* #77541 */
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @69 /* #77542 */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8
  SAY @70 /* #77543 */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @71 /* #77544 */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @72 /* #77545 */
  IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(4)
PlaySound("PORTAL2")
DestroySelf()
~ EXIT
END

IF ~~ THEN BEGIN 11
  SAY @73 /* #77546 */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 12
  SAY @74 /* #77547 */
  IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(4)
PlaySound("PORTAL2")
DestroySelf()
~ EXIT
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN VICONIA_SHAR
  SAY @75 /* #77569 */
  IF ~~ THEN EXTERN ~AC#W19LI~ 11
END
END
