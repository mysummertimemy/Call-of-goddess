/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialog Maretta hostile (if attacked) in AC#W44 (counting house):
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WMARH~

CHAIN IF ~True()~ THEN AC#WMARH chain_hostile
@0
= @1
DO ~StartCutSceneMode()
StartCutScene("ac#wct1")~
EXIT

// Alu-fiend guards

BEGIN ~AC#W44AL~

IF ~RandomNum(3,1)~ THEN BEGIN hello_01
SAY @2
IF ~~ THEN EXIT 
END

IF ~RandomNum(3,2)~ THEN BEGIN hello_02
SAY @3
IF ~~ THEN EXIT 
END

IF ~RandomNum(3,3)~ THEN BEGIN hello_03
SAY @4
IF ~~ THEN EXIT 
END

	IF ~~ THEN BEGIN gildaar_appears_01
	SAY @5
	IF ~~ THEN EXTERN ~AC#WMAR1~ gildaar_appears_02 
	END
/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialog Verins in AC#W44 (counting house):
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W#VE3~

// See CHAIN for initial dialogues

IF ~~ THEN BEGIN not_your_business
SAY @6
IF ~~ THEN REPLY @7 GOTO what_do_you_do_here 
END

	IF ~~ THEN BEGIN what_do_you_do_here
	SAY @8
	IF ~~ THEN REPLY @9 GOTO darokin
	IF ~~ THEN REPLY @10 + amn
	END
	
		IF ~~ THEN BEGIN amn
		SAY @11
		IF ~~ THEN REPLY @12 GOTO amn_02
		IF ~~ THEN REPLY @13 GOTO amn_02
		IF ~~ THEN REPLY @14 GOTO amn_02
		IF ~~ THEN REPLY @15 GOTO amn_02
		IF ~~ THEN REPLY @16 GOTO goddess_waukeen
		IF ~~ THEN REPLY @17 + not_care_about_gods
		END
		
			IF ~~ THEN BEGIN goddess_waukeen
			SAY @18
			IF ~~ THEN GOTO chain_anyways
			END
		
			IF ~~ THEN BEGIN amn_02
			SAY @19
			IF ~~ THEN REPLY @20 GOTO chain_anyways
			IF ~~ THEN REPLY @309 GOTO chain_anyways
			IF ~~ THEN REPLY @310 GOTO chain_anyways
			END
		
			IF ~~ THEN BEGIN not_care_about_gods
			SAY @21
			IF ~~ THEN GOTO chain_anyways
			END
	
		IF ~~ THEN BEGIN darokin
		SAY @22
		IF ~~ THEN REPLY @23 GOTO darokin_dont_know
		IF ~~ THEN REPLY @24 GOTO darokin_dinkelmus
		IF ~~ THEN REPLY @25 + darokin_no_info
		END
		
			IF ~~ THEN BEGIN darokin_dont_know
			SAY @26
			IF ~~ THEN GOTO chain_anyways
			END
			
			IF ~~ THEN BEGIN darokin_dinkelmus
			SAY @27
			IF ~~ THEN GOTO chain_anyways
			END
			
			IF ~~ THEN BEGIN darokin_no_info
			SAY @28
			IF ~~ THEN GOTO chain_anyways
			END
				
IF ~~ THEN BEGIN find_alone
SAY @29
IF ~~ THEN DO ~SetGlobal("AC#W_Verin_dispute","GLOBAL",1)
EscapeArea()~ EXIT 
END

/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogue Maretta
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WMAR1~

IF ~Global("GildaarDead","AC#W44",1)
Global("Gildaar_Pathetic","AC#W44",1)~ THEN BEGIN hello_gildaar_pathetic_dead
SAY @323
IF ~~ THEN DO ~SetGlobal("GildaarDead","AC#W44",10)
EraseJournalEntry(@110012)
EraseJournalEntry(@110013)
EraseJournalEntry(@110014)
EraseJournalEntry(@110015)
EraseJournalEntry(@110016)
~ GOTO continue_after_gildaars_defeat 
END

IF ~Global("GildaarDead","AC#W44",1)
Global("Gildaar_Silence","AC#W44",10)~ THEN BEGIN hello_gildaar_silenced_dead
SAY @317
IF ~~ THEN DO ~SetGlobal("GildaarDead","AC#W44",10)
EraseJournalEntry(@110012)
EraseJournalEntry(@110013)
EraseJournalEntry(@110014)
EraseJournalEntry(@110015)
EraseJournalEntry(@110016)
~ GOTO continue_after_gildaars_defeat 
END

IF ~Global("GildaarDead","AC#W44",1)~ THEN BEGIN hello_gildaar_dead
SAY @30
IF ~~ THEN DO ~SetGlobal("GildaarDead","AC#W44",10)
EraseJournalEntry(@110012)
EraseJournalEntry(@110013)
EraseJournalEntry(@110014)
EraseJournalEntry(@110015)
EraseJournalEntry(@110016)
~ GOTO gildaar_dead_02 
END

	IF ~~ THEN BEGIN gildaar_dead_02
	SAY @31
	IF ~~ THEN REPLY @32 GOTO keep_calm 
	IF ~~ THEN REPLY @33 GOTO keep_calm 
	END
	
		IF ~~ THEN BEGIN keep_calm
		SAY @34
		IF ~~ THEN REPLY @35 + continue_after_gildaars_defeat
		IF ~~ THEN REPLY @36 + continue_after_gildaars_defeat
		END
		
			IF ~~ THEN BEGIN continue_after_gildaars_defeat
			SAY @37
			IF ~~ THEN GOTO bebilith_job_honour
			END

		// if secret is revealed and the city turns hostile
		IF ~~ THEN BEGIN after_gildaar_fight_all
		SAY @38
		IF ~~ THEN DO ~SetGlobal("AC#W_AttackedMaretta","GLOBAL",1)
		SetGlobal("Hostile","LOCALS",1)
		SelectWeaponAbility(SLOT_WEAPON1,0)
		EraseJournalEntry(@110012)
EraseJournalEntry(@110013)
EraseJournalEntry(@110014)
EraseJournalEntry(@110015)
EraseJournalEntry(@110016)
		Enemy()~ EXIT 
		END

IF ~Global("GildaarKilledByMaretta","AC#W44",1)~ THEN BEGIN hello_gildaar_killed_by_maretta
SAY @39
IF ~~ THEN DO ~SetGlobal("GildaarKilledByMaretta","AC#W44",10)
EraseJournalEntry(@110012)
EraseJournalEntry(@110013)
EraseJournalEntry(@110014)
EraseJournalEntry(@110015)
EraseJournalEntry(@110016)~ GOTO continue_after_gildaars_defeat 
END
		
IF ~GlobalGT("AC#W_Verin_dispute","GLOBAL",0)
GlobalLT("AC#W_Verin_dispute","GLOBAL",10)~ THEN BEGIN hello_deva_feather
SAY @40
IF ~PartyHasItem("AC#WDVFT")~ THEN REPLY @41 DO ~TakePartyItem("AC#WDVFT")
DestroyItem("AC#WDVFT")~ GOTO yes_have_feather
IF ~PartyHasItem("AC#WDVWG")
!PartyHasItem("AC#WDVFT")~ THEN REPLY @326 DO ~TakePartyItem("AC#WDVWG")
DestroyItem("AC#WDVWG")~ GOTO yes_have_wings_instead
IF ~~ THEN REPLY @42 GOTO keep_on_searching
END

	IF ~~ THEN BEGIN yes_have_wings_instead
	SAY @327
	=
	@328
	IF ~~ THEN DO ~SetGlobal("AC#W_Verin_dispute","GLOBAL",10)~ GOTO about_verin
	END
	
	IF ~~ THEN BEGIN yes_have_feather
	SAY @43
	IF ~~ THEN DO ~SetGlobal("AC#W_Verin_dispute","GLOBAL",10)~ GOTO about_verin
	END
	
		IF ~~ THEN BEGIN about_verin
		SAY @44
		IF ~~ THEN GOTO about_traitor
		END
		
			IF ~~ THEN BEGIN about_traitor
			SAY @45
			IF ~~ THEN REPLY @46 GOTO traitor_not_true
			IF ~~ THEN REPLY @47 + traitor_yes_true
			IF ~~ THEN REPLY @48 + traitor_about_what
			END
			
				IF ~~ THEN BEGIN traitor_yes_true
				SAY @49
				IF ~~ THEN REPLY @48 + traitor_about_what
				END

				IF ~~ THEN BEGIN traitor_not_true
				SAY @50
				IF ~~ THEN REPLY @48 + traitor_about_what
				END
				
					IF ~~ THEN BEGIN traitor_about_what
					SAY @51
					IF ~~ THEN REPLY @52 GOTO share_blood
					IF ~~ THEN REPLY @53 GOTO share_blood
					IF ~~ THEN REPLY @54 GOTO child_of_bhaal
					END
					
						IF ~~ THEN BEGIN child_of_bhaal
						SAY @55
						IF ~~ THEN GOTO share_blood 
						END
						
							IF ~~ THEN BEGIN share_blood
							SAY @56
							IF ~~ THEN REPLY @57 GOTO throw_traitors_acid_pits 
							IF ~~ THEN REPLY @329 GOTO throw_traitors_acid_pits 
							IF ~~ THEN REPLY @332 GOTO throw_traitors_acid_pits 
							END
							
								IF ~~ THEN BEGIN throw_traitors_acid_pits
								SAY @58
								IF ~~ THEN REPLY @59 GOTO take_warning
								IF ~~ THEN REPLY @330 GOTO take_warning
								IF ~~ THEN REPLY @331 GOTO take_warning
								END
								
									IF ~~ THEN BEGIN take_warning
									SAY @60
									IF ~~ THEN GOTO quest_kill_nabassu 
									// hier ggf. noch Quest mit Elfenblut ö.ä.
									END
									
										IF ~~ THEN BEGIN quest_kill_nabassu 
										SAY @61
										IF ~~ THEN REPLY @62 GOTO kill_verin
										IF ~~ THEN REPLY @63 + job_assassin
										END
										
											IF ~~ THEN BEGIN kill_verin
											SAY @64
											IF ~~ THEN GOTO job_assassin
											END
											
											IF ~~ THEN BEGIN job_assassin
											SAY @65
											IF ~~ THEN REPLY @66 GOTO think_killed_in_ulgothsbeard
											IF ~~ THEN REPLY @67 + dont_know_nabassu
											END
											
													IF ~~ THEN BEGIN dont_know_nabassu
													SAY @68
													IF ~~ THEN GOTO about_nabassu 
													END
											
												IF ~~ THEN BEGIN think_killed_in_ulgothsbeard
												SAY @69 
												IF ~~ THEN GOTO about_nabassu 
												END
												
												IF ~~ THEN BEGIN about_nabassu
												SAY @70
												IF ~~ THEN GOTO about_nabassu_02
												END
												
												IF ~~ THEN BEGIN about_nabassu_02 
												SAY @71
												IF ~~ THEN REPLY @72 GOTO yes_know_fieryoven
												IF ~~ THEN REPLY @73 GOTO no_dont_know_fieryoven
												END
												
													IF ~~ THEN BEGIN no_dont_know_fieryoven
													SAY @74
													IF ~~ THEN GOTO no_fieryoven_portals
													END
												
													IF ~~ THEN BEGIN yes_know_fieryoven
													SAY @75
													IF ~~ THEN REPLY @76 GOTO yes_fieryoven_portals 
													IF ~~ THEN REPLY @77 GOTO no_fieryoven_portals 
													IF ~~ THEN REPLY @78 GOTO no_fieryoven_portals 
													END																									
													
														IF ~~ THEN BEGIN yes_fieryoven_portals
														SAY @79
														IF ~~ THEN GOTO no_fieryoven_portals
														END
														
														IF ~~ THEN BEGIN no_fieryoven_portals
														SAY @80
														IF ~~ THEN GOTO nabassu_fieryoven
														END
														
															IF ~~ THEN BEGIN nabassu_fieryoven
															SAY @81
															IF ~~ THEN GOTO go_kill_nabassu
															END
															
																IF ~~ THEN BEGIN go_kill_nabassu
																SAY @82
																IF ~~ THEN REPLY @83 GOTO just_jump_oven 
																IF ~~ THEN REPLY @341 GOTO function_fireyoven 
																IF ~~ THEN REPLY @342 GOTO function_fireyoven 
																IF ~~ THEN REPLY @343 GOTO function_fireyoven 
																END
																
																		IF ~~ THEN BEGIN just_jump_oven
																		SAY @340
																		IF ~~ THEN GOTO function_fireyoven
																		END
																	
																	IF ~~ THEN BEGIN function_fireyoven
																	SAY @84
																	IF ~~ THEN DO ~GiveItemCreate("AC#WPNT2",LastTalkedToBy(),1,0,0)~ GOTO about_pentacle
																	END
																	
																		IF ~~ THEN BEGIN about_pentacle
																		SAY @85
																		IF ~~ THEN REPLY @86 GOTO keep_care
																		IF ~~ THEN REPLY @334 GOTO accused_traitor_too
																		IF ~~ THEN REPLY @335 GOTO accused_traitor_too
																		END
																		
																				IF ~~ THEN BEGIN keep_care
																				SAY @333
																				IF ~~ THEN GOTO accused_traitor_too
																				END
																				
																				IF ~~ THEN BEGIN accused_traitor_too
																				SAY @336
																				IF ~~ THEN REPLY @337 GOTO accused_traitor_too_02
																				IF ~~ THEN REPLY @339 GOTO accused_traitor_too_02
																				IF ~~ THEN REPLY @338 GOTO accused_traitor_too_02
																				END
																		
																			IF ~~ THEN BEGIN accused_traitor_too_02
																			SAY @87
																			IF ~GlobalGT("AC#W_AcidSwampQuest","GLOBAL",0)~ THEN DO ~AddJournalEntry(@400013,QUEST)
																			EraseJournalEntry(@400010)
																			EraseJournalEntry(@400012)~ GOTO bye_nabassu
																			IF ~Global("AC#W_AcidSwampQuest","GLOBAL",0)~ THEN DO ~AddJournalEntry(@400010,QUEST)~ GOTO bye_nabassu
																			END
																			
																				IF ~~ THEN BEGIN bye_nabassu
																				SAY @88
																				IF ~~ THEN DO ~SetGlobal("AC#W_Nabassu_quest","GLOBAL",1)
																				EraseJournalEntry(@400201)
																				AddJournalEntry(@400202,QUEST_DONE)
																				AddJournalEntry(@400400,QUEST)~ EXIT 
																				END
												
												
												

IF ~GlobalGT("AC#W_Bebilith_quest","GLOBAL",0)
GlobalLT("AC#W_Bebilith_quest","GLOBAL",10)~ THEN BEGIN hello_01
SAY @89
IF ~PartyHasItem("AC#WPNTG")~ THEN REPLY @90 DO ~TakePartyItem("AC#WPNTG")
DestroyItem("AC#WPNTG")
AddJournalEntry(@400122,QUEST_DONE)~ + got_pentacle
IF ~~ THEN REPLY @91 GOTO keep_on_searching
END

	IF ~~ THEN BEGIN got_pentacle
	SAY @92
	IF ~~ THEN REPLY @93 + said_bebilith
	IF ~~ THEN REPLY @94 + said_bebilith
	END
	
	IF ~~ THEN BEGIN said_bebilith
	SAY @95
	=
	@96
	IF ~~ THEN DO ~SetGlobal("AC#W_Bebilith_quest","GLOBAL",10)
	CreateCreatureObjectOffset("AC#W#VE3",Myself,[10.10])~ EXIT
	END

	IF ~~ THEN BEGIN keep_on_searching
	SAY @97
	IF ~~ THEN EXIT
	END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_00
SAY @98
IF ~~ THEN REPLY @7 + art
IF ~~ THEN REPLY @99 + art
IF ~~ THEN REPLY @100 + unworthy_name
END

		IF ~~ THEN BEGIN unworthy_name
		SAY @101
		IF ~~ THEN REPLY @7 + art 
		END

	IF ~~ THEN BEGIN art
	SAY @102
	IF ~~ THEN REPLY @103 GOTO no_art
	IF ~~ THEN REPLY @104 GOTO yes_art
	IF ~~ THEN REPLY @105 GOTO what_art_question
	END
	
			IF ~~ THEN BEGIN what_art_question
			SAY @106
			IF ~~ THEN GOTO art_tip 
			END
	
		IF ~~ THEN BEGIN no_art
		SAY @107
		IF ~~ THEN GOTO art_tip
		END
		
		IF ~~ THEN BEGIN yes_art
		SAY @108
		IF ~~ THEN GOTO art_tip
		END
		
	IF ~~ THEN BEGIN art_tip
	SAY @109
	IF ~~ THEN REPLY @110 + only_a_painting
	IF ~~ THEN REPLY @111 + awful
	IF ~~ THEN REPLY @112 + awful
	IF ~~ THEN REPLY @113 + awful
	END	
	
		IF ~~ THEN BEGIN only_a_painting
		SAY @114
		IF ~~ THEN REPLY @111 + awful
		IF ~~ THEN REPLY @115 + awful
		IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN EXTERN ~HAERDAJ~ haerdalis_painting
		IF ~InParty("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN EXTERN ~JANJ~ jan_painting
		END		

			IF ~~ THEN BEGIN npc_reaction_painting_02
			SAY @116
			IF ~~ THEN GOTO awful
			END		
	
		IF ~~ THEN BEGIN awful
		SAY @117
		IF ~~ THEN REPLY @118 + nothing_at_all 
		IF ~~ THEN REPLY @119 + angel_feather
		IF ~~ THEN REPLY @120 + elven_blood
		IF ~~ THEN REPLY @121 + nothing_at_all
		END
		
			IF ~~ THEN BEGIN nothing_at_all
			SAY @122
			IF ~~ THEN REPLY @119 + angel_feather
			IF ~~ THEN REPLY @120 + elven_blood
			END
			
					IF ~~ THEN BEGIN elven_blood
					SAY @123
					IF ~~ THEN REPLY @124 + my_services
					IF ~~ THEN REPLY @125 + my_services
					IF ~~ THEN REPLY @126 + my_services
					IF ~~ THEN REPLY @127 + my_services
					END
					
					IF ~~ THEN BEGIN angel_feather
					SAY @128
					IF ~~ THEN REPLY @124 + my_services
					IF ~~ THEN REPLY @125 + my_services
					IF ~~ THEN REPLY @126 + my_services
					IF ~~ THEN REPLY @127 + my_services
				END

				IF ~~ THEN BEGIN my_services
				SAY @129
				IF ~~ THEN REPLY @9 DO ~SetGlobal("AC#W_FromDarokin","GLOBAL",1)~ GOTO from_darokin
				IF ~~ THEN REPLY @10 DO ~SetGlobal("AC#W_FromAmn","GLOBAL",1)~ + from_amn
				IF ~~ THEN REPLY @130 + long_story_heritage
				END
				
						IF ~~ THEN BEGIN from_darokin
						SAY @131
						IF ~~ THEN GOTO which_trade 
						END
						
						IF ~~ THEN BEGIN from_amn
						SAY @132
						IF ~~ THEN GOTO from_amn_02
						IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN EXTERN ~JaheiraJ~ jaheira_from_amn
						IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EdwinJ~ edwin_from_amn
						END
																		
						IF ~~ THEN BEGIN from_amn_02
						SAY @133
						IF ~~ THEN GOTO which_trade 
						END
						
						IF ~~ THEN BEGIN long_story_heritage
						SAY @134
						IF ~~ THEN GOTO which_trade
						END


					IF ~~ THEN BEGIN which_trade
					SAY @135
					IF ~~ THEN REPLY @136 GOTO mercenary_first  
					IF ~~ THEN REPLY @137 GOTO mercenary_first  					
					IF ~~ THEN REPLY @138 GOTO mercenary_first  
					END	

						IF ~~ THEN BEGIN mercenary_first
						SAY @139
						IF ~~ THEN REPLY @140 GOTO interlude_01
						IF ~~ THEN REPLY @141 GOTO interlude_01
						IF ~~ THEN REPLY @142 GOTO interlude_02
						IF ~Global("AC#W_Samoras_Arena","GLOBAL",10)~ THEN REPLY @143 + work_2gether 
						IF ~CheckStatGT(LastTrigger,17,CHR)~ THEN REPLY @144 GOTO convince_charisma_01_success
						IF ~CheckStatLT(LastTrigger,18,CHR)~ THEN REPLY @144 GOTO interlude_02
						END
						
							IF ~~ THEN BEGIN convince_charisma_01_success
							SAY @145
							IF ~~ THEN GOTO mercenary_service 
							END
						
							IF ~~ THEN BEGIN interlude_01
							SAY @146
							IF ~~ THEN REPLY @147 GOTO interlude_02
							IF ~~ THEN REPLY @148 GOTO interlude_02
							IF ~~ THEN REPLY @149 GOTO interlude_02
							IF ~~ THEN REPLY @150 GOTO interlude_02
							END
							
								IF ~~ THEN BEGIN interlude_02
								SAY @151
								IF ~~ THEN REPLY @152 GOTO talent_clever 
								IF ~~ THEN REPLY @153 GOTO talent_thief 
								IF ~~ THEN REPLY @154 GOTO talent_spill_blood 
								IF ~~ THEN REPLY @155 + talent_constitution
								IF ~~ THEN REPLY @156 + talent_wisdom
								IF ~~ THEN REPLY @157 + talent_charisma
								END
								
									IF ~~ THEN BEGIN talent_wisdom
									SAY @158
									IF ~~ THEN GOTO work_2gether
									END
									
									IF ~~ THEN BEGIN talent_charisma
									SAY @159
									IF ~~ THEN GOTO work_2gether
									END
								
									IF ~~ THEN BEGIN talent_constitution
									SAY @160
									IF ~~ THEN REPLY @161 GOTO work_2gether
									IF ~~ THEN REPLY @162 GOTO work_2gether
									IF ~~ THEN REPLY @163 GOTO work_2gether 
									END
								
									IF ~~ THEN BEGIN talent_thief
									SAY @164
									IF ~~ THEN REPLY @165 GOTO work_2gether
									IF ~~ THEN REPLY @166 GOTO work_2gether
									IF ~~ THEN REPLY @167 GOTO work_2gether
									END
									
									IF ~~ THEN BEGIN talent_spill_blood
									SAY @168
									IF ~~ THEN REPLY @169 GOTO work_2gether
									IF ~~ THEN REPLY @170 GOTO work_2gether
									END
									
									IF ~~ THEN BEGIN talent_clever
									SAY @171
									IF ~~ THEN REPLY @172 GOTO work_2gether
									IF ~~ THEN REPLY @173 GOTO work_2gether
									IF ~~ THEN REPLY @174 GOTO work_2gether
									END
									
										IF ~~ THEN BEGIN work_2gether
										SAY @175
										IF ~~ THEN GOTO mercenary_service 
										END
						
						IF ~~ THEN BEGIN mercenary_service
						SAY @176
						IF ~~ THEN REPLY @177 GOTO yes_work
						IF ~~ THEN REPLY @178 + yes_work
						IF ~~ THEN REPLY @179 + no_work
						IF ~~ THEN REPLY @67 + no_work
						END	
						
								IF ~~ THEN BEGIN no_work
								SAY @180
								IF ~~ THEN GOTO yes_work 
								END

							IF ~~ THEN BEGIN yes_work
							SAY @181
							IF ~~ THEN GOTO job_to_do
							END	

								IF ~~ THEN BEGIN job_to_do
								SAY @182
								IF ~~ THEN REPLY @183 GOTO rose_of_the_abyss_01
								IF ~~ THEN REPLY @184 GOTO rose_of_the_abyss_01
								IF ~~ THEN REPLY @185 GOTO rose_of_the_abyss_01
								IF ~~ THEN REPLY @186 GOTO rose_of_the_abyss_01
								IF ~~ THEN REPLY @187 GOTO rose_of_the_abyss_01
								END	

									IF ~~ THEN BEGIN rose_of_the_abyss_01
									SAY @188
									IF ~~ THEN REPLY @189 GOTO rose_of_the_abyss_02
									IF ~~ THEN REPLY @190 GOTO rose_of_the_abyss_02
									IF ~~ THEN REPLY @191 GOTO rose_of_the_abyss_02
									IF ~~ THEN REPLY @192 GOTO rose_of_the_abyss_02
									END
									
									IF ~~ THEN BEGIN rose_of_the_abyss_02
									SAY @193
									IF ~~ THEN GOTO rose_of_the_abyss_03
									END
									
										IF ~~ THEN BEGIN rose_of_the_abyss_03
										SAY @194
										IF ~~ THEN DO ~GiveItemCreate("AC#W70KY",LastTalkedToBy(),1,0,0)~ GOTO rose_of_the_abyss_04
										END
										
										IF ~~ THEN BEGIN rose_of_the_abyss_04
										SAY @195
										IF ~~ THEN DO ~SetGlobal("AC#W_Rose_Abyss","GLOBAL",1)~ EXIT 
										END
							

							
IF ~~ THEN BEGIN lead_the_way
SAY @196
IF ~~ THEN EXTERN AC#W#VE3 find_alone 
END

IF ~~ THEN BEGIN that_was_not_a_question
SAY @197
IF ~~ THEN EXTERN AC#W#VE3 find_alone 
END

IF ~True()~ THEN BEGIN hello_true
SAY @198
IF ~PartyHasItem("AC#WABRS")~ THEN REPLY @199 GOTO have_rose
IF ~PartyHasItem("AC#WABRS")~ THEN REPLY @200 GOTO have_rose
IF ~PartyHasItem("AC#WPFHE")~ THEN REPLY @201 +  head_of_baatezu 
IF ~GlobalGT("AC#W_Nabassu_quest","GLOBAL",0)
GlobalLT("AC#W_Nabassu_quest","GLOBAL",20)~ THEN REPLY @202 + about_nabassu_quest
IF ~~ THEN REPLY @203 + bye_true 
END

	IF ~~ THEN BEGIN about_nabassu_quest
	SAY @204
	IF ~Dead("AC#WNAB1")~ THEN REPLY @205 GOTO yes_nabassu_dead
	IF ~~ THEN REPLY @42 GOTO no_nabassu_dead
	END
	
		IF ~~ THEN BEGIN yes_nabassu_dead
		SAY @206
		IF ~~ THEN DO ~GiveGoldForce(1000)
		AddexperienceParty(1000)
		EraseJournalEntry(@400401)
		AddJournalEntry(@400402,QUEST_DONE)~ GOTO yes_nabassu_dead_02
		END
		
			IF ~~ THEN BEGIN yes_nabassu_dead_02
			SAY @207
			IF ~~ THEN DO ~SetGlobal("AC#W_Nabassu_quest","GLOBAL",20)~ EXIT 
			END
		
		IF ~~ THEN BEGIN no_nabassu_dead
		SAY @208
		IF ~~ THEN EXIT
		END

	IF ~~ THEN BEGIN head_of_baatezu
	SAY @209
	IF ~~ THEN DO ~TakePartyItem("AC#WPFHE") DestroyItem("AC#WPFHE")
	EraseJournalEntry(@470030)
	AddexperienceParty(1000)~ GOTO gildaar_appears_01
	END
	
			IF ~~ THEN BEGIN gildaar_appears_01
			SAY @210
			IF ~~ THEN EXTERN AC#W44AL gildaar_appears_01
			END
			
			IF ~~ THEN BEGIN gildaar_appears_02
			SAY @211
			IF ~~ THEN DO ~SetGlobal("GildaarAppears","AC#W44",1)~ EXIT 
			END
		
		IF ~~ THEN BEGIN bebilith_job_honour
		SAY @212
		IF ~~ THEN REPLY @213 GOTO bebilith_job_02 
		IF ~~ THEN REPLY @214 GOTO bebilith_job_need_break 
		END
		
			IF ~~ THEN BEGIN bebilith_job_need_break
			SAY @215
			IF ~~ THEN GOTO bebilith_job_02
			END
	
	IF ~~ THEN BEGIN bebilith_job_02
								SAY @216
								=
								@217
								= 
								@218
								IF ~~ THEN REPLY @219 GOTO bebilith_job_bye
								IF ~~ THEN REPLY @220 GOTO bebilith_job_bye
								IF ~~ THEN REPLY @221 GOTO bebilith_job_bye
								END
								
								IF ~~ THEN BEGIN bebilith_job_bye
								SAY @222							
								IF ~~ THEN DO ~SetGlobal("AC#W_Bebilith_quest","GLOBAL",1)								
								AddJournalEntry(@470040,QUEST)~ EXIT 
								END	

	IF ~~ THEN BEGIN have_rose
	SAY @223
	IF ~~ THEN DO ~TakePartyItem("AC#WABRS") DestroyItem("AC#WABRS")~ GOTO have_rose_02
	END
	
		IF ~~ THEN BEGIN have_rose_02
		SAY @224
		IF ~~ THEN GOTO filled_black_heart_with_joy
		END
		
		IF ~~ THEN BEGIN filled_black_heart_with_joy
		SAY @225 		
		IF ~~ THEN GOTO rest_in_marettas_beds
		END
		
			IF ~~ THEN BEGIN rest_in_marettas_beds
			SAY @226
			IF ~~ THEN DO ~AddJournalEntry(@440010,INFO) 
			SetGlobal("AC#W_Marettas_Beds","GLOBAL",1)~ GOTO have_rose_03
			END
		
			IF ~~ THEN BEGIN have_rose_03
			SAY @227
			IF ~~ THEN REPLY @228 GOTO baatezu_intro 
			IF ~~ THEN REPLY @229 GOTO baatezu_intro 
			END
			
				IF ~~ THEN BEGIN baatezu_intro
				SAY @230
				IF ~~ THEN GOTO where_to_enlist 
				END
				
					IF ~~ THEN BEGIN where_to_enlist
					SAY @231
					IF ~~ THEN GOTO meet_babau
					END
					
					IF ~~ THEN BEGIN meet_babau
					SAY @232
					IF ~~ THEN DO ~SetGlobal("AC#W_Bloowar_quest","GLOBAL",1)
					SetGlobal("AC#W_Rose_Abyss","GLOBAL",10)
					EraseJournalEntry(@440071)
					AddJournalEntry(@470020,QUEST)~ EXIT 
					END

	IF ~~ THEN BEGIN bye_true
	SAY @233
	IF ~~ THEN EXIT
	END

// CHAIN
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W#VE3 chain_hello_thats_charname
@234
== AC#WMAR1 @235  
== AC#W#VE3 @236 
== AC#WMAR1 @237
== AC#W#VE3 @238 
END
IF ~~ THEN REPLY @7 GOTO what_do_you_do_here
IF ~~ THEN REPLY @239 GOTO not_your_business

CHAIN IF ~~ THEN AC#W#VE3 chain_anyways
@240
== AC#WMAR1 @241
== AC#W#VE3 @242
== AC#WMAR1 @243  
== AC#W#VE3 @244 
== AC#WMAR1 @245
== AC#W#VE3 @246 
== AC#WMAR1 @247
 = @248
END
IF ~~ THEN REPLY @249 EXTERN AC#WMAR1 lead_the_way
IF ~~ THEN REPLY @250 EXTERN AC#WMAR1 that_was_not_a_question
IF ~~ THEN REPLY @251 EXTERN AC#WMAR1 that_was_not_a_question
IF ~~ THEN REPLY @252 EXTERN AC#WMAR1 that_was_not_a_question

// Gildaar
BEGIN ~AC#WGIL4~

// when Gildaar is silenced
CHAIN IF ~Global("Gildaar_Silence","AC#W44",2)~ THEN AC#WGIL4 hello_silenced
@314 
== AC#WGIL4 @315
== AC#WGIL4 @316
== AC#WMAR1 @258
DO ~CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
SetGlobal("Gildaar_Silence","AC#W44",10)~ EXIT

// when Gildaar is hit by the water of the river Styx
CHAIN IF ~Global("AC#WSTYX","GLOBAL",1)~ THEN AC#WGIL4 hello_styx
@253 
== AC#WMAR1 @254
== AC#WGIL4 @255
== AC#WMAR1 @256
== AC#WGIL4 @257
== AC#WMAR1 @258
DO ~SetGlobal("AC#WSTYX","GLOBAL",10)~ EXIT

CHAIN IF ~Global("AttackedGildaar","AC#W44",1)~ THEN AC#WGIL4 hello_attacked_gildaar_
@259
== AC#WMAR1 @260 
DO ~SetGlobal("AttackedGildaar","AC#W44",2)~ EXTERN AC#WGIL4 continue_after_first_interrupt

	CHAIN AC#WGIL4 continue_after_first_interrupt
	@261
	== AC#WMAR1 @262 
	== AC#WGIL4 @263
	== AC#WMAR1 @264
	END
	IF~~THEN REPLY @265 EXTERN AC#WGIL4 dunno_what_gildaar_is_talking
	IF~~THEN REPLY @266 EXTERN AC#WGIL4 it_was_gilaar_to_free_waukeen
	IF~~THEN REPLY @267 EXTERN AC#WGIL4 yes_its_true_free_waukeen

CHAIN IF ~Global("InterruptGildaar","AC#W44",3)~ THEN AC#WGIL4 hello_nothing_happened
@268 
== AC#WMAR1 @269
DO ~SetGlobal("InterruptGildaar","AC#W44",4)~ EXTERN AC#WGIL4 continue_after_first_interrupt
	
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WGIL4 hello_neutral
@270 
== AC#WMAR1 @271
== AC#WGIL4 @272
== AC#WMAR1 @273
== AC#WGIL4 @274
== AC#WMAR1 IF ~Global("AC#W_FromDarokin","GLOBAL",1)~ THEN @275
== AC#WMAR1 IF ~Global("AC#W_FromDarokin","GLOBAL",0)
Global("AC#W_FromAmn","GLOBAL",0)~ THEN @276
== AC#WMAR1 IF ~Global("AC#W_FromAmn","GLOBAL",1)~ THEN @277
== AC#WGIL4 IF ~Global("AC#W_FromAmn","GLOBAL",1)~ THEN @278
== AC#WGIL4 IF ~Global("AC#W_FromDarokin","GLOBAL",1)~ THEN @279
== AC#WGIL4 @280
END
IF~PartyHasItem("AC#WSTYX")~THEN REPLY @281 EXTERN AC#WGIL4 interrupt_gildaar_styx
IF~~THEN REPLY @318 EXTERN AC#WMAR1 interrupt_gildaar_persuade_maretta
IF~~THEN REPLY @284 EXTERN AC#WGIL4 interrupt_gildaar_cast_spell
IF~~THEN REPLY @285 EXTERN AC#WGIL4 interrupt_gildaar_attack
IF~~THEN REPLY @286 EXTERN AC#WGIL4 not_true
		
	CHAIN AC#WMAR1 interrupt_gildaar_persuade_maretta
	@319
	END
	IF~~THEN REPLY @320 EXTERN AC#WGIL4 not_true
	IF~CheckStatGT(Player1,17,CHR)~THEN REPLY @321 EXTERN AC#WMAR1 persuade_maretta_success
	IF~CheckStatGT(Player1,17,INT)~THEN REPLY @324 EXTERN AC#WMAR1 persuade_maretta_success
	IF~~THEN REPLY @284 EXTERN AC#WGIL4 interrupt_gildaar_cast_spell
	IF~~THEN REPLY @285 EXTERN AC#WGIL4 interrupt_gildaar_attack
	IF~~THEN REPLY @286 EXTERN AC#WGIL4 not_true

	CHAIN AC#WMAR1 persuade_maretta_success
	@322
	== AC#WMAR1 @258
	DO ~CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
	CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
	CreateCreatureObject("AC#W44S1","AC#WGIL4",0,0,0)
	SetGlobal("Gildaar_Pathetic","AC#W44",1)~ EXIT
	
	CHAIN AC#WGIL4 interrupt_gildaar_cast_spell
	@282
	END
	IF~OR(2)
	HaveSpellParty(CLERIC_SILENCE_15_FOOT)
	HaveSpellParty(WIZARD_POWER_WORD_SILENCE)~THEN REPLY @311 EXTERN AC#WGIL4 gildaar_cast_spell_silence
	IF~PartyHasItem("SCRL7P")~THEN REPLY @312 EXTERN AC#WGIL4 gildaar_cast_spell_silence
	IF~PartyHasItem("MISC3L")~THEN REPLY @312 EXTERN AC#WGIL4 gildaar_cast_spell_silence
	IF~~THEN REPLY @283 EXTERN AC#WGIL4 not_true
	IF~~THEN REPLY @285 EXTERN AC#WGIL4 interrupt_gildaar_attack
	
		CHAIN AC#WGIL4 gildaar_cast_spell_silence
		@288
		DO ~SetGlobal("Gildaar_Silence","AC#W44",1)
		StartCutSceneMode()
		StartCutScene("AC#W44SC")~ EXIT
	
	CHAIN AC#WGIL4 interrupt_gildaar_attack
	@287
	DO ~SetGlobal("InterruptGildaar","AC#W44",1)
	Enemy()~ EXIT
	
	CHAIN AC#WGIL4 interrupt_gildaar_styx
	@288
	DO ~SetGlobal("InterruptGildaar","AC#W44",1)~ EXIT
	
	CHAIN AC#WGIL4 not_true
	@289
	== AC#WMAR1 @290
	== AC#WGIL4 @291
	END
	IF~PartyHasItem("AC#WSTYX")~THEN REPLY @281 EXTERN AC#WGIL4 interrupt_gildaar_styx
	IF~~THEN REPLY @318 EXTERN AC#WMAR1 interrupt_gildaar_persuade_maretta
	IF~~THEN REPLY @284 EXTERN AC#WGIL4 interrupt_gildaar_cast_spell
	IF~~THEN REPLY @285 EXTERN AC#WGIL4 interrupt_gildaar_attack
	IF~~THEN REPLY @325 EXTERN AC#WGIL4 no_way_back_all_hostile
	

	CHAIN AC#WGIL4 no_way_back_all_hostile
	@293
	== AC#WMAR1 @294
	== AC#WGIL4 @295
	== AC#WMAR1 @296 
	== AC#WGIL4 @263
	== AC#WMAR1 @264
	END
	IF~~THEN REPLY @265 EXTERN AC#WGIL4 dunno_what_gildaar_is_talking
	IF~~THEN REPLY @266 EXTERN AC#WGIL4 it_was_gilaar_to_free_waukeen
	IF~~THEN REPLY @267 EXTERN AC#WGIL4 yes_its_true_free_waukeen
	
	CHAIN AC#WGIL4 it_was_gilaar_to_free_waukeen
	@297
	== AC#WMAR1 @298
	== AC#WGIL4 @299
	== AC#WMAR1 @300
	END
	IF~~THEN EXTERN AC#WMAR1 after_gildaar_fight_all
	
	CHAIN AC#WGIL4 yes_its_true_free_waukeen
	@301
	== AC#WMAR1 @302
	== AC#WGIL4 @299
	== AC#WMAR1 @300
	END
	IF~~THEN EXTERN AC#WMAR1 after_gildaar_fight_all
	
	CHAIN AC#WGIL4 dunno_what_gildaar_is_talking
	@303
	== AC#WMAR1 @304
	== AC#WGIL4 @299
	== AC#WMAR1 @300
	END
	IF~~THEN EXTERN AC#WMAR1 after_gildaar_fight_all
// NPC Dialogues
		APPEND HAERDAJ
		IF ~~ THEN BEGIN haerdalis_painting
		SAY @305
		IF ~~ THEN EXTERN ~AC#WMAR1~ npc_reaction_painting_02
		END
		END	

		APPEND ~JANJ~
		IF ~~ THEN BEGIN jan_painting
		SAY @306
		IF ~~ THEN EXTERN ~AC#WMAR1~ npc_reaction_painting_02
		END
		END	

		APPEND ~JaheiraJ~
		IF ~~ THEN BEGIN jaheira_from_amn
		SAY @307
		IF ~~ THEN EXTERN ~AC#WMAR1~ from_amn_02 
		END
		END
						
		APPEND ~EdwinJ~
		IF ~~ THEN BEGIN edwin_from_amn
		SAY @308
		IF ~~ THEN EXTERN ~AC#WMAR1~ from_amn_02 
		END
		END		
