/*
Temple in Trademeet
_______________________________________________________________________________________
*/
APPEND TEMSUP

// Patching the first dialogue of the Waukeenar priest to react to the player's liberation of Waukeen
IF WEIGHT #-999 ~GlobalGT("AC#WaukeenWorldKnows","GLOBAL",0)
Global("AC#WaukeenReaction","AR2008",0)~ THEN BEGIN hello_hero
   SAY @39
   =
   @40
   IF ~~ THEN DO ~SetGlobal("AC#WaukeenReaction","AR2008",1)~ GOTO what_can_i_do
END

IF WEIGHT #-998 ~Global("AC#WaukeenWorldKnows","GLOBAL",0)
GlobalGT("AC#WCelebration","GLOBAL",0)
Global("AC#WaukeenReaction","AR2008",0)~ THEN BEGIN hello_unknown_hero
   SAY @47
   IF ~~ THEN DO ~SetGlobal("AC#WaukeenReaction","AR2008",1)~ GOTO what_can_i_do
END

IF ~~ THEN BEGIN Waukeen_do_you_recognise_me
   SAY @43
   IF ~~ THEN GOTO what_can_i_do
END

IF ~~ THEN BEGIN Waukeen_free_dont_know
   SAY @44
   IF ~~ THEN GOTO what_can_i_do
END

IF ~~ THEN BEGIN what_can_i_do 
  SAY @45
  IF ~~ THEN REPLY #58452 /* ~Ich würde gern Eure Dienste in Anspruch nehmen, bitte.~ */ GOTO service
  IF ~~ THEN REPLY #58453 /* ~Nichts. Ich gehe jetzt.~ */ GOTO bye_nothing
END

IF ~~ THEN BEGIN service 
  SAY #45214 /* ~Die Anhänger Waukeens stehen stets zu Diensten – zu einem fairen und ehrlichen Preis natürlich.~ */
  IF ~~ THEN DO ~StartStore("temsup",LastTalkedToBy)~ EXIT
END

IF ~~ THEN BEGIN bye_nothing
  SAY @46
  IF ~~ THEN EXIT
END
END

// Patching the "I thought Waukeen was dead?" response.
ADD_TRANS_TRIGGER TEMSUP 10 ~Global("AC#WCelebration","GLOBAL",0)~ DO 0
	
EXTEND_BOTTOM TEMSUP 10
        IF ~GlobalGT("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @41 GOTO Waukeen_do_you_recognise_me	
END
EXTEND_BOTTOM TEMSUP 10
        IF ~GlobalGT("AC#WCelebration","GLOBAL",0)
		Global("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @42 GOTO Waukeen_free_dont_know			
END

/*
_______________________________________________________________________________________
Temple in Saradush
*/
APPEND SARTEM01
IF ~~ THEN BEGIN Waukeen_do_you_recognise_me
   SAY @43
   IF ~~ THEN GOTO what_can_i_do
END

IF ~~ THEN BEGIN Waukeen_free_dont_know
   SAY @44
   IF ~~ THEN GOTO what_can_i_do
END

IF ~~ THEN BEGIN what_can_i_do 
  SAY @45
  IF ~~ THEN REPLY #58452 /* ~Ich würde gern Eure Dienste in Anspruch nehmen, bitte.~ */ GOTO service
  IF ~~ THEN REPLY #58453 /* ~Nichts. Ich gehe jetzt.~ */ GOTO bye_nothing
END

IF ~~ THEN BEGIN service 
  SAY #45214 /* ~Die Anhänger Waukeens stehen stets zu Diensten – zu einem fairen und ehrlichen Preis natürlich.~ */
  IF ~~ THEN DO ~StartStore("SARTEM01",LastTalkedToBy)~ EXIT
END

IF ~~ THEN BEGIN bye_nothing
  SAY @46
  IF ~~ THEN EXIT
END
END	
EXTEND_BOTTOM SARTEM01 0
        IF ~GlobalGT("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @41 GOTO Waukeen_do_you_recognise_me	
END
EXTEND_BOTTOM SARTEM01 0
        IF ~GlobalGT("AC#WCelebration","GLOBAL",0)
		Global("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @42 GOTO Waukeen_free_dont_know			
END
EXTEND_BOTTOM SARTEM01 3
        IF ~GlobalGT("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @41 GOTO Waukeen_do_you_recognise_me	
END
EXTEND_BOTTOM SARTEM01 3
        IF ~GlobalGT("AC#WCelebration","GLOBAL",0)
		Global("AC#WaukeenWorldKnows","GLOBAL",0)~ THEN REPLY @42 GOTO Waukeen_free_dont_know			
END


