/************************************************************************************************************************************************
*************************************************************************************************************************************************
Dialogues in AC#W49: gambling tent
*************************************************************************************************************************************************
****************************************************************************************************************************************************/
// Dialogue of gambling tent leader who welvomes players
// Ludovic, der Spielmeister
BEGIN ~AC#W49PP~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W49PP hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W49PP about_house
IF~~THEN REPLY @2 EXTERN AC#W49PP damned_fortune
IF~~THEN REPLY @3 EXTERN AC#W49PP bye_wrong_house

CHAIN IF ~True()~ THEN AC#W49PP hello_again
@4
END
IF~~THEN REPLY @1 EXTERN AC#W49PP about_house
IF~~THEN REPLY @2 EXTERN AC#W49PP damned_fortune
IF~~THEN REPLY @3 EXTERN AC#W49PP bye_wrong_house

	CHAIN AC#W49PP bye_wrong_house
	@5
	EXIT
	
	CHAIN AC#W49PP damned_fortune
	@6
	END
	IF~~THEN REPLY @1 EXTERN AC#W49PP about_house
	IF~~THEN REPLY @7 EXTERN AC#W49PP bye_wrong_house
	
	CHAIN AC#W49PP about_house
	@8
	END
	IF~~THEN REPLY @9 EXTERN AC#W49PP win
	IF~~THEN REPLY @7 EXTERN AC#W49PP bye_wrong_house
	
		CHAIN AC#W49PP win
		@10
		END
		IF~~THEN REPLY @11 EXTERN AC#W49PP ready
		IF~~THEN REPLY @12 EXTERN AC#W49PP what_to_do
		IF~~THEN REPLY @7 EXTERN AC#W49PP bye_wrong_house
	
		CHAIN AC#W49PP what_to_do
		@13
		END
		IF~~THEN REPLY @11 EXTERN AC#W49PP ready
		IF~~THEN REPLY @7 EXTERN AC#W49PP bye_wrong_house
		
			CHAIN AC#W49PP ready
			@14
			EXIT

/*_________________________________________________________________________________
*/
// "Stab or die" gaming master
BEGIN ~AC#W49SS~
			
IF ~Global("Stab_or_die","AC#W49",3)~ THEN BEGIN hello_round_finished
SAY @15
IF ~~ THEN GOTO both_slaves_alive
IF ~Global("Other_Slave_Dead","AC#W49",1) ~ THEN GOTO other_slave_died
IF ~Global("Player_Slave_Dead","AC#W49",1) ~ THEN GOTO your_slave_died
END

			IF ~~ THEN BEGIN both_slaves_alive
			SAY @16
			IF ~~ THEN REPLY @17 GOTO next_round
			IF ~~ THEN REPLY @18 + give_up
			END
			
			IF ~~ THEN BEGIN next_round
			SAY @19
			IF ~~ THEN DO ~SetGlobal("Stab_or_die","AC#W49",1)
			SetGlobal("Stab_cycle","AC#W49",1)
			FadeToColor([10.0],0)
			Wait(1)
			StartCutSceneMode()
			StartCutSceneEx("AC#W49_1",TRUE)~ EXIT 
			END
			
	IF ~~ THEN BEGIN other_slave_died
	SAY @20
	IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),10,0,0)~ GOTO bye_next_game_lvl_02
	END
	
	IF ~~ THEN BEGIN your_slave_died
	SAY @21 	
	IF ~~ THEN GOTO bye_next_game_lvl_02
	END
	
	
	IF ~~ THEN BEGIN bye_next_game_lvl_02
	SAY @22
	IF ~~ THEN DO ~SetGlobal("Stab_or_die","AC#W49",10)
	SetGlobal("Stab_cycle","AC#W49",0)
	SetGlobal("Player_Slave_Dead","AC#W49",0)
	SetGlobal("Other_Slave_Dead","AC#W49",0) 
	ActionOverride("AC#W49SD",DestroySelf())
	ActionOverride("AC#W49S2",DestroySelf())~ EXIT
	END

	IF ~~ THEN BEGIN give_up
	SAY @23
	IF ~~ THEN DO ~SetGlobal("Stab_or_die","AC#W49",0)
	SetGlobal("Stab_cycle","AC#W49",0)
	SetGlobal("Player_Slave_Dead","AC#W49",0)
	SetGlobal("Other_Slave_Dead","AC#W49",0) 
	ActionOverride("AC#W49SD",DestroySelf())
	ActionOverride("AC#W49S2",DestroySelf())~ EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @24
   IF ~~ THEN REPLY @25 + Stab_or_die
   IF ~~ THEN REPLY @26 + bye
END

	IF ~~ THEN BEGIN Stab_or_die
	SAY @27
	IF ~~ THEN REPLY @28 GOTO rules
	IF ~~ THEN REPLY @29 + bye	
	END
	
		IF ~~ THEN BEGIN rules
		SAY @30
		IF ~~ THEN REPLY @31 GOTO awful
		IF ~~ THEN REPLY @32 + strongest
		IF ~~ THEN REPLY @33 + wanna_play
		END
		
			IF ~~ THEN BEGIN awful
			SAY @34
			IF ~~ THEN REPLY @35 + strongest
			IF ~~ THEN REPLY @33 + wanna_play
			END
			
			IF ~~ THEN BEGIN strongest
			SAY @36
			IF ~~ THEN REPLY @31 GOTO awful
			IF ~~ THEN REPLY @33 + wanna_play
			END
			
			IF ~~ THEN BEGIN wanna_play
			SAY @37
			IF ~~ THEN REPLY @17 GOTO lets_play
			IF ~~ THEN REPLY @38 + think_about_it
			IF ~~ THEN REPLY @39 + dont_look_demonic
			IF ~~ THEN REPLY @26 + bye
			END
			
				IF ~~ THEN BEGIN dont_look_demonic
				SAY @40
				IF ~~ THEN GOTO wanna_play
				END
			
			IF ~~ THEN BEGIN think_about_it
			SAY @41
			IF ~~ THEN EXIT 
			END
			
			IF ~~ THEN BEGIN lets_play
			SAY @42			
			IF ~GlobalLT("Stab_Game_levels","AC#W49",2)~ THEN GOTO first_game
			IF ~GlobalGT("Stab_Game_levels","AC#W49",2)~ THEN GOTO no_game
			END
			
				IF ~~ THEN BEGIN no_game
				SAY @43
				IF ~~ THEN EXIT 
				END
			
			IF ~~ THEN BEGIN first_game
			SAY @44
			IF ~NumItemsPartyGT("AC#WSGAM",4)~ THEN REPLY @45 DO ~TakePartyItemNum("AC#WSGAM",5)~ GOTO lets_play_02
			IF ~NumItemsPartyLT("AC#WSGAM",5)~ THEN REPLY @46 GOTO not_enough_tokens
			IF ~~ THEN REPLY @47 + think_about_it
			IF ~~ THEN REPLY @48 + bye
			END
			
				IF ~~ THEN BEGIN not_enough_tokens
				SAY @49
				IF ~~ THEN EXIT 
				END
									
			IF ~~ THEN BEGIN lets_play_02
			SAY @50
			IF ~~ THEN DO ~SetGlobal("Stab_or_die","AC#W49",1)
			FadeToColor([10.0],0)
			StartCutSceneMode()
			StartCutSceneEx("AC#W49_1",TRUE)~ EXIT 
			END
		
						
	IF ~~ THEN BEGIN bye
	SAY @51
	IF ~~ THEN EXIT 
	END

IF ~True()~ THEN BEGIN hello_true
   SAY @24
   IF ~~ THEN REPLY @17 GOTO lets_play
   IF ~~ THEN REPLY @25 + Stab_or_die
   IF ~~ THEN REPLY @39 + dont_look_demonic
   IF ~~ THEN REPLY @26 + bye
END

//____________________________________________________________________________________________________
// Roulette Game master

BEGIN ~AC#W49G1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @52
IF ~~ THEN REPLY @53 GOTO first_win
IF ~~ THEN REPLY  @54 GOTO no_thanks
END

	IF ~~ THEN BEGIN first_win 
	  SAY  @55 
	  IF ~NumItemsPartyGT("AC#WSGAM",4) ~ THEN REPLY @56 DO ~TakePartyItemNum("AC#WSGAM",5)~ GOTO play_win
	  IF ~NumItemsPartyLT("AC#WSGAM",5) ~ THEN REPLY @46 GOTO not_enough_tokens
	  IF ~~ THEN REPLY  @54 GOTO no_thanks
	END

IF ~RandomNum(10,1)~ THEN BEGIN hello_winner 
  SAY  @57 
  IF ~NumItemsPartyGT("AC#WSGAM",4) ~ THEN REPLY @56 DO ~TakePartyItemNum("AC#WSGAM",5)~ GOTO play_win
  IF ~NumItemsPartyLT("AC#WSGAM",5) ~ THEN REPLY @46 GOTO not_enough_tokens
  IF ~~ THEN REPLY  @54 GOTO no_thanks
END

IF ~~ THEN BEGIN play_win
SAY @58
IF ~~ THEN GOTO play_win_02 
END

IF ~~ THEN BEGIN play_win_02 
  SAY @59 
  IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),10,0,0)~ EXIT
END

IF ~~ THEN BEGIN not_enough_tokens
SAY @49
IF ~~ THEN EXIT 
END

IF ~~ THEN BEGIN play_loose
SAY @58
IF ~~ THEN GOTO play_loose_02 
END

IF ~~ THEN BEGIN play_loose_02 
  SAY @60
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN no_thanks 
  SAY @61
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN hello_loser
  SAY @62
  IF ~NumItemsPartyGT("AC#WSGAM",4) ~ THEN REPLY @56 DO ~TakePartyItemNum("AC#WSGAM",5)~ GOTO play_loose
  IF ~NumItemsPartyLT("AC#WSGAM",5) ~ THEN REPLY @46 GOTO not_enough_tokens
  IF ~~ THEN REPLY  @54 GOTO no_thanks
END

//_________________________________________________________________________________
// Soulcoinseller

BEGIN ~AC#W49G2~

IF ~True()~ THEN BEGIN hello
SAY @63
IF ~~ THEN REPLY @64 GOTO what_are_soulcoins
IF ~~ THEN REPLY @65 GOTO buy_coins
IF ~PartyHasItem("AC#WSGAM")~ THEN REPLY @66 GOTO sell_coins
IF ~~ THEN REPLY @67 + no_way
END

		IF ~~ THEN BEGIN sell_coins
		SAY @68
		IF ~NumItemsPartyGT("AC#WSGAM",4)~ THEN REPLY @69 DO ~TakePartyItemNum("AC#WSGAM",5)
		GiveGoldForce(5)~ GOTO sell_coins_02
		IF ~NumItemsPartyGT("AC#WSGAM",9)~ THEN REPLY @70 DO ~TakePartyItemNum("AC#WSGAM",10)GiveGoldForce(10) DestroyItem("AC#WSGAM")~ GOTO sell_coins_02
		IF ~NumItemsPartyGT("AC#WSGAM",14)~ THEN REPLY @71 DO ~TakePartyItemNum("AC#WSGAM",15)GiveGoldForce(15) DestroyItem("AC#WSGAM")~ GOTO sell_coins_02
		IF ~NumItemsPartyGT("AC#WSGAM",19)~ THEN REPLY @72 DO ~TakePartyItemNum("AC#WSGAM",20)GiveGoldForce(20) DestroyItem("AC#WSGAM")~ GOTO sell_coins_02
		END
		
			IF ~~ THEN BEGIN sell_coins_02
			SAY @73
			IF ~~ THEN EXIT 
			END

	IF ~~ THEN BEGIN buy_coins
	SAY @74
	IF ~GlobalLT("AC#W_Soulcoin_Counter","GLOBAL",100)~ THEN GOTO buy_coins_01
	IF ~GlobalGT("AC#W_Soulcoin_Counter","GLOBAL",99)~ THEN GOTO buy_coins_02
	END
	
	IF ~~ THEN BEGIN buy_coins_01
	SAY @106
	IF ~~ THEN REPLY @75 GOTO buy_five
	IF ~~ THEN REPLY @76 GOTO buy_ten
	IF ~~ THEN REPLY @77 GOTO buy_15
	IF ~~ THEN REPLY @78 GOTO buy_20
	IF ~~ THEN REPLY @108 GOTO no_way
	END
	
		IF ~~ THEN BEGIN buy_five
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),5,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",5)
		ApplyDamage(LastTalkedToBy,5,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_ten
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),10,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",10)
		ApplyDamage(LastTalkedToBy,10,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_15
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),15,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",15)
		ApplyDamage(LastTalkedToBy,15,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_20
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),20,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",20)
		ApplyDamage(LastTalkedToBy,20,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
	IF ~~ THEN BEGIN buy_coins_02
	SAY @107
	IF ~~ THEN REPLY @75 GOTO buy_five_02
	IF ~~ THEN REPLY @76 GOTO buy_ten_02
	IF ~~ THEN REPLY @77 GOTO buy_15_02
	IF ~~ THEN REPLY @78 GOTO buy_20_02
	IF ~~ THEN REPLY @108 GOTO no_way
	END
	
		IF ~~ THEN BEGIN buy_five_02
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),5,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",5)
		ApplyDamage(LastTalkedToBy,50,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_ten_02
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),10,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",10)
		ApplyDamage(LastTalkedToBy,80,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_15_02
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),15,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",15)
		ApplyDamage(LastTalkedToBy,100,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END
		
		IF ~~ THEN BEGIN buy_20_02
		SAY @79
		IF ~~ THEN DO ~GiveItemCreate("AC#WSGAM",LastTalkedToBy(Myself()),20,0,0)
		IncrementGlobal("AC#W_Soulcoin_Counter","GLOBAL",20)
		ApplyDamage(LastTalkedToBy,150,CRUSHING)
		SmallWait(15)
		ClearAllActions()~ EXIT 
		END	

	IF ~~ THEN BEGIN what_are_soulcoins
	SAY @80
	IF ~~ THEN REPLY @81 GOTO health_for_coins
	IF ~~ THEN REPLY @65 GOTO buy_coins
	IF ~~ THEN REPLY @82 + no_way
	END
	
		IF ~~ THEN BEGIN health_for_coins
		SAY @83
		IF ~~ THEN REPLY @65 GOTO buy_coins
		IF ~~ THEN REPLY @82 + no_way
		IF ~~ THEN REPLY @84 + no_way
		END
		
			IF ~~ THEN BEGIN no_way
			SAY @85
			IF ~~ THEN EXIT
			END

// Dialogue Alu-fiend guard

BEGIN ~AC#W49AL~

IF ~True()~ THEN BEGIN 0
SAY @86
IF ~~ THEN EXIT 
END

// Dialogue Tiefling

BEGIN ~AC#W49P4~

IF ~True()~ THEN BEGIN 0
SAY @87
IF ~~ THEN EXIT 
END

// Dialogue Fucked up player in need of healing potion

BEGIN ~AC#W49P6~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @88
IF ~~ THEN REPLY @89 + what_do_you_need
IF ~~ THEN REPLY @90 + go_away
END

	IF ~~ THEN BEGIN go_away
	SAY @91
	IF ~~ THEN EXIT
	END

	IF ~~ THEN BEGIN what_do_you_need
	SAY @92
	IF ~PartyHasItem("POTN52")~ THEN REPLY @93 GOTO greater_healing_potion
	IF ~PartyHasItem("POTN08")~ THEN REPLY @94 + smaller_healing_potion
	IF ~PartyHasItem("POTN17")~ THEN REPLY @95 + elixir_of_healing
	IF ~~ THEN REPLY @96 + go_away
	IF ~~ THEN REPLY @97 + go_away
	IF ~~ THEN REPLY @98 + why_hurt
	END
	
		IF ~~ THEN BEGIN why_hurt
		SAY @99
		IF ~PartyHasItem("POTN52")~ THEN REPLY @93 GOTO greater_healing_potion
		IF ~PartyHasItem("POTN08")~ THEN REPLY @94 + smaller_healing_potion
		IF ~PartyHasItem("POTN17")~ THEN REPLY @95 + elixir_of_healing
		IF ~~ THEN REPLY @97 + go_away
		IF ~~ THEN REPLY @96 + go_away
		END
	
		IF ~~ THEN BEGIN greater_healing_potion
		SAY @100
		IF ~~ THEN DO ~TakePartyItemNum("POTN52",1)~ GOTO play_again
		END
		
		IF ~~ THEN BEGIN smaller_healing_potion
		SAY @100
		IF ~~ THEN DO ~TakePartyItemNum("POTN08",1)~ GOTO play_again
		END
		
		IF ~~ THEN BEGIN elixir_of_healing
		SAY @100
		IF ~~ THEN DO ~TakePartyItemNum("POTN17",1)~ GOTO play_again
		END
		
			IF ~~ THEN BEGIN play_again
			SAY @101
			IF ~~ THEN DO ~SetGlobal("Healing_addiction","AC#W49",1)
			MoveToPointNoInterrupt([666.562])
			ApplyDamage(Myself,20,CRUSHING)
			CreateVisualEffectObject("SPDEATH3",Myself)
			Kill(Myself)~ EXIT 
			END

IF ~True()~ THEN BEGIN hello_again
SAY @88
IF ~~ THEN REPLY @89 + what_do_you_need
IF ~~ THEN REPLY @90 + go_away
END
// Dialogue addicted gamblers

BEGIN ~AC#W49PL~

IF ~RandomNum(5,1)~ THEN BEGIN 1
SAY @102
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,2)~ THEN BEGIN 2
SAY @103
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,3)~ THEN BEGIN 3
SAY @104
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,4)~ THEN BEGIN 4
SAY @105
IF ~~ THEN EXIT 
END

IF ~RandomNum(5,5)~ THEN BEGIN 5
SAY @105
IF ~~ THEN EXIT 
END
