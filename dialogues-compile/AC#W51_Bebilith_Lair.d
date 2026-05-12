/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Bebilith's Lair (AC#W51)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WNAL2~
BEGIN ~AC#W#BE3~ // Bebilith hunting Margrog

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W#BE3 chain_captured_nalfeshnee
@0
== AC#WNAL2 @1  
== AC#W#BE3 @2
== AC#WNAL2 @3 
== AC#W#BE3 @4  
END
IF ~~ THEN DO ~SetGlobal("AC#W_TharundarSoul","GLOBAL",13)
ActionOverride("AC#WNAL2",Enemy())~ EXIT

CHAIN IF ~True()~ THEN AC#W#BE3 hello_01
@5
EXIT

BEGIN ~AC#W#BEB~

IF ~GlobalGT("AC#W_Bebilith_Help","GLOBAL",0)~ THEN BEGIN hello_01
SAY @6
IF ~~ THEN REPLY @7 GOTO hurry_up
IF ~Global("AC#W_Bebilith_Help","GLOBAL",2)~ THEN REPLY @8 + hurry_up
IF ~Global("AC#W_Bebilith_Help","GLOBAL",1)~ THEN REPLY @9 + what_should_i_do
IF ~~ THEN REPLY @10 GOTO fight
IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",1)
GlobalLT("AC#W_TharundarSoul","GLOBAL",10)~ THEN REPLY @11 + hunt_margrog
END

	IF ~~ THEN BEGIN hunt_margrog
	SAY @12
	IF ~~ THEN REPLY @13 GOTO hunt_margrog_02 
	END
	
		IF ~~ THEN BEGIN hunt_margrog_02
		SAY @14
		IF ~~ THEN REPLY @15 GOTO agree_hunt_margrog
		END
		
			IF ~~ THEN BEGIN agree_hunt_margrog
			SAY @16
			IF ~~ THEN DO ~EraseJournalEntry(@470702)
				AddJournalEntry(@470703,QUEST)
				SetGlobal("AC#W_TharundarSoul","GLOBAL",10)
				CreateVisualEffectObject("SPDIMNDR",Myself) 
				Wait(2)				
				DestroySelf()~ EXIT 
			END

	IF ~~ THEN BEGIN what_should_i_do
	SAY @17
	IF ~~ THEN REPLY @18 GOTO hurry_up
	IF ~~ THEN REPLY @10 GOTO fight
	END

	IF ~~ THEN BEGIN hurry_up
	SAY @19
	IF ~~ THEN EXIT 
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @20 
   IF ~~ THEN REPLY @21 + not_edible
   IF ~~ THEN REPLY @22 GOTO fight
   IF ~~ THEN REPLY @23 GOTO i_am_a_race
   IF ~~ THEN REPLY @24 + who_are_you_instead
END

	IF ~~ THEN BEGIN who_are_you_instead
	SAY @25
	IF ~~ THEN GOTO not_edible
	END

IF ~~ THEN BEGIN not_edible
SAY @26
IF ~~ THEN REPLY @23 GOTO i_am_a_race
IF ~~ THEN REPLY @27 GOTO fight
IF ~~ THEN REPLY @28 GOTO stop_hunting_demons
END

	IF ~~ THEN BEGIN i_am_a_race
	SAY @29
	IF ~~ THEN REPLY @30 GOTO why_here
	IF ~~ THEN REPLY @28 GOTO stop_hunting_demons
	END
	
		IF ~~ THEN BEGIN why_here
		SAY @31
		IF ~~ THEN REPLY @32 GOTO stop_hunting_demons
		END
		
			IF ~~ THEN BEGIN stop_hunting_demons
			SAY @33
			=
			@34
			IF ~~ THEN REPLY @35 GOTO idea_01
			IF ~~ THEN REPLY @36 GOTO idea_01
			END
			
				IF ~~ THEN BEGIN idea_01
				SAY @37
				IF ~~ THEN GOTO idea_02
				END
				
					IF ~~ THEN BEGIN idea_02
					SAY @38
					IF ~~ THEN REPLY @39 GOTO fight
					IF ~~ THEN REPLY @40 GOTO fight
					IF ~~ THEN REPLY @41 + idea_03
					IF ~~ THEN REPLY @42 + idea_03
					END
					
						IF ~~ THEN BEGIN idea_03
						SAY @43
						IF ~~ THEN REPLY @44 GOTO deactivate_01
						END
						
							IF ~~ THEN BEGIN deactivate_01
							SAY @45
							IF ~~ THEN REPLY @46 GOTO advantage_01
							IF ~~ THEN REPLY @47 GOTO advantage_01
							END
							
								IF ~~ THEN BEGIN advantage_01
								SAY @48
								IF ~~ THEN REPLY @49 GOTO know_about_waukeen
								IF ~~ THEN REPLY @50 GOTO dont_know_what_youre_talking
								END
								
										IF ~~ THEN BEGIN dont_know_what_youre_talking
										SAY @51
										IF ~~ THEN GOTO know_about_waukeen
										END
								
									IF ~~ THEN BEGIN know_about_waukeen
									SAY @52
									IF ~~ THEN REPLY @53 GOTO know_about_waukeen_02
									IF ~~ THEN REPLY @54 GOTO vrock_01
									IF ~~ THEN REPLY @55 + fight
									IF ~~ THEN REPLY @89 + in_search_pentacle
									END
									
											IF ~~ THEN BEGIN in_search_pentacle
											SAY @90
											IF ~~ THEN REPLY @53 GOTO know_about_waukeen_02
											IF ~~ THEN REPLY @54 GOTO vrock_01
											IF ~~ THEN REPLY @58 + amulet_prison
											IF ~~ THEN REPLY @55 + fight
											END
									
											IF ~~ THEN BEGIN vrock_01
											SAY @56
											IF ~~ THEN REPLY @53 GOTO know_about_waukeen_02
											END
									
										IF ~~ THEN BEGIN know_about_waukeen_02
										SAY @57
										IF ~~ THEN REPLY @58 + amulet_prison
										IF ~~ THEN REPLY @59 GOTO do_we_have_a_deal
										END										
										
											IF ~~ THEN BEGIN amulet_prison
											SAY @60
											IF ~~ THEN GOTO do_we_have_a_deal
											END
										
										IF ~~ THEN BEGIN do_we_have_a_deal
										SAY @61
										IF ~~ THEN REPLY @62 + what_kind_of_orb
										IF ~~ THEN REPLY @63 + how_do_i_know_cheating
										IF ~~ THEN REPLY @64 + tell_me_about_amulet
										IF ~~ THEN REPLY @65 GOTO agree_01
										IF ~~ THEN REPLY @55 + fight
										END
										
												IF ~~ THEN BEGIN tell_me_about_amulet
												SAY @66
												IF ~~ THEN REPLY @67 + amulet_waukeen
												END
												
													IF ~~ THEN BEGIN amulet_waukeen
													SAY @68
													IF ~~ THEN GOTO do_we_have_a_deal
													END
												
												IF ~~ THEN BEGIN how_do_i_know_cheating
												SAY @69
												IF ~~ THEN GOTO do_we_have_a_deal
												END
										
												IF ~~ THEN BEGIN what_kind_of_orb
												SAY @70
												IF ~~ THEN GOTO do_we_have_a_deal
												END
											
											IF ~~ THEN BEGIN agree_01
											SAY @71
											IF ~~ THEN DO ~SetGlobal("AC#W_Bebilith_Help","GLOBAL",1)
											GiveItem("AC#WPNTG",LastTalkedToBy)
											GiveItemCreate("AC#W51OR",LastTalkedToBy(),1,0,0)~ GOTO job_briefing
											END
											
												IF ~~ THEN BEGIN job_briefing
												SAY @72
												IF ~~ THEN REPLY @73 GOTO one_last_point
												IF ~~ THEN REPLY @74 + one_last_point 
												IF ~~ THEN REPLY @75 + one_last_point 
												END
												
													IF ~~ THEN BEGIN one_last_point
													SAY @76
													IF ~~ THEN REPLY @77 GOTO accept_01
													IF ~~ THEN REPLY @78 GOTO accept_01
													END
													
														IF ~~ THEN BEGIN accept_01
														SAY @79
														IF ~~ THEN REPLY @80 GOTO what_tell_maretta
														IF ~~ THEN REPLY @81 GOTO what_tell_maretta
														END
														
															IF ~~ THEN BEGIN what_tell_maretta
															SAY @82
															IF ~~ THEN REPLY @83 GOTO bye
															IF ~~ THEN REPLY @84 GOTO bye
															IF ~~ THEN REPLY @85 GOTO kill_nonetheless
															END
															
																	IF ~~ THEN BEGIN kill_nonetheless
																	SAY @86
																	IF ~~ THEN GOTO bye
																	END
															
																IF ~~ THEN BEGIN bye
																SAY @87
																IF ~~ THEN DO ~EraseJournalEntry(@470042)
																AddJournalEntry(@400100,QUEST)
																AddJournalEntry(@510000,QUEST)~ EXIT 
																END

IF ~~ THEN BEGIN fight
   SAY @88
   IF ~~ THEN DO ~Enemy()~ EXIT
END

