/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialoge in Area AC#W52
***********************************************************************************************************************************************
**********************************************************************************************************************************************/

// 
BEGIN ~AC#W_TRT~

IF ~Global("AC#W_AcidSwampQuest","GLOBAL",10)~ THEN BEGIN hello_kill_me
SAY @0
IF ~~ THEN REPLY @1 GOTO not_gonna_kill_you
IF ~~ THEN REPLY @2 + how_open_door
IF ~~ THEN REPLY @3 + ok_kill_you
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN hello_again
SAY  @4
IF ~~ THEN REPLY @5 + say_nothing
IF ~~ THEN REPLY @6 + who_are_you
IF ~~ THEN REPLY @7 + who_are_you
IF ~~ THEN REPLY @8 + go_away
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @9
   =
   @10
   =
   @4
IF ~~ THEN REPLY @5 + say_nothing
IF ~~ THEN REPLY @6 + who_are_you
IF ~~ THEN REPLY @7 + who_are_you
IF ~~ THEN REPLY @8 + go_away
END

	IF ~~ THEN BEGIN who_are_you
	SAY @12
	IF ~~ THEN REPLY @13 GOTO i_am_charname
	END

		IF ~~ THEN BEGIN i_am_charname
		SAY @14
		IF ~~ THEN + what_you_want
		END
		
			IF ~~ THEN BEGIN what_you_want
			SAY @15
			IF ~~ THEN REPLY @16 GOTO search_waukeen_01
			IF ~~ THEN REPLY @17 GOTO search_waukeen_01
			END
			
				IF ~~ THEN BEGIN search_waukeen_01
				SAY @18
				IF ~~ THEN REPLY @20 GOTO waukeen_prison_01
				IF ~~ THEN REPLY @19 GOTO go_away
				END
				
								IF ~~ THEN BEGIN waukeen_prison_01
								SAY @21
								IF ~~ THEN REPLY @22 + waukeen_guard
								IF ~~ THEN REPLY @23 + waukeen_well
								IF ~~ THEN REPLY @24 + waukeen_well
								IF ~~ THEN REPLY @19 GOTO go_away
								END
								
										IF ~~ THEN BEGIN waukeen_well
										SAY @25
										IF ~~ THEN REPLY @26 GOTO waukeen_prison_02
										IF ~~ THEN REPLY @19 GOTO go_away
										END
								
									IF ~~ THEN BEGIN waukeen_guard
									SAY @27
									IF ~~ THEN REPLY @23 + waukeen_well
									IF ~~ THEN REPLY @19 GOTO go_away
									END
									
										IF ~~ THEN BEGIN waukeen_prison_02
										SAY @28										
										IF ~~ THEN REPLY @29 GOTO about_maretta
										IF ~~ THEN REPLY @30 GOTO waukeen_prison_03
										END
										
										IF ~~ THEN BEGIN about_maretta
										SAY @31
										IF ~~ THEN REPLY @30 GOTO waukeen_prison_03
										END
										
											IF ~~ THEN BEGIN waukeen_prison_03
											SAY @32
											IF ~~ THEN REPLY @33 GOTO waukeen_prison_04
											END
											
												IF ~~ THEN BEGIN waukeen_prison_04
												SAY @34
												IF ~~ THEN REPLY @35 GOTO about_fiery_ovens_00
												END
												
													IF ~~ THEN BEGIN about_fiery_ovens_00
													SAY @36												
													IF ~~ THEN REPLY @37 GOTO free_clyddis
													IF ~~ THEN REPLY @38 + kill_me
													IF ~~ THEN REPLY @39 + kill_me
													END
													
														IF ~~ THEN BEGIN free_clyddis
														SAY @40
														IF ~~ THEN GOTO kill_me
														END
														
														IF ~~ THEN BEGIN kill_me
														SAY @41
														IF ~~ THEN REPLY @42 GOTO you_cant_be_serious
														IF ~~ THEN REPLY @43 + ok_kill_ya
														IF ~~ THEN REPLY @44 + cant_kill_you
														END
														
															IF ~~ THEN BEGIN cant_kill_you
															SAY @45
															IF ~~ THEN REPLY @42 GOTO you_cant_be_serious
															IF ~~ THEN REPLY @46 + ok_kill_ya
															END

															IF ~~ THEN BEGIN you_cant_be_serious
															SAY @47
															IF ~~ THEN REPLY @43 + ok_kill_ya
															IF ~~ THEN REPLY @44 + cant_kill_you
															END
															
																IF ~~ THEN BEGIN ok_kill_ya
																SAY @48
																IF ~~ THEN REPLY @49 GOTO agree_kill_clyddis
																IF ~~ THEN REPLY @44 + cant_kill_you
																END
																
																IF ~~ THEN BEGIN agree_kill_clyddis
																SAY @50
																IF ~~ THEN GOTO about_fiery_ovens_01
																END
																
IF ~~ THEN BEGIN about_fiery_ovens_01
SAY @51
IF ~~ THEN REPLY @52 GOTO about_pentacle_01
IF ~~ THEN REPLY @53 GOTO dont_fool_me_birdy
END

	IF ~~ THEN BEGIN dont_fool_me_birdy
	SAY @54
	IF ~~ THEN GOTO about_pentacle_01
	END

	IF ~~ THEN BEGIN about_pentacle_01
	SAY @55
		IF ~~ THEN GOTO about_fiery_ovens_03
		END
		
			IF ~~ THEN BEGIN about_fiery_ovens_03
			SAY @56
			IF ~~ THEN REPLY @57 GOTO about_fiery_ovens_04
			IF ~~ THEN REPLY @58 GOTO about_fiery_ovens_04
			IF ~~ THEN REPLY @59 GOTO about_fiery_ovens_04
			END
			
				IF ~~ THEN BEGIN about_fiery_ovens_04
				SAY @60
				IF ~~ THEN REPLY @61 GOTO which_oven_to_begin 
				END
				
					IF ~~ THEN BEGIN which_oven_to_begin
					SAY @62
					IF ~~ THEN REPLY @63 GOTO oven_order
					END
					
						IF ~~ THEN BEGIN oven_order
						SAY @64
						IF ~~ THEN REPLY @65 GOTO too_long_ago
						END
						
							IF ~~ THEN BEGIN too_long_ago
							SAY @66
							=
							@78
							IF ~~ THEN DO ~SetGlobal("AC#W_AcidSwampQuest","GLOBAL",10)
							DestroyItem("MINHP1")
							EraseJournalEntry(@400012)
							EraseJournalEntry(@400013)
							AddJournalEntry(@400020,QUEST)~GOTO use_oven_twice
							END
							
								IF ~~ THEN BEGIN use_oven_twice
								SAY @67
								IF ~~ THEN REPLY @68  GOTO now_kill_me
								IF ~~ THEN REPLY @2 + how_open_door
								IF ~~ THEN REPLY @1 GOTO not_gonna_kill_you
								IF ~~ THEN REPLY @69 + ok_kill_you
								END
								
									IF ~~ THEN BEGIN now_kill_me
									SAY @70
									IF ~~ THEN REPLY @71 GOTO not_gonna_kill_you
									IF ~~ THEN REPLY @69 + ok_kill_you
									IF ~~ THEN REPLY @2 + how_open_door
									END
									
									IF ~~ THEN BEGIN how_open_door
									SAY @72
									IF ~~ THEN GOTO use_oven_twice
									END
									
										IF ~~ THEN BEGIN not_gonna_kill_you
										SAY @73
										IF ~~ THEN EXIT 
										END
									
										IF ~~ THEN BEGIN ok_kill_you
										SAY @74
										IF ~~ THEN EXIT 
										END

	IF ~~ THEN BEGIN say_nothing
	SAY @75
	IF ~~ THEN REPLY @8 + go_away
	END

	IF ~~ THEN BEGIN go_away
	SAY @77
	IF ~~ THEN EXIT 
	END

