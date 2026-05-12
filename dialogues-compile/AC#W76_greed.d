/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W76, test of greed chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
// Demon
BEGIN ~AC#W76DM~

CHAIN IF ~Global("Not_Gave_Gold","AC#W76",5)~ THEN AC#W76DM hello_greedy
@0
= @1
= @2
END
IF~~THEN EXTERN AC#W76DM bye

CHAIN IF ~Global("Gave_Gold","AC#W76",5)~ THEN AC#W76DM hello_good
@3
= @4
= @5
END
IF~~THEN REPLY @6 EXTERN AC#W76DM nope_01
IF~~THEN REPLY @7 EXTERN AC#W76DM my_peace

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76DM hello_neutral
@8
= @1
END
IF~~THEN REPLY @6 EXTERN AC#W76DM nope_01
IF~~THEN REPLY @7 EXTERN AC#W76DM my_peace
	
	CHAIN AC#W76DM nope_01
	@9
	END
	IF~~THEN EXTERN AC#W76DM bye
	
	CHAIN IF ~~ THEN AC#W76DM my_peace
	@10
	END
	IF~~THEN EXTERN AC#W76DM bye
	
	CHAIN AC#W76DM bye
	@11
	DO ~SetInterrupt(FALSE)
	SetGlobal("CreateSword","AC#W76",1)
	SetGlobal("Gave_Gold","AC#W76",20)
	SetGlobal("Not_Gave_Gold","AC#W76",20)
	CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(3)
	PlaySound("PORTAL2")
	SetInterrupt(TRUE)
	DestroySelf()~ EXIT
	
	
BEGIN ~AC#W76B1~ // poor farmer

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76B1 hello_0
@12
END
IF~~THEN REPLY @13 EXTERN AC#W76B1 see_no_land
IF~~THEN REPLY @14 EXTERN AC#W76B1 not_real
IF~~THEN REPLY @15 EXTERN AC#W76B1 yes_give_gold
IF~~THEN REPLY @16 EXTERN AC#W76B1 yes_give_gold
IF~~THEN REPLY @17 EXTERN AC#W76B1 nope_give_gold
IF~~THEN REPLY @18 EXTERN AC#W76B1 nope_give_gold
			
	CHAIN AC#W76B1 see_no_land
	@19
	END
	IF~~THEN REPLY @15 EXTERN AC#W76B1 yes_give_gold
	IF~~THEN REPLY @20 EXTERN AC#W76B1 nope_give_gold
	IF~~THEN REPLY @17 EXTERN AC#W76B1 nope_give_gold
	IF~~THEN REPLY @18 EXTERN AC#W76B1 nope_give_gold
	
	CHAIN AC#W76B1 not_real
	@21
	END
	IF~~THEN REPLY @22 EXTERN AC#W76B1 yes_give_gold
	IF~~THEN REPLY @20 EXTERN AC#W76B1 nope_give_gold
	IF~~THEN REPLY @18 EXTERN AC#W76B1 nope_give_gold

CHAIN IF ~~ THEN AC#W76B1 yes_give_gold
@23
DO ~TakePartyGold(100)
IncrementGlobal("Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",2)
DestroySelf()~ EXIT

CHAIN IF ~~ THEN AC#W76B1 nope_give_gold
@24
DO ~IncrementGlobal("Not_Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",2)
DestroySelf()~ EXIT

BEGIN ~AC#W76B2~ // sick widow

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76B2 hello_0
@25
END
IF~~THEN REPLY @26 EXTERN AC#W76B2 not_real
IF~~THEN REPLY @27 EXTERN AC#W76B2 not_real
IF~~THEN REPLY @28 EXTERN AC#W76B2 yes_give_gold
IF~~THEN REPLY @29 EXTERN AC#W76B2 yes_give_gold
IF~~THEN REPLY @30 EXTERN AC#W76B2 nope_give_gold
IF~~THEN REPLY @31 EXTERN AC#W76B2 nope_give_gold

	
	CHAIN AC#W76B2 not_real
	@32
	END
	IF~~THEN REPLY @28 EXTERN AC#W76B2 yes_give_gold
	IF~~THEN REPLY @29 EXTERN AC#W76B2 yes_give_gold
	IF~~THEN REPLY @30 EXTERN AC#W76B2 nope_give_gold
	IF~~THEN REPLY @33 EXTERN AC#W76B2 nope_give_gold

CHAIN IF ~~ THEN AC#W76B2 yes_give_gold
@34
DO ~TakePartyGold(100)
IncrementGlobal("Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",4)
DestroySelf()~ EXIT

CHAIN IF ~~ THEN AC#W76B2 nope_give_gold
@35
DO ~IncrementGlobal("Not_Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",4)
DestroySelf()~ EXIT

BEGIN ~AC#W76B3~ // desperate father

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76B3 hello_0
@36
END
IF~~THEN REPLY @37 EXTERN AC#W76B3 not_real
IF~~THEN REPLY @38 EXTERN AC#W76B3 deal_with_cult
IF~~THEN REPLY @39 EXTERN AC#W76B3 yes_give_gold
IF~~THEN REPLY @40 EXTERN AC#W76B3 yes_give_gold
IF~~THEN REPLY @41 EXTERN AC#W76B3 nope_give_gold
IF~~THEN REPLY @33 EXTERN AC#W76B3 nope_give_gold

	CHAIN AC#W76B3 deal_with_cult
	@42
	END
	IF~~THEN REPLY @39 EXTERN AC#W76B3 yes_give_gold
	IF~~THEN REPLY @40 EXTERN AC#W76B3 yes_give_gold
	IF~~THEN REPLY @43 EXTERN AC#W76B3 nope_give_gold
	IF~~THEN REPLY @44 EXTERN AC#W76B3 nope_give_gold
	IF~~THEN REPLY @33 EXTERN AC#W76B3 nope_give_gold
	
	CHAIN AC#W76B3 not_real
	@45
	END
	IF~~THEN REPLY @39 EXTERN AC#W76B3 yes_give_gold
	IF~~THEN REPLY @40 EXTERN AC#W76B3 yes_give_gold
	IF~~THEN REPLY @38 EXTERN AC#W76B3 deal_with_cult
	IF~~THEN REPLY @41 EXTERN AC#W76B3 nope_give_gold
	IF~~THEN REPLY @33 EXTERN AC#W76B3 nope_give_gold

CHAIN IF ~~ THEN AC#W76B3 yes_give_gold
@46
DO ~TakePartyGold(100)
IncrementGlobal("Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",6)
DestroySelf()~ EXIT

CHAIN IF ~~ THEN AC#W76B3 nope_give_gold
@47
DO ~IncrementGlobal("Not_Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",6)
DestroySelf()~ EXIT

BEGIN ~AC#W76B4~ // rejected orphan

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76B4 hello_0
@48
END
IF~~THEN REPLY @49 EXTERN AC#W76B4 not_real
IF~~THEN REPLY @50 EXTERN AC#W76B4 yes_give_gold
IF~~THEN REPLY @51 EXTERN AC#W76B4 nope_give_gold
IF~~THEN REPLY @52 EXTERN AC#W76B4 nope_give_gold
IF~~THEN REPLY @66 EXTERN AC#W76B5 nope_give_gold
	
	CHAIN AC#W76B4 not_real
	@53
	END
	IF~~THEN REPLY @50 EXTERN AC#W76B4 yes_give_gold
	IF~~THEN REPLY @54 EXTERN AC#W76B4 nope_give_gold
	IF~~THEN REPLY @52 EXTERN AC#W76B4 nope_give_gold
	IF~~THEN REPLY @66 EXTERN AC#W76B5 nope_give_gold

CHAIN IF ~~ THEN AC#W76B4 yes_give_gold
@55
DO ~TakePartyGold(100)
IncrementGlobal("Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",8)
DestroySelf()~ EXIT

CHAIN IF ~~ THEN AC#W76B4 nope_give_gold
@56
DO ~IncrementGlobal("Not_Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",8)
DestroySelf()~ EXIT

BEGIN ~AC#W76B5~ // old veteran

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W76B5 hello_0
@57
END
IF~~THEN REPLY @58 EXTERN AC#W76B5 not_real
IF~~THEN REPLY @59 EXTERN AC#W76B5 yes_give_gold
IF~~THEN REPLY @60 EXTERN AC#W76B5 yes_give_gold
IF~~THEN REPLY @61 EXTERN AC#W76B5 nope_give_gold
IF~~THEN REPLY @62 EXTERN AC#W76B5 nope_give_gold
	
	CHAIN AC#W76B5 not_real
	@63
	END
	IF~~THEN REPLY @59 EXTERN AC#W76B5 yes_give_gold
	IF~~THEN REPLY @61 EXTERN AC#W76B5 nope_give_gold
	IF~~THEN REPLY @62 EXTERN AC#W76B5 nope_give_gold
	IF~~THEN REPLY @66 EXTERN AC#W76B5 nope_give_gold

CHAIN IF ~~ THEN AC#W76B5 yes_give_gold
@64
DO ~TakePartyGold(100)
IncrementGlobal("Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",10)
DestroySelf()~ EXIT

CHAIN IF ~~ THEN AC#W76B5 nope_give_gold
@65
DO ~IncrementGlobal("Not_Gave_Gold","AC#W76",1)
SetGlobal("Greed_talks","AC#W76",10)
DestroySelf()~ EXIT



