/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in AC#W47
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WNAL1~

IF ~Global("TeleportAway","AC#W47",1)~ THEN BEGIN attacked_me_bye
SAY @271
IF ~~ THEN DO ~SetInterrupt(FALSE)
SetGlobal("TeleportAway","AC#W47",10)
CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(3)
PlaySound("PORTAL2")
SetInterrupt(TRUE)
DestroySelf()~ EXIT
END

IF ~GlobalGT("AC#W_AcidSwampQuest","GLOBAL",0)~ THEN BEGIN find_clyddis
SAY @0
IF ~~ THEN EXIT
END

IF ~Global("AC#W_Margrog_trouble","GLOBAL",2)~ THEN BEGIN hello_trouble
SAY @1
IF ~~ THEN REPLY @2 GOTO trouble_01
END

	IF ~~ THEN BEGIN trouble_01
	SAY @3
	IF ~Global("Talked_about_Verin","AC#W47",0)~ THEN GOTO verin_no_talk
	IF ~Global("Talked_about_Verin","AC#W47",1)~ THEN GOTO verin_told
	END

		IF ~~ THEN BEGIN verin_no_talk
		SAY @4
		IF ~~ THEN REPLY @5 + already_met_verin
		IF ~~ THEN REPLY @6 + trouble_02
		END
		
			IF ~~ THEN BEGIN already_met_verin
			SAY @7 			
			IF ~~ THEN GOTO trouble_02 
			END
				
	
		IF ~~ THEN BEGIN verin_told
		SAY @8
		IF ~~ THEN GOTO trouble_02
		END
		
			IF ~~ THEN BEGIN trouble_02
			SAY @9
			IF ~~ THEN GOTO about_traitor_acid_01
			END
		
			IF ~~ THEN BEGIN about_traitor_acid_01
			SAY @10
			//IF ~~ THEN REPLY ~Von so etwas hatte Maretta bereits gesprochen.~ GOTO about_acid_ponds_01
			IF ~~ THEN REPLY @11 GOTO about_acid_ponds_NEW
			END
				
				IF ~~ THEN BEGIN about_acid_ponds_NEW
				SAY @12
				IF ~~ THEN GOTO about_acid_ponds_NEW_portal
				END
				
					IF ~~ THEN BEGIN about_acid_ponds_NEW_portal
					SAY @13
					IF ~~ THEN REPLY @14 GOTO hunted_bebilith
					END
					
						IF ~~ THEN BEGIN hunted_bebilith
						SAY @15
						IF ~Global("Talked_about_Pentacle","AC#W47",0)~ THEN GOTO need_unknown_item
						IF ~Global("Talked_about_Pentacle","AC#W47",1)~ THEN GOTO need_pentacle
						END
						
								IF ~~ THEN BEGIN need_unknown_item
								SAY @16
								IF ~~ THEN REPLY @17 GOTO with_item_use_fiery_oven
								IF ~~ THEN REPLY @18 + maybe_pentacle
								END
								
									IF ~~ THEN BEGIN maybe_pentacle
									SAY @19
									IF ~~ THEN REPLY @20 GOTO dont_have_pentacle
									END
								
								IF ~~ THEN BEGIN need_pentacle
								SAY @21
								IF ~~ THEN REPLY @20 GOTO dont_have_pentacle
								END
							
									IF ~~ THEN BEGIN dont_have_pentacle
									SAY @22
									IF ~~ THEN DO ~~ GOTO with_item_use_fiery_oven
									END
							
							IF ~~ THEN BEGIN with_item_use_fiery_oven
							SAY @23
							IF ~!PartyHasItem("AC#WDVFT") ~ THEN DO ~AddJournalEntry(@400012,QUEST)~ GOTO about_clyddis
							IF ~PartyHasItem("AC#WDVFT") ~ THEN DO ~AddJournalEntry(@400013,QUEST)
							EraseJournalEntry(@400010)~ GOTO about_clyddis
							END
// OLD
/*		
			IF ~~ THEN BEGIN trouble_02
			SAY ~Ich sitze hier wie auf einem glühenden Baatezu-Arsch! Habt Ihr denn endlich herausgefunden, wie Ihr die Feueröfen benutzen könnt?~
			IF ~~ THEN REPLY ~Maretta gab mir das Amulett, mit dem ich die Öfen bereisen kann.~ GOTO have_real_pentacle
			END
			
				IF ~~ THEN BEGIN have_real_pentacle
				SAY ~Sie gab Euch das Amulett einfach so?~
				IF ~~ THEN REPLY ~Ich soll für sie einen Nabassu ausschalten.~ GOTO kill_nabassu
				END
				
					IF ~~ THEN BEGIN kill_nabassu
					SAY ~Vergesst den Nabassu! Ihr müsst jetzt schleunigst diese Göttin retten und dann von hier verschwinden!~
					IF ~~ THEN REPLY ~Ich weiß immer noch nicht, wie ich in das Gefängnis gelange!~ GOTO about_traitor_acid_01
					END
					
						IF ~~ THEN BEGIN about_traitor_acid_01
						SAY ~Ich erzählte Euch doch von meinem Kontaktmann, den sie geschnappt haben! Ich weiß jetzt, wo er sich befindet. In den Säuretümpeln von Yemach.~
						IF ~~ THEN REPLY ~Von so etwas hatte Maretta bereits gesprochen.~ GOTO about_acid_ponds_01
						END
*/						
							IF ~~ THEN BEGIN about_acid_ponds_01
							SAY @24
							IF ~~ THEN REPLY @25 GOTO about_acid_ponds_02
							END
							
								IF ~~ THEN BEGIN about_acid_ponds_02
								SAY @26
								IF ~~ THEN REPLY @27 GOTO find_traitor
								END
								
									IF ~~ THEN BEGIN find_traitor
									SAY @28
									IF ~~ THEN REPLY @29 GOTO what_ask_traitor
									IF ~~ THEN REPLY @30 GOTO about_clyddis
									IF ~~ THEN REPLY @31 GOTO about_clyddis
									/* Backup* - exit point */ //IF ~~ THEN EXIT 
									END
									
										IF ~~ THEN BEGIN what_ask_traitor
										SAY @32
										IF ~~ THEN GOTO about_clyddis
										END
										
											IF ~~ THEN BEGIN about_clyddis
											SAY @33
											IF ~~ THEN REPLY @34 GOTO why_not_kill_instantly
											END
											
												IF ~~ THEN BEGIN why_not_kill_instantly
												SAY @35
												IF ~~ THEN REPLY @36 GOTO Clyddis_knows_entry
												END
												
													IF ~~ THEN BEGIN Clyddis_knows_entry
													SAY @37
													IF ~~ THEN REPLY @38 GOTO ok_seek_clyddis
													IF ~~ THEN REPLY @272 GOTO ok_seek_clyddis
													IF ~~ THEN REPLY @273 GOTO ok_seek_clyddis
													END
													
														IF ~~ THEN BEGIN ok_seek_clyddis
														SAY @39
														IF ~~ THEN GOTO pact_with_tharundar
														END
														
															IF ~~ THEN BEGIN pact_with_tharundar
															SAY @40
															IF ~~ THEN REPLY @41 DO ~SetGlobal("AC#W_TharundarSoul","GLOBAL",1)
															AddJournalEntry(@470700,QUEST)~ GOTO promise_tharundar
															IF ~~ THEN REPLY @42 + besides_i_am_off
															IF ~~ THEN REPLY @43 + besides_i_am_off
															IF ~~ THEN REPLY @44 + besides_i_am_off
															END
															
																IF ~~ THEN BEGIN promise_tharundar
																SAY @45
																IF ~~ THEN REPLY @46 GOTO waukeen_would_not_accept_soul
																IF ~~ THEN REPLY @47 + his_soul_for_so_less
																IF ~~ THEN REPLY @48 + besides_i_am_off
																END
																
																IF ~~ THEN BEGIN his_soul_for_so_less
																SAY @49
																IF ~~ THEN REPLY @50 GOTO waukeen_would_not_accept_soul
																IF ~~ THEN REPLY @48 + besides_i_am_off
																END
																
																	IF ~~ THEN BEGIN waukeen_would_not_accept_soul
																	SAY @51
																	IF ~~ THEN REPLY @52 GOTO will_not_accept_it
																	IF ~~ THEN REPLY @48 + besides_i_am_off
																	END
																	
																		IF ~~ THEN BEGIN will_not_accept_it
																		SAY @53
																		IF ~~ THEN GOTO besides_i_am_off
																		END
																		
																			IF ~~ THEN BEGIN besides_i_am_off
																			SAY @54
																			IF ~~ THEN REPLY @55 GOTO you_coward
																			IF ~~ THEN REPLY @56 GOTO you_coward
																			IF ~~ THEN REPLY @57 GOTO leave_town_not_telling
																			END
																			
																				IF ~~ THEN BEGIN leave_town_not_telling
																				SAY @58
																				IF ~~ THEN GOTO wisest_decision
																				END
																			
																				IF ~~ THEN BEGIN you_coward
																				SAY @59
																				IF ~~ THEN GOTO wisest_decision
																				END
																				
																					IF ~~ THEN BEGIN wisest_decision
																					SAY @60
																					IF ~~ THEN GOTO bye_clyddis
																					END
																					
																						IF ~~ THEN BEGIN bye_clyddis
																						SAY @61
																						IF ~~ THEN DO ~SetGlobal("AC#W_AcidSwampQuest","GLOBAL",1)
																						SetGlobal("AC#W_Margrog_trouble","GLOBAL",10)
																						EraseJournalEntry(@470100)
																						EraseJournalEntry(@400011)~ EXIT 
																						END

IF ~Global("AC#W_Larva_quest","GLOBAL",6)~ THEN BEGIN hello_larva_dead
SAY @62
IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",10)~ GOTO do_not_deceive_me
END

	IF ~~ THEN BEGIN do_not_deceive_me
	SAY @63
	IF ~~ THEN REPLY @64 GOTO not_telling_you
	IF ~~ THEN REPLY @65 GOTO not_telling_you
	IF ~~ THEN REPLY @66 GOTO not_telling_you
	END
	
		IF ~~ THEN BEGIN not_telling_you
		SAY @67
		IF ~~ THEN REPLY @68 GOTO not_telling_you_02
		IF ~~ THEN REPLY @69 GOTO not_telling_you_02
		IF ~~ THEN REPLY @70 GOTO not_telling_you_02
		END
		
			IF ~~ THEN BEGIN not_telling_you_02
			SAY @71
			IF ~~ THEN GOTO about_waukeen_01
			END
				
					IF ~~ THEN BEGIN about_waukeen_01
					SAY @72
					IF ~~ THEN GOTO about_waukeen_02
					END
					
						IF ~~ THEN BEGIN about_waukeen_02
						SAY @73
						IF ~~ THEN GOTO about_waukeen_03
						END
						
							IF ~~ THEN BEGIN about_waukeen_03
							SAY @74
							IF ~~ THEN REPLY @75 + not_telling_you_03
							IF ~~ THEN REPLY @76 + not_telling_you_03
							IF ~~ THEN REPLY @77 + not_telling_you_03							
							END
			
			IF ~~ THEN BEGIN not_telling_you_03
			SAY @78
			IF ~~ THEN REPLY @79 GOTO tell_me_instantly
			IF ~~ THEN REPLY @80 GOTO tell_me_instantly
			IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN ~KeldorJ~ keldorn_not_deal_with_demons
			IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN EXTERN ~JaheiraJ~ jaheira_deal_with_demons
			IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN EXTERN ~AnomenJ~ anomen_deal_with_demons
			IF ~InParty("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN EXTERN ~ViconiJ~ viconia_deal_with_demons
			END				
							
				IF ~~ THEN BEGIN tell_me_instantly
				SAY @81
				IF ~~ THEN REPLY @82 GOTO no_choice
				IF ~~ THEN REPLY @83 GOTO no_choice
				IF ~~ THEN REPLY @84 GOTO no_choice
				END
				
					IF ~~ THEN BEGIN no_choice
					SAY @85
					IF ~~ THEN REPLY @86 GOTO dont_believe_you 
					IF ~~ THEN REPLY @87 GOTO dont_believe_you 
					IF ~~ THEN REPLY @88 GOTO baatezu_job_01 
					END
					
						IF ~~ THEN BEGIN dont_believe_you
						SAY @89
						IF ~~ THEN + baatezu_job_01
						END						
						
						IF ~~ THEN BEGIN baatezu_job_01
						SAY @90
						IF ~~ THEN REPLY @91 GOTO know_staircase
						IF ~~ THEN REPLY @92 + nope_staircase
						IF ~~ THEN REPLY @93 + nope_staircase
						END
						
								IF ~~ THEN BEGIN nope_staircase
								SAY @94
								IF ~~ THEN GOTO know_staircase
								END
						
							IF ~~ THEN BEGIN know_staircase
							SAY @95
							IF ~~ THEN GOTO baatezu_job_02
							END
							
							IF ~~ THEN BEGIN baatezu_job_02
							SAY @96
							IF ~~ THEN DO ~GiveItemCreate("AC#W30BZ",LastTalkedToBy,1,0,0)~ GOTO baatezu_job_03
							END
							
								IF ~~ THEN BEGIN baatezu_job_03
								SAY @97
								IF ~~ THEN REPLY @98 GOTO baatezu_job_accept
								IF ~~ THEN REPLY @99 + why_baatezu_not_own
								END
								
									IF ~~ THEN BEGIN why_baatezu_not_own
									SAY @100
									IF ~~ THEN REPLY @101 GOTO diff_to_use
									IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN EXTERN ~JaheiraJ~ jaheira_staircase_diff_to_use
									END									
									
										IF ~~ THEN BEGIN diff_to_use
										SAY @102										
										IF ~~ THEN GOTO diff_to_use_02 
										END
										
										IF ~~ THEN BEGIN diff_to_use_02
										SAY @103
										IF ~~ THEN REPLY @98 GOTO baatezu_job_accept
										END
										
											IF ~~ THEN BEGIN baatezu_job_accept
											SAY @104
											IF ~~ THEN DO ~EraseJournalEntry(@470003)
											AddJournalEntry(@470010,QUEST)
											SetGlobal("AC#W_BaatezuJob","GLOBAL",1)~ EXIT
											END

IF ~Global("AC#W_Larva_quest","GLOBAL",5)~ THEN BEGIN hello_see_larva
SAY @105
IF ~~ THEN DO ~AddJournalEntry(@470004,QUEST_DONE)~ GOTO what_about_larva
END

	IF ~~ THEN BEGIN what_about_larva
	SAY @106
	IF ~~ THEN REPLY @107 GOTO about_larva_01
	IF ~~ THEN REPLY @92 GOTO about_larva_01
	IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN ~KeldorJ~ keldorn_larva
	END	
		
			IF ~~ THEN BEGIN keldorn_right
			SAY @108
			IF ~~ THEN REPLY @109 GOTO about_larva_02
			IF ~~ THEN REPLY @92 GOTO about_larva_02
			IF ~~ THEN REPLY @110 GOTO about_larva_02
			END
			
	
		IF ~~ THEN BEGIN about_larva_01
		SAY @111
		IF ~~ THEN REPLY @109 GOTO about_larva_02
		IF ~~ THEN REPLY @92 GOTO about_larva_02
		IF ~~ THEN REPLY @110 GOTO about_larva_02
		END
		
			IF ~~ THEN BEGIN about_larva_02
			SAY @112
			IF ~~ THEN REPLY @113 GOTO why_do_you_tell_me
			IF ~~ THEN REPLY @114 GOTO listen_carefully
			IF ~~ THEN REPLY @115 GOTO listen_carefully
			END
			
				IF ~~ THEN BEGIN listen_carefully
				SAY @116
				IF ~~ THEN REPLY @117 GOTO demigod
				IF ~~ THEN REPLY @118 + doubts
				IF ~~ THEN REPLY @119 + doubts
				IF ~~ THEN REPLY @120 + doubts
				IF ~Alignment(Player1,MASK_GOOD)~ THEN REPLY @121 + doubts
				END
				
				IF ~~ THEN BEGIN why_do_you_tell_me
				SAY @122
				IF ~~ THEN REPLY @117 GOTO demigod
				IF ~~ THEN REPLY @118 + doubts
				IF ~~ THEN REPLY @119 + doubts
				END
				
					IF ~~ THEN BEGIN demigod
					SAY @123
					IF ~~ THEN GOTO doubts
					END
					
						IF ~~ THEN BEGIN doubts
						SAY @124
						IF ~~ THEN REPLY @125 + not_interested_about_larva
						IF ~~ THEN REPLY @126 + yes_tell_me_about_larva
						END
						
							IF ~~ THEN BEGIN yes_tell_me_about_larva
							SAY @127
							=
							@128
							IF ~~ THEN REPLY @129 GOTO not_interested_about_larva
							IF ~~ THEN REPLY @130 + yes_tell_me_about_larva_02
							END
							
								IF ~~ THEN BEGIN yes_tell_me_about_larva_02
								SAY @131
								=
								@132
								IF ~~ THEN REPLY @129 GOTO not_interested_about_larva
								IF ~~ THEN REPLY @130 + yes_tell_me_about_larva_03 
								END
								
									IF ~~ THEN BEGIN yes_tell_me_about_larva_03
									SAY @133
									=
									@134
									=
									@135
									=
									@136
									IF ~~ THEN EXTERN AC#W47LV larva_shaking 
									END																	
									
										IF ~~ THEN BEGIN yes_tell_me_about_larva_04
										SAY @137									
										IF ~~ THEN GOTO kill_larva 
										END
						
							IF ~~ THEN BEGIN not_interested_about_larva
							SAY @138
							IF ~~ THEN GOTO kill_larva 
							END
							
							IF ~~ THEN BEGIN kill_larva
							SAY @139
							IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",6)
							ForceSpell("AC#W47LV",CUTSCENE_POWERWORD_KILL)
							CreateVisualEffectObject("SPDEATH3","AC#W47LV")
							ActionOverride("AC#W47LV",DestroySelf())~ EXIT 
							END
					

// OLD: wiht description
/*
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @140
	=
	@141   
 IF ~~ THEN REPLY @142 + contact01
END
*/

// NEW: Wihtout description
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @141   
 IF ~~ THEN REPLY @142 + contact01
 IF ~~ THEN REPLY @270 + contact01
END

	IF ~~ THEN BEGIN contact01
	SAY @143
	=
	@144
	=
	@145
	IF ~~ THEN REPLY @146 GOTO nighthag01
	IF ~~ THEN REPLY @147 + tell_me_now
	END
	
		IF ~~ THEN BEGIN tell_me_now
		SAY @148
		IF ~~ THEN GOTO nighthag01
		END
		
		IF ~~ THEN BEGIN nighthag01
		SAY @149
		IF ~~ THEN REPLY @150 GOTO back_with_larva
		IF ~~ THEN REPLY @147 + tell_me_now
		IF ~~ THEN REPLY @151 + tell_me_now
		END
		
			IF ~~ THEN BEGIN back_with_larva
			SAY @152
			IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",1)
			AddJournalEntry(@400001,QUEST_DONE)
			AddJournalEntry(@470000,QUEST)~ EXIT 
			END

			IF ~~ THEN BEGIN give_larva
			SAY @153
			IF ~~ THEN DO ~SetGlobal("AC#W_Larva_quest","GLOBAL",5)
			TakePartyItem("AC#W40LV")
			DestroyItem("AC#W40LV")
			CreateCreature("AC#W47LV",[502.535],12)~ EXIT 
			END

			IF ~~ THEN BEGIN bye
			SAY @154
			IF ~~ THEN EXIT 
			END

IF ~True()~ THEN BEGIN hello_1
SAY @155
IF ~PartyHasItem("AC#W40LV")~ THEN REPLY @156 GOTO give_larva
IF ~Global("AC#W_BaatezuJob","GLOBAL",10)~ THEN REPLY @157 DO ~SetGlobal("AC#W_BaatezuJob","GLOBAL",20)~ + baatezu_job_done
IF ~~ THEN REPLY @158 + questions_01
IF ~~ THEN REPLY @159 + bye
END


	IF ~~ THEN BEGIN questions_01
	SAY @160
	IF ~GlobalGT("AC#W_Verin_dispute","GLOBAL",0)
	Global("Talked_about_Verin","AC#W47",0)~ THEN REPLY @161 DO ~SetGlobal("Talked_about_Verin","AC#W47",1)~ GOTO about_verin_01
	IF ~PartyHasItem("AC#WPNTG")~ THEN REPLY @162 + got_first_pentakle
	//IF ~Global("AC#WGildaarAbyss","GLOBAL",2)~ THEN REPLY ~(Margrog von Gildaar erzählen.) Wir haben ein Problem.~ + problem_gildaar
	IF ~~ THEN REPLY @163 + about_yourself
	IF ~GlobalGT("AC#W_Bloowar_quest","GLOBAL",0)~ THEN REPLY @164 + info_maretta
	IF ~~ THEN REPLY @165 + no_questions
	END
	
		IF ~~ THEN BEGIN info_maretta
		SAY @166
		=
		@167
		IF ~~ THEN REPLY @168 + questions_01
		IF ~~ THEN REPLY @159 + bye 
		END
	
		IF ~~ THEN BEGIN about_yourself
		SAY @169
		=
		@170
		=
		@171
		IF ~~ THEN REPLY @168 + questions_01
		IF ~~ THEN REPLY @172 + no_short_answer 
		IF ~~ THEN REPLY @159 + bye 
		END
		
			IF ~~ THEN BEGIN no_short_answer
			SAY @173
			IF ~~ THEN REPLY @168 + questions_01
			IF ~~ THEN REPLY @159 + bye 
			END
							
							
					

		IF ~~ THEN BEGIN no_questions
		SAY @174
		IF ~~ THEN EXIT 
		END
	
		IF ~~ THEN BEGIN got_first_pentakle
		SAY @175
		IF ~~ THEN REPLY @176 GOTO got_first_pentakle_02
		END
	
			IF ~~ THEN BEGIN got_first_pentakle_02
			SAY @177
			IF ~~ THEN REPLY @178 GOTO got_first_pentakle_03 
			END
			
				IF ~~ THEN BEGIN got_first_pentakle_03
				SAY @179
				IF ~~ THEN REPLY @168 + questions_01
				IF ~~ THEN REPLY @180 + bye 
				END
	
		IF ~~ THEN BEGIN about_verin_01
		SAY @181
		IF ~~ THEN REPLY @182 GOTO about_verin_02
		END
		
			IF ~~ THEN BEGIN about_verin_02
			SAY @183
			IF ~~ THEN GOTO about_verin_03
			END
			
				IF ~~ THEN BEGIN about_verin_03
				SAY @184
				IF ~~ THEN REPLY @168 + questions_01
				IF ~~ THEN REPLY @180 + bye
				END

	IF ~~ THEN BEGIN baatezu_job_done
	SAY @185
		IF ~~ THEN REPLY @186 GOTO baatezu_enemies_02
		IF ~~ THEN REPLY @187 GOTO bad_news
		IF ~~ THEN REPLY @188 GOTO bad_news
		END
		
			IF ~~ THEN BEGIN baatezu_enemies_02
			SAY @189			
			IF ~~ THEN GOTO bad_news
			END

			IF ~~ THEN BEGIN bad_news
			SAY @190
			IF ~~ THEN + that_cyric_priest
			END
			
				IF ~~ THEN BEGIN that_cyric_priest
				SAY @191
				=
				@192
				IF ~~ THEN GOTO clyddis_gone
				END
			
				IF ~~ THEN BEGIN clyddis_gone
				SAY @193
				IF ~~ THEN REPLY @194 GOTO about_fiery_oven_01
				IF ~~ THEN REPLY @195 GOTO wheres_clyddis_now
				IF ~~ THEN REPLY @196 GOTO wheres_clyddis_now
				IF ~~ THEN REPLY @197 GOTO move_on
				END

				/*
				IF ~~ THEN BEGIN not_a_fiend
				SAY ~Aber ich bin ja kein Unhold. Zumindest kein so Großer. Also passt auf, ich sage Euch nun, was ich über das Gefängnis der Göttin weiß.~
				IF ~~ THEN GOTO about_fiery_oven_01
				END
				*/

							IF ~~ THEN BEGIN about_fiery_oven_01
							SAY @198
							IF ~~ THEN REPLY @195 GOTO wheres_clyddis_now
							IF ~~ THEN REPLY @196 GOTO wheres_clyddis_now
							IF ~~ THEN REPLY @197 GOTO move_on
							END
							
								IF ~~ THEN BEGIN wheres_clyddis_now
								SAY @199
								IF ~~ THEN GOTO move_on
								END
								
									IF ~~ THEN BEGIN stupid_question
									SAY @200
									IF ~~ THEN REPLY @201 GOTO plan_fiery_oven
									IF ~~ THEN REPLY @202 + more_aid
									IF ~~ THEN REPLY @164 + about_maretta
									IF ~~ THEN REPLY @203 + about_fiery_ovens
									IF ~~ THEN REPLY @204 + about_waukeens_prison
									END
									
										IF ~~ THEN BEGIN about_waukeens_prison
										SAY @205
										IF ~~ THEN GOTO any_more_questions 
										END
									
										IF ~~ THEN BEGIN about_fiery_ovens
										SAY @206
										IF ~~ THEN GOTO any_more_questions
										END
										
										IF ~~ THEN BEGIN about_maretta
										SAY @166
										IF ~~ THEN GOTO any_more_questions
										END
									
										IF ~~ THEN BEGIN more_aid
										SAY @207
										IF ~~ THEN GOTO any_more_questions
										END
									
										IF ~~ THEN BEGIN plan_fiery_oven
										SAY @208
										IF ~~ THEN GOTO any_more_questions
										END
										
											IF ~~ THEN BEGIN any_more_questions
											SAY @209
											IF ~~ THEN REPLY @201 GOTO plan_fiery_oven
											IF ~~ THEN REPLY @202 + more_aid
											IF ~~ THEN REPLY @164 + about_maretta
											IF ~~ THEN REPLY @203 + about_fiery_ovens
											IF ~~ THEN REPLY @204 + about_waukeens_prison
											IF ~~ THEN REPLY @210 + move_on
											END
																							
													IF ~~ THEN BEGIN move_on
													SAY @211
													IF ~~ THEN REPLY @212 GOTO go_to_maretta
													IF ~~ THEN REPLY @213 GOTO go_to_maretta
													IF ~~ THEN REPLY @214 GOTO go_to_maretta
													IF ~~ THEN REPLY @215 GOTO go_to_maretta
													END
														
														IF ~~ THEN BEGIN go_to_maretta
														SAY @216
														IF ~~ THEN REPLY @217 GOTO to_counting_house
														IF ~~ THEN REPLY @218 GOTO to_counting_house
														END
														
															IF ~~ THEN BEGIN to_counting_house
															SAY @219
															IF ~~ THEN REPLY @220 GOTO how_should_i_do_that
															IF ~~ THEN REPLY @221 GOTO how_should_i_do_that
															END
															
																IF ~~ THEN BEGIN how_should_i_do_that
																SAY @222
																IF ~~ THEN REPLY @223 GOTO what_should_she_need
																IF ~~ THEN REPLY @224 + what_should_she_need
																IF ~~ THEN REPLY @225 + what_should_she_need
																END
																
																	IF ~~ THEN BEGIN what_should_she_need
																	SAY @226
																	IF ~~ THEN REPLY @227 + what_is_bloodwar
																	IF ~~ THEN REPLY @228 GOTO need_mercenaries
																	IF ~~ THEN REPLY @229 GOTO need_mercenaries
																	END
																	
																	IF ~~ THEN BEGIN what_is_bloodwar
																	SAY @230
																	IF ~~ THEN REPLY @228 GOTO need_mercenaries
																	IF ~~ THEN REPLY @229 GOTO need_mercenaries
																	END
																																	
																		IF ~~ THEN BEGIN need_mercenaries
																		SAY @231
																		IF ~~ THEN REPLY @232 GOTO bloodwar_proposal
																		IF ~~ THEN REPLY @233 GOTO bloodwar_proposal
																		IF ~~ THEN REPLY @234 GOTO bloodwar_proposal
																		END
																		
																			IF ~~ THEN BEGIN bloodwar_proposal
																			SAY @235																			
																			IF ~~ THEN REPLY @236 + two_possibilities
																			IF ~~ THEN REPLY @237 + two_possibilities
																			END
																			
																			IF ~~ THEN BEGIN two_possibilities
																			SAY @238
																			IF ~Global("AC#W_Samoras_Arena","GLOBAL",10)~ THEN REPLY @239 GOTO already_champion
																			IF ~GlobalLT("AC#W_Samoras_Arena","GLOBAL",10)~ THEN REPLY @240 GOTO where_is_arena																			
																			IF ~GlobalLT("AC#W_Samoras_Arena","GLOBAL",10)~ THEN REPLY @30 GOTO words_not_deeds																			
																			END
																			
																				IF ~~ THEN BEGIN where_is_arena
																				SAY @241
																				IF ~~ THEN REPLY @30 GOTO words_not_deeds
																				END
																			
																			IF ~~ THEN BEGIN words_not_deeds
																				SAY @242
																				IF ~~ THEN GOTO go_to_mefisto_maretta
																				END
																				
																				IF ~~ THEN BEGIN already_champion
																				SAY @243
																				=
																				@244
																				IF ~~ THEN DO ~SetGlobal("AC#W_Margrog_Mefisto","GLOBAL",20)
																					SetGlobal("AC#WGildaarAbyss","GLOBAL",3)		
																					EraseJournalEntry(@470011)
																					EraseJournalEntry(@110011)
																					AddJournalEntry(@110012,QUEST)
																					AddJournalEntry(@470503,QUEST)~ EXIT
																					END
																																						
																			IF ~~ THEN BEGIN go_to_mefisto_maretta
																			SAY @245
																					IF ~GlobalGT("AC#W_Met_Mefisto","GLOBAL",0)~ THEN REPLY @246 + yes_met_mefisto
																					IF ~~ THEN REPLY @247 GOTO no_not_met_mefisto
																					IF ~~ THEN REPLY @248 + no_not_met_mefisto
																					END
																			
																			IF ~~ THEN BEGIN no_not_met_mefisto
																			SAY @249
																			IF ~~ THEN GOTO about_mefisto_01
																			END
																			
																			IF ~~ THEN BEGIN yes_met_mefisto
																			SAY @250
																			IF ~~ THEN GOTO about_mefisto_01 
																			END

																			IF ~~ THEN BEGIN about_mefisto_01
																			SAY @251
																			IF ~~ THEN GOTO about_mefisto_02
																			END
																			
																				IF ~~ THEN BEGIN about_mefisto_02
																				SAY @252
																				IF ~~ THEN REPLY @253 + about_mefisto_03
																				IF ~~ THEN REPLY @254 + about_mefisto_03
																				END
																				
																					IF ~~ THEN BEGIN about_mefisto_03
																					SAY @255
																					=
																					@256
																					=
																					@257
																					/*IF ~~ THEN DO ~SetGlobal("AC#WGildaarAbyss","GLOBAL",3)
																					EraseJournalEntry(@110011)
																					AddJournalEntry(@110012,QUEST)~ EXIT*/
																					IF ~~ THEN REPLY @258 + bye_mefisto																					
																					IF ~~ THEN REPLY @259 + where_do_i_find_mefisto																					
																					END
																					
																						IF ~~ THEN BEGIN where_do_i_find_mefisto
																						SAY @260
																						IF ~~ THEN REPLY @261 + bye_mefisto
																						END
																			/*		
																			IF ~~ THEN BEGIN problem_gildaar
		SAY ~Nein, nicht *wir* haben ein Problem. Ihr habt ein Problem! Wie konntet Ihr nur so töricht sein und diesen Menschenpriester bis hierher gelangen lassen?~
		=
		~Lasst mich einmal nachdenken... Ihr wisst nicht, wo sich der Priester in Samora aufhält?~
		IF ~~ THEN REPLY ~Nein, das weiß ich nicht.~ GOTO problem_gildaar_02 
		END
		
			IF ~~ THEN BEGIN problem_gildaar_02
			SAY ~Dieser Mensch könnte überall sein! Wenn wir.. wenn *Ihr* Pech habt, liegt er schon bei Maretta, der Herrin Samoras, und flüstert ihr unsere - ich meine Eure - Pläne ins Ohr...~
			IF ~~ THEN GOTO gildaar_ask_mefisto
			END
			
				IF ~~ THEN BEGIN gildaar_ask_mefisto
				SAY ~Ihr solltet zu Mefisto gehen. Habt Ihr unseren Stadtschreier schon kennengelernt?~
						IF ~GlobalGT("AC#W_Met_Mefisto","GLOBAL",0)~ THEN REPLY @246 + yes_met_mefisto
						IF ~~ THEN REPLY @247 GOTO no_not_met_mefisto
						IF ~~ THEN REPLY @248 + no_not_met_mefisto
						END
						*/
																			/*
																				IF ~~ THEN BEGIN where_to_enlist
																				SAY ~Hier in Samora ist Garnuth, der Babau, der Rekrutierer. Er steht meist neben diesem großen Banner, das den Blutkrieg anpreist, etwas südlich von hier. Und er ist meistens auf der Suche nach Söldnern, weil ständig irgendwo in Azzagrat die Hölle brennt.~
																				IF ~~ THEN GOTO meet_babau
																				END
																				
																					IF ~~ THEN BEGIN meet_babau
																					SAY ~Wendet Euch an ihn, schließt Euren Einsatz glorreich ab und sprecht bei Maretta vor. Sobald Ihr ihr Vertrauen gewonnen habt, trefft mich wieder. Ich versuche derweil, herauszufinden, ob mein Informant noch lebt, damit wir bei der Benutzung der Feueröfen weiterkommen können.~
																					IF ~~ THEN DO ~SetGlobal("AC#W_Bloowar_quest","GLOBAL",1)
																					EraseJournalEntry(@470011)
																					AddJournalEntry(@470020,QUEST)~ GOTO something_else 
																					END
																					
																					
																						IF ~~ THEN BEGIN something_else
																						SAY ~Was denn noch? Verschwindet von hier, bevor die Lanzenträger der Herrin noch Verdacht schöpfen!~
																						//IF ~Global("AC#WGildaarAbyss","GLOBAL",2)~ THEN REPLY ~(Margrog von Gildaar erzählen.) Wir haben ein Problem.~ + problem_gildaar
																						IF ~~ THEN REPLY ~Ist ja gut, ich gehe ja schon.~ GOTO bye_mefisto
																						END
																					*/	
																							IF ~~ THEN BEGIN bye_mefisto
																							SAY @262
																							IF ~~ THEN DO ~SetGlobal("AC#W_Margrog_Mefisto","GLOBAL",1)
																					SetGlobal("AC#WGildaarAbyss","GLOBAL",3)		
																					EraseJournalEntry(@470011)
																					EraseJournalEntry(@110011)
																					AddJournalEntry(@110012,QUEST)
																					AddJournalEntry(@470500,QUEST)
																							~ EXIT
																							END
		
// Larva soul food
BEGIN ~AC#W47LV~

IF ~~ THEN BEGIN larva_shaking
SAY @263
IF ~~ THEN EXTERN AC#WNAL1 yes_tell_me_about_larva_04
END

// NPC Dialogues
	APPEND ~KeldorJ~
	IF ~~ THEN BEGIN keldorn_larva
	SAY @264
	IF ~~ THEN EXTERN ~AC#WNAL1~ keldorn_right
	END
	
	IF ~~ THEN BEGIN keldorn_not_deal_with_demons
	SAY @265
	IF ~~ THEN EXTERN ~AC#WNAL1~  tell_me_instantly
	END			
	END
	
	APPEND ~JaheiraJ~
	IF ~~ THEN BEGIN jaheira_deal_with_demons
	SAY @266
	IF ~~ THEN EXTERN ~AC#WNAL1~ tell_me_instantly 
	END
	
	IF ~~ THEN BEGIN jaheira_staircase_diff_to_use
	SAY @267
	IF ~~ THEN EXTERN ~AC#WNAL1~ diff_to_use_02 
	END
	END
				
	APPEND ~ViconiJ~
	IF ~~ THEN BEGIN viconia_deal_with_demons
	SAY @268
	IF ~~ THEN EXTERN ~AC#WNAL1~ tell_me_instantly 
	END
	END
				
	APPEND ~AnomenJ~
	IF ~~ THEN BEGIN anomen_deal_with_demons
	SAY @269
	IF ~~ THEN EXTERN ~AC#WNAL1~ tell_me_instantly 
	END
	END
