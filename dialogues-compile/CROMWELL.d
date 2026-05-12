
/****************************
// Dialogue Cromwell: upgrade black_dragonscales
*****************************/
EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("AC#WSCBD")~ THEN GOTO have_black_dragonscales
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN have_black_dragonscales 
  SAY #59709
    IF ~~ THEN GOTO have_black_dragonscales_02
  END
    
  IF ~~ THEN BEGIN have_black_dragonscales_02 
  SAY @2
  =
  @0
	IF ~PartyGoldLT(10000)~ THEN REPLY #66900 GOTO NoThanks
    IF ~PartyGoldGT(9999)~ THEN REPLY #66901 DO ~SetGlobal("AC#W_BlackDragonScales","ar0334",1)
												SetGlobal("ForgeStuff","GLOBAL",1)
                                                  TakePartyGold(10000)
                                                  TakePartyItem("AC#WSCBD")
                                                  DestroyItem("AC#WSCBD")												 
                                                  DestroyGold(10000)~ GOTO 56
	IF ~~ THEN REPLY #66802 GOTO NoThanks
	END 
	 
  IF ~~ THEN BEGIN NoThanks 
  SAY @1
   COPY_TRANS WSMITH01 13
  END
END
