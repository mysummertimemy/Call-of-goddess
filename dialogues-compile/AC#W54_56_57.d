/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W54, Acid ponds of Yemach
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WDRBL~ // Tarterian dragon

CHAIN IF ~Global("DragonWarning","AC#W54",10)~ THEN AC#WDRBL no_step_further_02
@34
DO ~Enemy()
AddJournalEntry(@540004,QUEST_DONE)~ EXIT

CHAIN IF ~Global("DragonWarning","AC#W54",1)~ THEN AC#WDRBL no_step_further
@35
DO ~SetGlobal("DragonWarning","AC#W54",2)~ EXIT

CHAIN IF ~Global("FreeDragon","AC#W54",1)~ THEN AC#WDRBL you_have_freed_me
@36
DO ~SetGlobal("FreeDragon","AC#W54",10)
CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(3)
AddJournalEntry(@540005,QUEST_DONE)
PlaySound("PORTAL2")
DestroySelf()~ EXIT

CHAIN IF ~Global("HaveFreedomScroll","AC#W54",1)~ THEN AC#WDRBL hello_have_scroll_promised
@68
EXIT
	
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WDRBL hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#WDRBL confrontation
IF~~THEN REPLY @2 EXTERN AC#WDRBL filthy_hole
IF ~~ THEN REPLY @3 EXTERN AC#WDRBL fight
IF ~OR(7)
PartyHasItem("LEAT19")
PartyHasItem("PLAT18")
PartyHasItem("SACALEB")
PartyHasItem("SCALER")
PartyHasItem("AC#SKPLY")
PartyHasItem("AC#SKYDS")
PartyHasItem("SHLD21")
~ THEN REPLY @4 EXTERN AC#WDRBL scales
IF ~OR(3)
HasItemEquiped("LEAT19",[PC])
HasItemEquiped("PLAT18",[PC])
HasItemEquiped("AC#SKPLY",[PC])
~ THEN REPLY @5 EXTERN AC#WDRBL scales
IF ~~ THEN REPLY @6 EXTERN AC#WDRBL fight

	CHAIN AC#WDRBL scales
	@7
	END
	IF~~THEN REPLY @8 EXTERN AC#WDRBL fight
	IF~~THEN REPLY @9 EXTERN AC#WDRBL fight

CHAIN AC#WDRBL filthy_hole
@10
END
IF~~THEN REPLY @8 EXTERN AC#WDRBL fight
IF~~THEN REPLY @9 EXTERN AC#WDRBL tarterian_dragon_01

CHAIN AC#WDRBL confrontation
@11
END
IF~~THEN REPLY @8 EXTERN AC#WDRBL fight
IF~~THEN REPLY @9 EXTERN AC#WDRBL tarterian_dragon_01

	CHAIN AC#WDRBL tarterian_dragon_01
	@37
	END
	IF~~THEN REPLY @38 EXTERN AC#WDRBL tarterian_dragon_02
	IF~~THEN REPLY @39 EXTERN AC#WDRBL search_waukeen
	IF~~THEN REPLY @40 EXTERN AC#WDRBL fight
	IF~~THEN REPLY @41 EXTERN AC#WDRBL fight

			CHAIN AC#WDRBL search_waukeen
			@42
			END
			IF~~THEN REPLY @43 EXTERN AC#WDRBL tarterian_dragon_02
			IF~~THEN REPLY @40 EXTERN AC#WDRBL fight		
	
		CHAIN AC#WDRBL tarterian_dragon_02
		@44
		END
		IF~~THEN REPLY @45 EXTERN AC#WDRBL tarterian_dragon_03
		IF~~THEN REPLY @46 EXTERN AC#WDRBL how_grazzt_promised_freedom
		IF~~THEN REPLY @47 EXTERN AC#WDRBL fight
		IF~~THEN REPLY @41 EXTERN AC#WDRBL fight
		
			CHAIN AC#WDRBL tarterian_dragon_03
			@48
			END
			IF~~THEN EXTERN AC#WDRBL how_grazzt_promised_freedom
			
			CHAIN AC#WDRBL how_grazzt_promised_freedom
			@49
			END
			IF~PartyHasItem("SCRL9Z")~THEN REPLY @63 EXTERN AC#WDRBL tarterian_dragon_have_scroll
			IF~~THEN REPLY @50 EXTERN AC#WDRBL tarterian_dragon_04
			IF~~THEN REPLY @47 EXTERN AC#WDRBL fight
			
				CHAIN AC#WDRBL tarterian_dragon_04
				@51
				END
				IF~PartyHasItem("SCRL9Z")~THEN REPLY @63 EXTERN AC#WDRBL tarterian_dragon_have_scroll
				IF~~THEN REPLY @52 EXTERN AC#WDRBL tarterian_dragon_free_01				
				IF~~THEN REPLY @67 EXTERN AC#WDRBL fight				
				
					CHAIN AC#WDRBL tarterian_dragon_free_01
					@53
					END
					IF~OR(2)
					CheckStatGT(Player1,17,WIS)
					CheckStatGT(LastTrigger,17,WIS)~THEN REPLY @54 EXTERN AC#WDRBL tarterian_dragon_free_02
					IF~OR(2)
					CheckStatGT(Player1,17,INT)
					CheckStatGT(LastTrigger,17,INT)~THEN REPLY @55 EXTERN AC#WDRBL tarterian_dragon_free_02
					IF~OR(2)
					CheckStatGT(Player1,17,CHR)
					CheckStatGT(LastTrigger,17,CHR)~THEN REPLY @62 EXTERN AC#WDRBL tarterian_dragon_free_02
					IF~~THEN REPLY @65 EXTERN AC#WDRBL tarterian_dragon_what_do_i_get
					IF~~THEN REPLY @67 EXTERN AC#WDRBL fight
					
						CHAIN AC#WDRBL tarterian_dragon_what_do_i_get
						@66
						END
						IF~~THEN EXTERN AC#WDRBL tarterian_dragon_fight	
					
					CHAIN AC#WDRBL tarterian_dragon_free_02
					@57
					END
					IF~PartyHasItem("SCRL9Z")~THEN REPLY @58 EXTERN AC#WDRBL tarterian_dragon_have_scroll
					IF~!PartyHasItem("SCRL9Z")~THEN REPLY @59 EXTERN AC#WDRBL tarterian_dragon_search_scroll
					
					CHAIN IF ~~ THEN AC#WDRBL tarterian_dragon_search_scroll
					@60
					DO ~AddJournalEntry(@540000,QUEST)
					SetGlobal("SearchFreedomScroll","AC#W54",1)~ EXIT
					
					CHAIN IF ~~ THEN AC#WDRBL tarterian_dragon_have_scroll
					@61
					DO ~SetGlobal("HaveFreedomScroll","AC#W54",1)~ EXIT

	CHAIN IF ~~ THEN AC#WDRBL fight
	@12
	DO ~Enemy()~ EXIT
	
	CHAIN IF ~~ THEN AC#WDRBL tarterian_dragon_fight
	@64
	DO ~Enemy()~ EXIT
	
/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W56, Nabassu Lair
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WNAB1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WNAB1 hello_0
@13
END
IF~~THEN REPLY @14 EXTERN AC#WNAB1 challenge
IF~~THEN REPLY @15 EXTERN AC#WNAB1 maretta_01

CHAIN AC#WNAB1 maretta_01
@16
END
IF~~THEN REPLY @17 EXTERN AC#WNAB1 challenge
IF~~THEN REPLY @18 EXTERN AC#WNAB1 steal_souls

CHAIN AC#WNAB1 steal_souls
@19
END
IF~~THEN EXTERN AC#WNAB1 fight

CHAIN AC#WNAB1 challenge
@20
END
IF~~THEN EXTERN AC#WNAB1 fight

	CHAIN IF ~~ THEN AC#WNAB1 fight
	@21
	DO ~Enemy()~ EXIT
	
	
/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W57, Nysara's Lair
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W57NY~

CHAIN IF ~True()~ THEN AC#W57NY hello_0
@22
END
IF~~THEN REPLY @23 EXTERN AC#W57NY who_are_you
IF~~THEN REPLY @24 EXTERN AC#W57NY bye

CHAIN AC#W57NY who_are_you
@25
END
IF~~THEN REPLY @26 EXTERN AC#W57NY grazzt_lover
IF~~THEN REPLY @24 EXTERN AC#W57NY bye

CHAIN AC#W57NY grazzt_lover
@27
END
IF~~THEN REPLY @28 EXTERN AC#W57NY how_can_i_help
IF~~THEN REPLY @24 EXTERN AC#W57NY bye

CHAIN AC#W57NY how_can_i_help
@29
END
IF~~THEN REPLY @30 EXTERN AC#W57NY fools
IF~~THEN REPLY @24 EXTERN AC#W57NY bye

CHAIN AC#W57NY fools
@31
END
IF~~THEN EXTERN AC#W57NY fight

	CHAIN IF ~~ THEN AC#W57NY fight
	@32
	DO ~Enemy()~ EXIT
	
	CHAIN IF ~~ THEN AC#W57NY bye
	@33
	 EXIT
	
	






	


