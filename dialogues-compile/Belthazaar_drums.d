/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues of Belthazaar's drums, an item the party can acquire in Samora (Ormad sulpar questline)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WGLAQ~

// initial dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WGLAQ hello_0
@0
END
IF~Global("AC#W_Belthazaar_Drums","GLOBAL",0)~THEN REPLY @1 DO ~SetGlobal("AC#W_Belthazaar_Drums","GLOBAL",1)~ EXTERN AC#WGLAQ no_quasit
IF~~THEN REPLY @2 EXTERN AC#WGLAQ call_glabrezu
	
	CHAIN AC#WGLAQ no_quasit
	@3
	END
	IF~~THEN REPLY @4 EXTERN AC#WGLAQ call_glabrezu
	
		CHAIN AC#WGLAQ call_glabrezu
		@5
		END
		IF~~THEN EXTERN AC#WGLAQ no_glabrezu
		IF~!GlobalTimerNotExpired("AC#W_BelthazaarSummoned","GLOBAL")~THEN EXTERN AC#WGLAQ yes_glabrezu
		IF~OR(38)
			AreaCheck("AC#W4A")
			AreaCheck("AC#W4B")
			AreaCheck("AC#W4C")
			AreaCheck("AC#W4D")
			AreaCheck("AC#W4G")
			AreaCheck("AC#W4S")
			AreaCheck("AC#W4W")
			AreaCheck("AC#W4S")
			AreaCheck("AC#W40")
			AreaCheck("AC#W41")
			AreaCheck("AC#W42")
			AreaCheck("AC#W43")
			AreaCheck("AC#W44")
			AreaCheck("AC#W45")
			AreaCheck("AC#W46")
			AreaCheck("AC#W47")
			AreaCheck("AC#W48")
			AreaCheck("AC#W49")
			AreaCheck("AC#W50")
			AreaCheck("AC#W51")
			AreaCheck("AC#W52")
			AreaCheck("AC#W53")
			AreaCheck("AC#W54")
			AreaCheck("AC#W55")
			AreaCheck("AC#W56")
			AreaCheck("AC#W57")
			AreaCheck("AC#W60")
			AreaCheck("AC#W61")
			AreaCheck("AC#W70")
			AreaCheck("AC#W71")
			AreaCheck("AC#W72")
			AreaCheck("AC#W73")
			AreaCheck("AC#W74")
			AreaCheck("AC#W75")
			AreaCheck("AC#W76")
			AreaCheck("AC#W77")
			AreaCheck("AC#W80")
			AreaCheck("AC#W90")~THEN EXTERN AC#WGLAQ not_in_the_abyys
	
	CHAIN AC#WGLAQ not_in_the_abyys
	@9
	DO ~CreateVisualEffectObject("SPDIMNDR",Myself) 
	Wait(1)				
	DestroySelf()~ EXIT
	
	CHAIN AC#WGLAQ no_glabrezu
	@6
	DO ~CreateVisualEffectObject("SPDIMNDR",Myself) 
	Wait(1)				
	DestroySelf()~ EXIT
	
	CHAIN AC#WGLAQ yes_glabrezu
	@7
	DO ~SetGlobalTimer("AC#W_BelthazaarSummoned","GLOBAL",SIX_DAYS)
	ReallyForceSpellRES("AC#WGLQ",Myself)
	Wait(1)	
	DestroySelf()~ EXIT


BEGIN ~AC#WBELD~

CHAIN IF ~True()~ THEN AC#WBELD hello_0
@8
EXIT
