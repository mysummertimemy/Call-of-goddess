/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogue in general store merchant's tent AC#W07
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W07MR~ 

IF ~True()
~ THEN BEGIN 0 // from:
  SAY #24761 /* ~'Allo, <LADYLORD>! Möchtet Ihr vielleicht ein paar meiner hochwertigen Waren erwerben?~ */
  IF ~~ THEN REPLY #24763 /* ~Zeigt mir, was Ihr habt.~ */ DO ~StartStore("AC#W07MR",LastTalkedToBy())
~ EXIT
  IF ~~ THEN REPLY #14641 /* ~Vielleicht ein andermal.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #14644 /* ~Wie Ihr wollt. Einen schönen Tag noch!~ */
  IF ~~ THEN EXIT
END

IF ~False()~ THEN BEGIN 2 // from:
  SAY #14646 /* ~Kommt einmal wieder!~ */
  IF ~~ THEN EXIT
END
/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in spice merchant's tent AC#W08
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W06M1~

CHAIN IF ~True()~ THEN AC#W06M1 hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W06M1 what_do_you_have
IF~~THEN REPLY @2 EXTERN AC#W06M1 bye

	CHAIN IF ~~ THEN AC#W06M1 what_do_you_have
	@3
	END
	IF~~THEN REPLY @4 EXTERN AC#W06M1 where_colors_from
	IF~~THEN REPLY @2 EXTERN AC#W06M1 bye
	
	CHAIN IF ~~ THEN AC#W06M1 where_colors_from
	@5
	END
	IF~~THEN REPLY @2 EXTERN AC#W06M1 bye

	CHAIN IF ~~ THEN AC#W06M1 bye
	@6
	EXIT
	
/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in spice merchant's tent AC#W08
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W08BG~

BEGIN ~AC#W08MC~

IF ~Global("AC#W_More_Pepper","GLOBAL",10)~ THEN BEGIN hello_sold_pepper
SAY @7
IF ~~ THEN EXIT
END

IF ~Global("AC#W_More_Pepper","GLOBAL",5)~ THEN BEGIN hello_wanna_sell_pepper
SAY @8
IF ~~ THEN REPLY @9 GOTO nope_dont_sell_pepper_02
IF ~PartyHasItem("AC#WCHP2")~ THEN REPLY @10 + yes_buy_pepper
END

IF ~Global("AC#W_More_Pepper","GLOBAL",1)~ THEN BEGIN hello_wait_4_pepper
SAY @11
IF ~~ THEN REPLY @9 GOTO bye_wait_4_pepper
IF ~PartyHasItem("AC#WCHP2")~ THEN REPLY @12 + yes_have_pepper
END

	IF ~~ THEN BEGIN yes_have_pepper
	SAY @13
	IF ~~ THEN REPLY @14 GOTO yes_buy_pepper
	IF ~~ THEN REPLY @15 + nope_dont_sell_pepper
	END
	
		IF ~~ THEN BEGIN nope_dont_sell_pepper
		SAY @16
		IF ~~ THEN REPLY @14 GOTO yes_buy_pepper
		IF ~~ THEN REPLY @17 + nope_dont_sell_pepper_redirect
		END
		
		IF ~~ THEN BEGIN nope_dont_sell_pepper_redirect
		SAY @18
		IF ~~ THEN REPLY @14 DO ~GiveGoldForce(2000)~ GOTO yes_buy_pepper_02
		IF ~~ THEN REPLY @19 DO ~SetGlobal("AC#W_More_Pepper","GLOBAL",5)~ + nope_dont_sell_pepper_02
		END
		
			IF ~~ THEN BEGIN nope_dont_sell_pepper_02
			SAY @20
			IF ~~ THEN EXIT 
			END
	
		IF ~~ THEN BEGIN yes_buy_pepper
		SAY @21
		IF ~~ THEN DO ~TakePartyItem("AC#WCHP2")
		DestroyItem("AC#WCHP2")
		GiveGoldForce(1000)
		SetGlobal("AC#W_More_Pepper","GLOBAL",10)~ EXIT 
		END
		
		IF ~~ THEN BEGIN yes_buy_pepper_02
		SAY @21
		IF ~~ THEN DO ~TakePartyItem("AC#WCHP2")
		DestroyItem("AC#WCHP2")
		SetGlobal("AC#W_More_Pepper","GLOBAL",10)~ EXIT 
		END

	IF ~~ THEN BEGIN bye_wait_4_pepper
	SAY @22
	IF ~~ THEN EXIT
	END

IF ~Global("Being_honest","AC#W08",1)~ THEN BEGIN hello_honest
SAY @23
IF ~~ THEN EXIT 
END

IF ~Global("GetOff","AC#W08",1)~ THEN BEGIN hello_get_off
SAY @24
IF ~~ THEN EXIT 
END

IF ~Global("PlantedPepper","AC#W08",4)~ THEN BEGIN hello_deal_perfect
SAY @25
IF ~~ THEN DO ~SetGlobal("PlantedPepper","AC#W08",5)~ GOTO need_more
END

	IF ~~ THEN BEGIN need_more
	SAY @26
	IF ~~ THEN REPLY @27 GOTO masun_job
	IF ~~ THEN REPLY @28 GOTO job_pepper
	END
	
		IF ~~ THEN BEGIN masun_job
		SAY @29
		IF ~~ THEN  GOTO more_pepper 
		END
		
			IF ~~ THEN BEGIN more_pepper
			SAY @30
			IF ~~ THEN REPLY @31 GOTO dont_know_pepper
			END
			
				IF ~~ THEN BEGIN dont_know_pepper
				SAY @32
				IF ~~ THEN GOTO job_pepper
				END
				
					IF ~~ THEN BEGIN job_pepper
					SAY @33
					IF ~~ THEN REPLY @34 GOTO job_pepper_bye
					IF ~~ THEN REPLY @35 GOTO job_pepper_bye
					IF ~~ THEN REPLY @36 GOTO job_pepper_bye
					END
					
						IF ~~ THEN BEGIN job_pepper_bye
						SAY @37
						IF ~~ THEN DO ~SetGlobal("AC#W_More_Pepper","GLOBAL",1)~ EXIT 
						END
		
		IF ~~ THEN BEGIN get_off
		SAY @38
		IF ~~ THEN DO ~SetGlobal("GetOff","AC#W08",1)~ EXIT 
		END

IF ~Global("PlantedPepper","AC#W08",1)~ THEN BEGIN hello_pepper
SAY @39
IF ~~ THEN DO ~SetGlobal("PlantedPepper","AC#W08",2)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @40
   IF ~~ THEN REPLY @41 GOTO just_look_around
   IF ~PartyHasItem("AC#W08PP")~ THEN REPLY @42 + zakhum_honest_01
END

	IF ~~ THEN BEGIN zakhum_honest_01
	SAY @43
	IF ~~ THEN REPLY @44 DO ~TakePartyItem("AC#W08PP") DestroyItem("AC#W08PP")~ GOTO zakhum_honest_02 
	END
	
		IF ~~ THEN BEGIN zakhum_honest_02
		SAY @45
		IF ~~ THEN GOTO zakhum_honest_03 
		END
		
			IF ~~ THEN BEGIN zakhum_honest_03
			SAY @46
			IF ~~ THEN GOTO zakhum_honest_bye
			END
			
				IF ~~ THEN BEGIN zakhum_honest_bye
				SAY @47
				IF ~~ THEN DO ~GiveGoldForce(100)
				SetGlobal("AC#W01_Spicy","GLOBAL",10)
				SetGlobal("Being_honest","AC#W08",1)~ EXIT 
				END

IF ~True()~ THEN BEGIN hello_again
   SAY @40
   IF ~~ THEN REPLY @41 GOTO just_look_around
   IF ~PartyHasItem("AC#W08PP")~ THEN REPLY @42 + zakhum_honest_01
END

	IF ~~ THEN BEGIN just_look_around
	SAY @48
	IF ~~ THEN EXIT 
	END



BEGIN ~AC#W08NB~

CHAIN IF ~Global("PlantedPepper","AC#W08",3)~ THEN AC#W08NB chain_spicy
@49  
== AC#W08MC @50
== AC#W08NB @51
== AC#W08MC @52
== AC#W08NB @53
= @54
== AC#W08MC @55
== AC#W08NB @56
== AC#W08MC @57
== AC#W08NB @58
== AC#W08MC @59
== AC#W08NB @60
== AC#W08BG @61
== AC#W08NB @62
END
IF ~~ THEN DO ~SetGlobal("PlantedPepper","AC#W08",4)
SetGlobal("AC#W01_Spicy","GLOBAL",2)
ActionOverride("AC#W08BG",EscapeArea())
EscapeArea()~ EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W08NB chain_pepper
@63
== AC#W08MC @64  
== AC#W08NB @65
== AC#W08MC @66
== AC#W08NB @67
== AC#W08MC @68
== AC#W08NB @69
END
IF ~~ THEN DO ~SetGlobal("PlantedPepper","AC#W08",3)
StartCutSceneMode()
StartCutScene("AC#W08CT")~ EXIT

	

