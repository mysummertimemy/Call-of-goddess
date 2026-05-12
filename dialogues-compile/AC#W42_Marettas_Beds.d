/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Maretta's Beds (AC#W42)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W#42A~

IF ~True()~ THEN BEGIN 0
   SAY @0 
   IF ~~ THEN REPLY @1 + which_service
   IF ~~ THEN REPLY @2 GOTO questions
   IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @243 + search_nalfeshnee
   IF ~Global("AC#W_Marettas_Beds","GLOBAL",1)~ THEN REPLY @3 + rest_maretta
   IF ~Global("AC#W_Marettas_Beds","GLOBAL",10)~ THEN REPLY @4 + rest_maretta_yes
END

	IF ~~ THEN BEGIN rest_maretta
	SAY @5
	IF ~~ THEN DO ~SetGlobal("AC#W_Marettas_Beds","GLOBAL",10)~ GOTO rest_maretta_02
	END
	
		IF ~~ THEN BEGIN rest_maretta_02
		SAY @6
		IF ~~ THEN REPLY @4 GOTO rest_maretta_yes
		IF ~~ THEN REPLY @7 GOTO rest_maretta_no
		END
		
			IF ~~ THEN BEGIN rest_maretta_yes
			SAY @8
			IF ~~ THEN DO ~RestParty()~ EXIT 
			END
			
			IF ~~ THEN BEGIN rest_maretta_no
			SAY @9
			IF ~~ THEN EXIT 
			END

IF ~~ THEN BEGIN which_service
   SAY @10
   IF ~~ THEN DO ~StartStore("AC#W#42A",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN questions
   SAY @11
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN search_nalfeshnee
	SAY @244
	IF ~~ THEN EXIT 
	END

