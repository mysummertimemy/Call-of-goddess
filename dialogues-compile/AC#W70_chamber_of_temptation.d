/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W70, chamber of temptation
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W70S1~ // Stone face 01

BEGIN ~AC#W70S2~ // Stone face 02
		
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W70S1 hello_0
@0
== AC#W70S2 @1
= @2
== AC#W70S1 @3
DO ~ActionOverride("AC#W70S2",DestroySelf())
DestroySelf()
~ EXIT

// Blackguard in chamber of temptation

BEGIN ~AC#WBLKG~
CHAIN IF ~True()~ THEN AC#WBLKG hello_1
@4
==DORNJ IF ~InParty("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @6
== AC#WBLKG @5
DO ~SetGlobal("AC#W70Blackguard","GLOBAL",2)
Enemy()~ EXIT


	
	
	


