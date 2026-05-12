/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialogue Modron machine in Infinite staircase level 3 (Samora landing platform)
***********************************************************************************************************************************************
**********************************************************************************************************************************************/

// Modron machine
BEGIN ~AC#W30SW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @0
IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_01
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green
IF ~~ THEN REPLY @14 + intelligence_check
IF ~~ THEN REPLY @5 + go_away
END

IF ~Global("ModronDoorOpens","AC#W30",0)~ THEN BEGIN hello_0
SAY @6
IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_01
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green
IF ~~ THEN REPLY @14 + intelligence_check
IF ~~ THEN REPLY @5 + go_away
END

	IF ~~ THEN BEGIN intelligence_check
	SAY @15
	IF ~CheckStatGT(LastTalkedToBy(Myself),15,INT)~ THEN GOTO intelligence_check_success
	IF ~CheckStatLT(LastTalkedToBy(Myself),16,INT)~ THEN GOTO intelligence_check_failure
	END
	
		IF ~~ THEN BEGIN intelligence_check_success
		SAY @16
		IF ~CheckStatGT(LastTalkedToBy(Myself),17,INT)~ THEN GOTO intelligence_check_success_02
		IF ~CheckStatLT(LastTalkedToBy(Myself),18,INT)~ THEN GOTO intelligence_check_failure_02
		END
		
		IF ~~ THEN BEGIN intelligence_check_failure_02
		SAY @17
		IF ~~ THEN GOTO machine_working
		END
		
		IF ~~ THEN BEGIN intelligence_check_success_02
		SAY @18
		IF ~~ THEN GOTO machine_working
		END
		
		IF ~~ THEN BEGIN intelligence_check_failure
		SAY @19
		IF ~~ THEN GOTO machine_working
		END
		
		IF ~~ THEN BEGIN machine_working
		SAY @6
		IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_01
		IF ~~ THEN REPLY @2 + wrong_01_yellow
		IF ~~ THEN REPLY @3 + wrong_01_red
		IF ~~ THEN REPLY @4 + wrong_01_green
		IF ~~ THEN REPLY @14 + intelligence_check
		IF ~~ THEN REPLY @5 + go_away
		END

IF ~~ THEN BEGIN wrong_01_yellow
SAY @7
IF ~~ THEN REPLY @1 + wrong_01_blue
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green 
IF ~~ THEN REPLY @5 + go_away
END

IF ~~ THEN BEGIN wrong_01_blue
SAY @8
IF ~~ THEN REPLY @1 + wrong_01_blue
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green 
IF ~~ THEN REPLY @5 + go_away
END

IF ~~ THEN BEGIN wrong_01_red
SAY @9
IF ~~ THEN REPLY @1 + wrong_01_blue
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green 
IF ~~ THEN REPLY @5 + go_away
END

IF ~~ THEN BEGIN wrong_01_green
SAY @10
IF ~~ THEN REPLY @1 + wrong_01_blue
IF ~~ THEN REPLY @2 + wrong_01_yellow
IF ~~ THEN REPLY @3 + wrong_01_red
IF ~~ THEN REPLY @4 + wrong_01_green 
IF ~~ THEN REPLY @5 + go_away
END

	IF ~~ THEN BEGIN right_01
	SAY @8
	IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_02 
	IF ~~ THEN REPLY @2 + wrong_01_yellow
	IF ~~ THEN REPLY @3 + wrong_01_red
	IF ~~ THEN REPLY @4 + wrong_01_green
	IF ~~ THEN REPLY @5 + go_away
	END

		IF ~~ THEN BEGIN right_02
		SAY @8
		IF ~~ THEN REPLY @1 + wrong_01_blue
		IF ~~ THEN REPLY @2 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_03 
		IF ~~ THEN REPLY @3 + wrong_01_red
		IF ~~ THEN REPLY @4 + wrong_01_green
		IF ~~ THEN REPLY @5 + go_away
		END
		
			IF ~~ THEN BEGIN right_03
			SAY @7
			IF ~~ THEN REPLY @1 + wrong_01_blue
			IF ~~ THEN REPLY @2 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_04 
			IF ~~ THEN REPLY @3 + wrong_01_red
			IF ~~ THEN REPLY @4 + wrong_01_green
			IF ~~ THEN REPLY @5 + go_away
			END

				IF ~~ THEN BEGIN right_04
				SAY @7
				IF ~~ THEN REPLY @1 + wrong_01_blue
				IF ~~ THEN REPLY @11 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_05 
				IF ~~ THEN REPLY @3 + wrong_01_red
				IF ~~ THEN REPLY @4 + wrong_01_green
				IF ~~ THEN REPLY @5 + go_away
				END

					IF ~~ THEN BEGIN right_05
					SAY @7
					IF ~~ THEN REPLY @1 + wrong_01_blue
					IF ~~ THEN REPLY @2 + wrong_01_yellow
					IF ~~ THEN REPLY @3 + wrong_01_red
					IF ~~ THEN REPLY @4 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_06
					IF ~~ THEN REPLY @5 + go_away
					END

						IF ~~ THEN BEGIN right_06
						SAY @10
						IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_07
						IF ~~ THEN REPLY @2 + wrong_01_yellow
						IF ~~ THEN REPLY @3 + wrong_01_red
						IF ~~ THEN REPLY @4 + wrong_01_green
						IF ~~ THEN REPLY @5 + go_away
						END

						IF ~~ THEN BEGIN right_07
						SAY @8
						IF ~~ THEN REPLY @1 + wrong_01_blue
						IF ~~ THEN REPLY @2 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_08
						IF ~~ THEN REPLY @3 + wrong_01_red
						IF ~~ THEN REPLY @4 + wrong_01_green
						IF ~~ THEN REPLY @5 + go_away
						END

							IF ~~ THEN BEGIN right_08
							SAY @7
							IF ~~ THEN REPLY @1 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_09
							IF ~~ THEN REPLY @2 + wrong_01_yellow
							IF ~~ THEN REPLY @3 + wrong_01_red
							IF ~~ THEN REPLY @4 + wrong_01_green
							IF ~~ THEN REPLY @5 + go_away
							END

								IF ~~ THEN BEGIN right_09
								SAY @8
								IF ~~ THEN REPLY @1 + wrong_01_blue
								IF ~~ THEN REPLY @2 + wrong_01_yellow
								IF ~~ THEN REPLY @3 + wrong_01_red
								IF ~~ THEN REPLY @4 DO ~IncrementGlobal("ModronDoorOpens","AC#W30",1)~ GOTO right_finished
								IF ~~ THEN REPLY @5 + go_away
								END
								
								IF ~~ THEN BEGIN right_finished
								SAY @12
								IF ~~ THEN DO ~SetGlobal("ModronDoorOpens","AC#W30",20)
								DestroySelf()~ EXIT 
								END

IF ~~ THEN BEGIN go_away
SAY @13
IF ~~ THEN DO ~SetGlobal("ModronDoorOpens","AC#W30",0)~ EXIT 
END
