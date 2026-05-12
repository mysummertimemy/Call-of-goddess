/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Abyssal Plains (AC#W50)
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
// tree of cowards
BEGIN ~AC#W50C1~
// quest_finished
CHAIN IF ~Global("Tree_Cowards_courage","AC#W50",10)~ THEN AC#W50C1 hello_nothing_more_to_say
@60
EXIT

// when remove fear is cast
CHAIN IF ~Global("Tree_Cowards_courage","AC#W50",2)~ THEN AC#W50C1 hello_cast_fear
@61
END
IF~~THEN EXTERN AC#W50C1 give_horn

	CHAIN AC#W50C1 give_horn
	@62
	DO ~SetGlobal("Tree_Cowards_courage","AC#W50",10)
	ChangeEnemyAlly(Myself,NEUTRAL)
	ActionOverride("Bloodtree_Container",CreateItem("AC#W50TH",0,0,0))
	AddJournalEntry(@470041,QUEST)~ EXIT
	
// before remove fear is cast
CHAIN IF ~Global("Tree_Cowards_courage","AC#W50",1)~ THEN AC#W50C1 hello_please_remove_fear
@63
EXIT

// proposal not accepted yet
CHAIN IF ~Global("Tree_Proposal","AC#W50",1)~ THEN AC#W50C1 hello_proposal
@64
END
IF~~THEN EXTERN AC#W50C1 deal_courage

// initial dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W50C1 hello_0
@65
=
@66
END
IF~~THEN REPLY @67 EXTERN AC#W50C1 who_are_you
IF~~THEN REPLY @68 EXTERN AC#W50C1 who_are_you
IF~~THEN REPLY @69 EXTERN AC#W50C1 who_are_you
IF~~THEN REPLY @70 EXTERN AC#W50C1 bye
	
	CHAIN AC#W50C1 who_are_you
	@71
	END
	IF~~THEN REPLY @72 EXTERN AC#W50C1 tree_of_cowards
	IF~~THEN REPLY @73 EXTERN AC#W50C1 tree_of_cowards
	IF~~THEN REPLY @70 EXTERN AC#W50C1 bye
	
	CHAIN AC#W50C1 tree_of_cowards
	@74
	END
	IF~~THEN REPLY @75 EXTERN AC#W50C1 what_have_you_done
	IF~~THEN REPLY @76 EXTERN AC#W50C1 get_free
	IF~Global("Tree_Bebilith","AC#W50",0)~THEN REPLY @77 EXTERN AC#W50C1 search_bebilith
	IF~~THEN REPLY @70 EXTERN AC#W50C1 bye
	
	CHAIN IF ~~ THEN AC#W50C1 what_have_you_done
	@78
	END
	IF~~THEN REPLY @76 EXTERN AC#W50C1 get_free
	IF~Global("Tree_Bebilith","AC#W50",0)~THEN REPLY @77 EXTERN AC#W50C1 search_bebilith
	IF~~THEN REPLY @70 EXTERN AC#W50C1 bye
	
	CHAIN AC#W50C1 get_free
	@79
	END
	IF~~THEN REPLY @75 EXTERN AC#W50C1 what_have_you_done
	IF~~THEN REPLY @80 EXTERN AC#W50C1 help_to_get_free
	IF~Global("Tree_Bebilith","AC#W50",0)~THEN REPLY @77 EXTERN AC#W50C1 search_bebilith
	IF~~THEN REPLY @70 EXTERN AC#W50C1 bye
	
		CHAIN AC#W50C1 help_to_get_free
		@81
		END
		IF~~THEN REPLY @75 EXTERN AC#W50C1 what_have_you_done
		IF~Global("Tree_Bebilith","AC#W50",0)~THEN REPLY @77 EXTERN AC#W50C1 search_bebilith
		IF~~THEN REPLY @70 EXTERN AC#W50C1 bye

	CHAIN AC#W50C1 search_bebilith
	@82
	=
	@83
	END
	IF~~THEN REPLY @84 DO ~SetGlobal("Tree_Bebilith","AC#W50",1)~ EXTERN AC#W50C1 search_bebilith_02
	
		CHAIN AC#W50C1 search_bebilith_02
		@85
		=
		@86
		END
		IF~~THEN REPLY @87 EXTERN AC#W50C1 where_did_bebilith_come_from
		
			CHAIN AC#W50C1 where_did_bebilith_come_from
			@88
			END
			IF~~THEN REPLY @89 EXTERN AC#W50C1 search_bebilith_portal
			
				CHAIN AC#W50C1 search_bebilith_portal
				@90
				END
				IF~~THEN REPLY @91 EXTERN AC#W50C1 open_bebilith_portal
				IF~~THEN REPLY @92 EXTERN AC#W50C1 open_bebilith_portal

					CHAIN AC#W50C1 open_bebilith_portal
					@93
					END
					IF~~THEN REPLY @94 EXTERN AC#W50C1 open_bebilith_portal_02
					IF~~THEN REPLY @95 EXTERN AC#W50C1 wait_infrontof_bebilith_portal_01
					
						CHAIN AC#W50C1 wait_infrontof_bebilith_portal_01
						@96
						END
						IF~~THEN REPLY @94 EXTERN AC#W50C1 open_bebilith_portal_02
					
						CHAIN AC#W50C1 open_bebilith_portal_02
						@97
						END
						IF~~THEN REPLY @98 EXTERN AC#W50C1 open_bebilith_portal_03

							CHAIN AC#W50C1 open_bebilith_portal_03
							@99
							END
							IF~~THEN REPLY @100 EXTERN AC#W50C1 how_do_you_know_about_portal
							IF~~THEN REPLY @101 EXTERN AC#W50C1 where_do_i_find_tanarri
							
							CHAIN AC#W50C1 how_do_you_know_about_portal
							@102
							END
							IF~~THEN REPLY @103 EXTERN AC#W50C1 where_do_i_find_tanarri
							
							CHAIN AC#W50C1 where_do_i_find_tanarri
							@104
							END
							IF~~THEN REPLY @105 EXTERN AC#W50C1 where_do_i_find_tanarri_02
							IF~~THEN REPLY @106 EXTERN AC#W50C1 where_do_i_find_tanarri_02
							IF~~THEN REPLY @107 EXTERN AC#W50C1 where_do_i_find_tanarri_02
							
								CHAIN AC#W50C1 where_do_i_find_tanarri_02
								@108
								END
								IF~~THEN EXTERN AC#W50C1 we_want_courage
								
									CHAIN AC#W50C1 we_want_courage
									@109 
									END
									IF~~THEN EXTERN AC#W50C1 propose_courage
									
									CHAIN AC#W50C1 propose_courage
									@110
									END
									IF~~THEN DO ~SetGlobal("Tree_Proposal","AC#W50",1)~ EXTERN AC#W50C1 deal_courage
									
										CHAIN AC#W50C1 deal_courage
										@111
										END
										IF~~THEN REPLY @112 EXTERN AC#W50C1 deal_courage_what_item
										IF~~THEN REPLY @113 EXTERN AC#W50C1 ok_deal_courage
										IF~~THEN REPLY @114 EXTERN AC#W50C1 bye
										
											CHAIN AC#W50C1 deal_courage_what_item
											@115
											END
											IF~~THEN EXTERN AC#W50C1 deal_courage

											CHAIN AC#W50C1 ok_deal_courage
											@116
											DO ~SetGlobal("Tree_Cowards_courage","AC#W50",1)
											SetGlobal("Tree_Proposal","AC#W50",10)
											DestroyItem("INVULNER")
											DestroyItem("RING97")
											ChangeEnemyAlly(Myself,GOODBUTBLUE)
											AddJournalEntry(@470043,QUEST)~ EXIT
	
CHAIN IF ~True()~ THEN AC#W50C1 hello_again
@117
END
IF~~THEN EXTERN AC#W50C1 who_are_you
						
	CHAIN AC#W50C1 bye
	@118
	EXIT


// Disguised Maurezhi

BEGIN ~AC#W50M1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @0
IF ~~ THEN EXIT 
END

// Annia Graystockings

BEGIN ~AC#W#AG1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @1 
   IF ~~ THEN REPLY @2 + i_am_annia
   IF ~~ THEN REPLY @3 + did_not_expect
   IF ~~ THEN REPLY @4 + atrocity
END

		IF ~~ THEN BEGIN atrocity
		SAY @5
		IF ~~ THEN GOTO i_am_annia
		END
		
		IF ~~ THEN BEGIN did_not_expect
		SAY @6
		IF ~~ THEN GOTO i_am_annia
		END

	IF ~~ THEN BEGIN i_am_annia
	SAY @7
	IF ~~ THEN REPLY @8 GOTO paladin_alone
	END
	
		IF ~~ THEN BEGIN paladin_alone
		SAY @9
		IF ~~ THEN REPLY @10 GOTO what_happened_to_comrades
		END
		
			IF ~~ THEN BEGIN what_happened_to_comrades
			SAY @11
			IF ~~ THEN REPLY @12 GOTO about_bodaks_01
			IF ~~ THEN REPLY @13 GOTO about_bodaks_01
			IF ~~ THEN REPLY @14 GOTO about_bodaks_01
			IF ~~ THEN REPLY @15 GOTO about_bodaks_01
			END
			
				IF ~~ THEN BEGIN about_bodaks_01
				SAY @16
				=
				@17
				IF ~Global("Opened_Bebilith_Portal","AC#W50",0)~ THEN REPLY @119 GOTO about_bebilith_01
				IF ~~ THEN REPLY @54 GOTO on_my_way
				END

					IF ~~ THEN BEGIN about_bebilith_01
					SAY @18
					IF ~~ THEN REPLY @19 GOTO about_bebilith_02
					IF ~~ THEN REPLY @20 GOTO what_kind_of_fiend
					END
					
							IF ~~ THEN BEGIN what_kind_of_fiend
							SAY @21
							IF ~~ THEN REPLY @19 GOTO about_bebilith_02
							END
					
						IF ~~ THEN BEGIN about_bebilith_02
						SAY @22						
						IF ~~ THEN GOTO about_bebilith_03 
						END
						
						IF ~~ THEN BEGIN about_bebilith_03
						SAY @23
						IF ~~ THEN GOTO bebilith_portal
						END
						
							IF ~~ THEN BEGIN bebilith_portal
							SAY @24
							IF ~~ THEN REPLY @25 GOTO bebilith_portal_02 
							IF ~~ THEN REPLY @26 GOTO bebilith_portal_access 
							END
							
								IF ~~ THEN BEGIN bebilith_portal_access
								SAY @27
								IF ~~ THEN REPLY @25 GOTO bebilith_portal_02 
								IF ~~ THEN REPLY @54 GOTO on_my_way								
								END
							
								IF ~~ THEN BEGIN bebilith_portal_02
								SAY @28
								// IF ~~ THEN REPLY @29 GOTO demon_horn //old
								IF ~~ THEN REPLY @120 GOTO lets_move_on
								IF ~GlobalGT("Tree_Bebilith","AC#W50",0)~ THEN REPLY @121 GOTO lets_move_on
								IF ~~ THEN REPLY @54 GOTO on_my_way
								END
								
								IF ~~ THEN BEGIN lets_move_on
								SAY @122
								IF ~~ THEN REPLY @54 GOTO on_my_way
								END
								/*
									IF ~~ THEN BEGIN demon_horn
									SAY @30
									IF ~~ THEN REPLY @31 GOTO get_horn
									END
									
										IF ~~ THEN BEGIN get_horn
										SAY @32
										IF ~~ THEN DO ~GiveItem("AC#W50TH",LastTalkedToBy)~ GOTO good_luck 
										END
										
											IF ~~ THEN BEGIN good_luck
											SAY @33
											IF ~~ THEN REPLY @34 + work_together
											IF ~~ THEN REPLY @35 GOTO what_plans
											IF ~~ THEN REPLY @36 + about_infinite_staircase
											IF ~~ THEN REPLY @37 + bye
											END
											*/
											IF ~~ THEN BEGIN on_my_way
											SAY @55
											IF ~~ THEN REPLY @34 + work_together
											IF ~~ THEN REPLY @35 GOTO what_plans
											IF ~~ THEN REPLY @36 + about_infinite_staircase
											IF ~~ THEN REPLY @37 + bye
											END
											
											IF ~~ THEN BEGIN work_together
											SAY @38											
											IF ~~ THEN REPLY @39 GOTO work_together_02
											IF ~~ THEN REPLY @35 GOTO what_plans
											IF ~~ THEN REPLY @36 + about_infinite_staircase
											IF ~~ THEN REPLY @37 + bye
											END
											
													IF ~~ THEN BEGIN work_together_02
													SAY @40
													IF ~~ THEN REPLY @35 GOTO what_plans
													IF ~~ THEN REPLY @36 + about_infinite_staircase
													IF ~~ THEN REPLY @37 + bye
													END
											
												IF ~~ THEN BEGIN what_plans
												SAY @41
												IF ~~ THEN REPLY @36 + about_infinite_staircase
												IF ~~ THEN REPLY @42 + bye
												END
												
												IF ~~ THEN BEGIN about_infinite_staircase
												SAY @43
												IF ~~ THEN REPLY @44 GOTO about_infinite_staircase_02 
												END
												
													IF ~~ THEN BEGIN about_infinite_staircase_02
													SAY @45
													IF ~~ THEN REPLY @46 GOTO to_samora
													IF ~~ THEN REPLY @47 GOTO to_samora
													IF ~~ THEN REPLY @48 GOTO to_samora
													END
													
														IF ~~ THEN BEGIN to_samora
														SAY @49
														IF ~~ THEN REPLY @50 GOTO to_samora_02
														IF ~~ THEN REPLY @51 GOTO to_samora_02
														END
														
															/*
															IF ~~ THEN BEGIN to_samora_02
															SAY @52
															IF ~~ THEN DO ~SetGlobal("AC#W_Annia_Staircase","GLOBAL",1)
															AddJournalEntry(@500000,INFO)~ GOTO bye
															END
															*/
															
															IF ~~ THEN BEGIN to_samora_02
															SAY @52
															IF ~~ THEN DO ~SetGlobal("AC#W_Annia_Staircase","GLOBAL",1)~ GOTO bye
															END
												
														IF ~~ THEN BEGIN bye
														SAY @53
														IF ~~ THEN DO ~EscapeArea()~ EXIT 
														END
