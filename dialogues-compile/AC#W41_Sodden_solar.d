/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialogues in Sodden Solar
***********************************************************************************************************************************************
**********************************************************************************************************************************************/
// Ormad Sulpar
BEGIN ~AC#W4ORM~

IF ~Global("AC#W_Ormad_Quest","GLOBAL",3)~ THEN BEGIN hello_have_soulcontracts
SAY @0
IF ~Global("Belthazaars_Contract","LOCALS",1)
		Global("Zhelamiss_Contract","LOCALS",1)
		Global("Zaehvielles_Contract","LOCALS",1)~ THEN REPLY @1 GOTO think_i_gave_you_all_contracts
IF~~THEN REPLY @2 + bye_keep_searching
IF ~PartyHasItem("AC#WGLDG")~ THEN REPLY @3 GOTO take_galbrezu_dagger
IF ~PartyHasItem("AC#WNIPW")~ THEN REPLY @4 GOTO take_nighthag_pillow
IF ~PartyHasItem("AC#WORM3")
Global("Belthazaars_Contract","LOCALS",0)~ THEN REPLY @5 DO ~TakePartyItem("AC#WORM3") DestroyItem("AC#WORM3") SetGlobal("Belthazaars_Contract","LOCALS",1)  AddJournalEntry(@410111,QUEST_DONE)~ GOTO got_contract
IF ~!PartyHasItem("AC#WORM3")
Global("Belthazaars_Contract","LOCALS",0)
OR(2)
Dead("AC#W40GB")
Dead("AC#W4GGB")~ THEN REPLY @246 GOTO belthazaar_dead_no_contract
IF ~PartyHasItem("AC#WORM2")
Global("Zaehvielles_Contract","LOCALS",0)~ THEN REPLY @6 DO ~TakePartyItem("AC#WORM2") DestroyItem("AC#WORM2") SetGlobal("Zaehvielles_Contract","LOCALS",1)~ GOTO got_contract
IF ~PartyHasItem("AC#WORM1")
Global("Zhelamiss_Contract","LOCALS",0)~ THEN REPLY @7 DO ~TakePartyItem("AC#WORM1") DestroyItem("AC#WORM1") SetGlobal("Zhelamiss_Contract","LOCALS",1)~ GOTO got_contract
IF~Global("AC#W_OrmadGlabrezu","GLOBAL",1)
!Dead("AC#W40GB")~THEN REPLY @8 + cancel_ormad
END

		IF ~~ THEN BEGIN belthazaar_dead_no_contract
		SAY @247
		IF ~PartyHasItem("AC#WORM3") Global("Belthazaars_Contract","LOCALS",0)~ THEN REPLY @5 DO ~TakePartyItem("AC#WORM3") DestroyItem("AC#WORM3") SetGlobal("Belthazaars_Contract","LOCALS",1)~ GOTO got_contract
		IF ~~ THEN REPLY @248 + belthazaar_dead_no_contract_else
		IF~~THEN REPLY @12 + bye_keep_searching		
		END
		
		IF ~~ THEN BEGIN belthazaar_dead_no_contract_else
		SAY @249
		IF ~PartyHasItem("AC#WGBRI")~ THEN REPLY @250 + belthazaar_dead_riddle
		IF~~THEN REPLY @12 + bye_keep_searching		
		END
		
		IF ~~ THEN BEGIN belthazaar_dead_riddle
		SAY @36
		IF ~~ THEN REPLY @37 GOTO belthazaar_dead_glab_riddle_01
		END
		
		IF ~~ THEN BEGIN belthazaar_dead_glab_riddle_01
		SAY @38
		=
		@39
		IF ~~ THEN REPLY @40 GOTO belthazaar_dead_glab_riddle_02 
		END
		
		IF ~~ THEN BEGIN belthazaar_dead_glab_riddle_02
		SAY @41
		IF ~~ THEN REPLY @42 GOTO belthazaar_dead_glab_riddle_03
		END

		IF ~~ THEN BEGIN belthazaar_dead_glab_riddle_03
		SAY @43
		IF ~~ THEN REPLY @44 DO ~SetGlobal("AC#W_OrmadGlabrezu","GLOBAL",2)
		EraseJournalEntry(@410103)
		AddJournalEntry(@410101,QUEST)~ GOTO belthazaar_dead_bye_keep_searching
		END

		IF ~~ THEN BEGIN belthazaar_dead_bye_keep_searching
		SAY @45
		IF ~~ THEN EXIT 
		END	
		
		IF ~~ THEN BEGIN take_nighthag_pillow
		SAY @9
		IF ~~ THEN REPLY @10 GOTO take_nighthag_pillow_02
		IF ~~ THEN REPLY @11 + what_else_contracts
		IF~~THEN REPLY @12 + bye_keep_searching		
		END
		
			IF ~~ THEN BEGIN take_nighthag_pillow_02
			SAY @13
			IF ~~ THEN REPLY @14 GOTO take_nighthag_pillow_03
			IF ~~ THEN REPLY @15 GOTO take_nighthag_pillow_03
			IF ~~ THEN REPLY @16 + what_else_contracts
			IF ~~ THEN REPLY @12 + bye_keep_searching	
			END
			
				IF ~~ THEN BEGIN take_nighthag_pillow_03
				SAY @17
				IF ~~ THEN DO ~TakePartyItem("AC#WNIPW")
				DestroyItem("AC#WNIPW")~ GOTO pillow_kill_ormad
				END
				
					IF ~~ THEN BEGIN pillow_kill_ormad
					SAY @18
					=
					@19
					=
					@20
					IF ~~ THEN DO ~SetInterrupt(FALSE)
					CreateItem("AC#WORMA",0,0,0)
					AddJournalEntry(@410001,QUEST)
					ReallyForceSpell(Myself,WIZARD_ENERGY_DRAIN)
					ReallyForceSpell(Myself,RED_HOLY_MIGHT) 
					SetGlobal("AC#W_NighthagKillOrmad","GLOBAL",5)
					AddexperienceParty(500)
					SetInterrupt(TRUE)
					Kill(Myself)~ EXIT 
					END
					
		IF ~~ THEN BEGIN take_galbrezu_dagger
		SAY @21
		IF ~~ THEN REPLY @22 GOTO take_galbrezu_dagger_02
		IF ~~ THEN REPLY @11 + what_else_contracts
		IF~~THEN REPLY @12 + bye_keep_searching		
		END
		
			IF ~~ THEN BEGIN take_galbrezu_dagger_02
			SAY @23
			IF ~~ THEN REPLY @24 GOTO take_galbrezu_dagger_03
			IF ~~ THEN REPLY @25 GOTO take_galbrezu_dagger_03
			IF ~~ THEN REPLY @16 + what_else_contracts
			IF ~~ THEN REPLY @12 + bye_keep_searching	
			END
			
				IF ~~ THEN BEGIN take_galbrezu_dagger_03
				SAY @17
				IF ~~ THEN DO ~TakePartyItem("AC#WGLDG")
				DestroyItem("AC#WGLDG")~ GOTO cut_dagger_01
				END
				
					IF ~~ THEN BEGIN cut_dagger_01
					SAY @26
					IF ~~ THEN DO ~SetInterrupt(FALSE)
					AddJournalEntry(@410006,QUEST)
					ApplyDamage(Myself,1,SLASHING)
					CreateItem("AC#WORMA",0,0,0)
					ReallyForceSpell(Myself,WIZARD_ENERGY_DRAIN)
					ReallyForceSpell(Myself,RED_HOLY_MIGHT) 
					SetGlobal("AC#W_GlabKillOrmad","GLOBAL",5)
					AddexperienceParty(500)
					SetInterrupt(TRUE)
					Kill(Myself)~ EXIT 
					END
		
		IF ~~ THEN BEGIN got_contract
		SAY @27
		IF ~OR(3)
		Global("Belthazaars_Contract","LOCALS",0)
		Global("Zhelamiss_Contract","LOCALS",0)
		Global("Zaehvielles_Contract","LOCALS",0)~ THEN GOTO what_else_contracts
		IF ~Global("Belthazaars_Contract","LOCALS",1)
		Global("Zhelamiss_Contract","LOCALS",1)
		Global("Zaehvielles_Contract","LOCALS",1)~ THEN GOTO have_all_contracts
		END
		
		IF ~~ THEN BEGIN what_else_contracts
		SAY @28
		IF ~PartyHasItem("AC#WORM3")
Global("Belthazaars_Contract","LOCALS",0)~ THEN REPLY @5 DO ~TakePartyItem("AC#WORM3") DestroyItem("AC#WORM3") SetGlobal("Belthazaars_Contract","LOCALS",1) AddJournalEntry(@410111,QUEST_DONE)~ GOTO got_contract
IF ~PartyHasItem("AC#WORM2")
Global("Zaehvielles_Contract","LOCALS",0)~ THEN REPLY @6 DO ~TakePartyItem("AC#WORM2") DestroyItem("AC#WORM2") SetGlobal("Zaehvielles_Contract","LOCALS",1)~ GOTO got_contract
		IF ~PartyHasItem("AC#WORM1")
Global("Zhelamiss_Contract","LOCALS",0)~ THEN REPLY @7 DO ~TakePartyItem("AC#WORM1") DestroyItem("AC#WORM1") SetGlobal("Zhelamiss_Contract","LOCALS",1)~ GOTO got_contract
		IF ~~ THEN REPLY @29 + think_i_gave_you_all_contracts
		IF~~THEN REPLY @2 + bye_keep_searching
		END	
		
		IF ~~ THEN BEGIN think_i_gave_you_all_contracts
		SAY @30
		IF ~OR(3)
		Global("Belthazaars_Contract","LOCALS",0)
		Global("Zhelamiss_Contract","LOCALS",0)
		Global("Zaehvielles_Contract","LOCALS",0)~ THEN GOTO nope_not_all_contracts
		IF ~Global("Belthazaars_Contract","LOCALS",1)
		Global("Zhelamiss_Contract","LOCALS",1)
		Global("Zaehvielles_Contract","LOCALS",1)~ THEN GOTO indeed_have_all_contracts
		END
		
			IF ~~ THEN BEGIN nope_not_all_contracts
			SAY @31
			IF~~THEN REPLY @32 + bye_keep_searching 
			END
		
			IF ~~ THEN BEGIN indeed_have_all_contracts
			SAY @33
			IF ~~ THEN GOTO have_all_contracts
			END

		IF ~~ THEN BEGIN have_all_contracts
		SAY @34
		IF ~~ THEN DO ~GiveItemCreate("AC#WORMA",LastTalkedToBy,1,0,0)
		EraseJournalEntry(@410000)
		AddJournalEntry(@410010,QUEST_DONE)~ GOTO bye_end
		END	

			IF ~~ THEN BEGIN bye_end
			SAY @35
			IF ~~ THEN DO ~SetGlobal("AC#W_Ormad_Quest","GLOBAL",10)
			EscapeArea()~ EXIT 
			END		

		IF ~~ THEN BEGIN cancel_ormad
		SAY @36
		IF ~~ THEN REPLY @37 GOTO glab_riddle_01
		END
		
		IF ~~ THEN BEGIN glab_riddle_01
		SAY @38
		=
		@39
		IF ~~ THEN REPLY @40 GOTO glab_riddle_02 
		END
		
		IF ~~ THEN BEGIN glab_riddle_02
		SAY @41
		IF ~~ THEN REPLY @42 GOTO glab_riddle_03
		END

		IF ~~ THEN BEGIN glab_riddle_03
		SAY @43
		IF ~~ THEN REPLY @44 DO ~SetGlobal("AC#W_OrmadGlabrezu","GLOBAL",2)
		EraseJournalEntry(@410100)
		AddJournalEntry(@410101,QUEST)~ GOTO bye_keep_searching
		END

		IF ~~ THEN BEGIN bye_keep_searching
		SAY @45
		IF ~~ THEN EXIT 
		END	
IF ~Global("AC#W_Ormad_Quest","GLOBAL",2)~ THEN BEGIN hello_01
SAY @46
IF ~~ THEN REPLY @47 GOTO whats_up
IF ~~ THEN REPLY @48 GOTO whats_up
IF ~~ THEN REPLY @49 + nope
END

	IF ~~ THEN BEGIN nope
	SAY @50
	IF ~~ THEN REPLY @51 GOTO whats_up
	IF ~~ THEN REPLY @52 GOTO bye_no_job
	END
	
		IF ~~ THEN BEGIN bye_no_job
		SAY @53
		IF ~~ THEN EXIT 
		END

	IF ~~ THEN BEGIN whats_up
	SAY @54
	IF ~~ THEN DO ~EraseJournalEntry(@400900)~ GOTO about_ormad
	END
	
		IF ~~ THEN BEGIN about_ormad
		SAY @55
		=
		@56
		IF ~~ THEN REPLY @57 GOTO soul_01
		END
		
			IF ~~ THEN BEGIN soul_01
			SAY @58
			IF ~~ THEN REPLY @59 GOTO convince_nighthag
			IF ~~ THEN REPLY @60 + continue_01
			END
			
				IF ~~ THEN BEGIN convince_nighthag
				SAY @61
				IF ~~ THEN GOTO continue_01
				END
				
					IF ~~ THEN BEGIN continue_01
					SAY @62
					IF ~~ THEN REPLY @63 GOTO continue_02 
					IF ~~ THEN REPLY @64 GOTO continue_02 
					END
					
						IF ~~ THEN BEGIN continue_02
						SAY @65
						IF ~~ THEN REPLY @66 GOTO continue_03
						IF ~~ THEN REPLY @67 GOTO continue_03
						IF ~~ THEN REPLY @68 GOTO continue_03
						END
						
							IF ~~ THEN BEGIN continue_03
							SAY @69
							IF ~~ THEN REPLY @70 GOTO things_get_worse
							IF ~~ THEN REPLY @71 GOTO things_get_worse
							END
							
								IF ~~ THEN BEGIN things_get_worse
								SAY @72
								IF ~~ THEN REPLY @73 GOTO things_get_worse_02
								IF ~~ THEN REPLY @74 GOTO things_get_worse_02
								END
								
									IF ~~ THEN BEGIN things_get_worse_02
									SAY @75
									IF ~~ THEN REPLY @76 GOTO sold_soul
									IF ~~ THEN REPLY @77 GOTO sold_soul
									END
									
										IF ~~ THEN BEGIN sold_soul
										SAY @78
										IF ~~ THEN REPLY @79 GOTO in_a_jam
										IF ~~ THEN REPLY @80 GOTO in_a_jam
										END
										
											IF ~~ THEN BEGIN in_a_jam
											SAY @81
											IF ~~ THEN REPLY @82 GOTO slay_all_fiends
											IF ~~ THEN REPLY @83 + steal_contracts
											END
											
												IF ~~ THEN BEGIN slay_all_fiends
												SAY @84
												IF ~~ THEN GOTO steal_contracts
												END
												
													IF ~~ THEN BEGIN steal_contracts
													SAY @85
													IF ~~ THEN REPLY @86 GOTO not_help
													IF ~~ THEN REPLY @87 + yes_help
													IF ~~ THEN REPLY @88 + yes_help
													IF ~~ THEN REPLY @89 + not_help
													END
													
														IF ~~ THEN BEGIN yes_help
														SAY @90
														IF ~~ THEN REPLY @91 GOTO i_will_be_back
														END
														
															IF ~~ THEN BEGIN i_will_be_back
															SAY @92
															IF ~~ THEN DO ~SetGlobal("AC#W_Ormad_Quest","GLOBAL",3)
															AddJournalEntry(@410000,QUEST)~ EXIT 
															END
													
														IF ~~ THEN BEGIN not_help
														SAY @93
														IF ~~ THEN REPLY @94 GOTO bye_no_job_02
														END
														
															IF ~~ THEN BEGIN bye_no_job_02
															SAY @95
															IF ~~ THEN EXIT
															END

IF ~Global("AC#W_Ormad_Quest","GLOBAL",0)~ THEN BEGIN 0
SAY @96
IF ~~ THEN EXIT
END

BEGIN ~AC#W41BK~

IF ~Global("Meckerei","LOCALS",1)~ THEN BEGIN 0
SAY @97
IF ~~ THEN DO ~SetGlobal("Meckerei","LOCALS",2)~ EXIT
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN hello_01
SAY @98 
IF ~~ THEN + taste_halfling_meat
IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN EXTERN ~MAZZYJ~ mazzy_halfling_meat
END

	IF ~~ THEN BEGIN taste_halfling_meat
	SAY @99
	IF ~~ THEN REPLY @100 GOTO pfui
	IF ~~ THEN REPLY @101 + drink
	IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @243 + search_nalfeshnee	
	++ @102 + bye
	END
IF ~True()~ THEN BEGIN hello_again
SAY @103
++ @104 + drink
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @243 + search_nalfeshnee
++ @102 + bye
END

	IF ~~ THEN BEGIN search_nalfeshnee
	SAY @244
	IF ~~ THEN EXIT 
	END

IF ~~ THEN BEGIN pfui 
SAY @105
++ @106 + bye
++ @107 + drink
END

IF ~~ THEN BEGIN drink
SAY @108
   IF ~~ THEN DO ~StartStore("AC#W41BK",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN bye
SAY @109
IF ~~ THEN EXIT 
END

// Beholder guest
BEGIN ~AC#W41BH~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @110
IF ~~ THEN REPLY @111 GOTO look_around 
END

	IF ~~ THEN BEGIN look_around
	SAY @112
	IF ~~ THEN EXIT 
	END

// Guy that tries to memorize all layers of the abyss
BEGIN ~AC#W48G1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @113
=
@114
=
@115
IF ~~ THEN REPLY @116 EXTERN ~AC#W48G2~ what_do_you_do 
IF ~~ THEN REPLY @117 + go_away_01
END

IF ~~ THEN BEGIN layer_cont_01
SAY @118
=
@119
IF ~~ THEN REPLY @120 EXTERN ~AC#W48G2~ memorize_01
END

IF ~~ THEN BEGIN go_away_01
SAY @121
IF ~~ THEN EXIT 
END

IF ~True()~ THEN BEGIN hello_1
SAY @122
IF ~~ THEN REPLY @123 GOTO what_layer_are_we_01
IF ~~ THEN REPLY @117 + go_away_02
END

	IF ~~ THEN BEGIN what_layer_are_we_01
	SAY @124
	IF ~~ THEN REPLY @125 GOTO go_away_02
	END

IF ~~ THEN BEGIN go_away_02
SAY @126
IF ~~ THEN EXIT 
END

// Grumpy dwarf besides the guy that tries to memorize all layers of the abyss
BEGIN ~AC#W48G2~

IF ~True()~ THEN BEGIN hello_0
SAY @127
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN what_do_you_do
SAY @128
IF ~~ THEN EXTERN ~AC#W48G1~ layer_cont_01
END

IF ~~ THEN BEGIN memorize_01
SAY @129
IF ~~ THEN REPLY @130 EXTERN ~AC#W48G1~ go_away_01
IF ~~ THEN REPLY @131 + whats_wrong_with_memorize
END

IF ~~ THEN BEGIN whats_wrong_with_memorize
SAY @132
IF ~~ THEN REPLY @130 EXTERN ~AC#W48G1~ go_away_01
IF ~~ THEN REPLY @133 GOTO why
END

IF ~~ THEN BEGIN why
SAY @134
IF ~~ THEN EXIT 
END


// Tanar'ruk
BEGIN ~ac#w41vr~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @135
IF ~~ THEN DO ~SetGlobal("ShamurzAttacks","AC#W41",1)
   Enemy()~ EXIT
END

BEGIN ~ac#w41t1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @136
++ @137 + wer
++ @138 EXIT
++ @139 + fight
END

IF ~~ THEN BEGIN wer
SAY @140
++ @141 + tiefling
END

IF ~~ THEN BEGIN tiefling
SAY @142
IF ~~ THEN EXTERN ~ac#w41t2~ blutkrieg
END

IF ~~ THEN BEGIN hier
SAY @143
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN fight
SAY @144
IF ~~ THEN DO ~Shout(111)
   Enemy()~ EXIT
END

BEGIN ~ac#w41t2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @145
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN blutkrieg
SAY @146
++ @147 EXTERN ~ac#w41t1~ hier
END

/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialog Warwick
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WWARW~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @148
++ @149 + kurz
++ @150 + kurz
++ @151 + ruhe
END

IF ~~ THEN BEGIN ruhe
SAY @152
   IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN kurz
SAY @153
=
@154
++ @155 + about_this_pace
++ @156 + guide_01
IF ~~ THEN REPLY @157 + warwick_portfolio 
++ @158 + ruhe
END

	IF ~~ THEN BEGIN guide_01
	SAY @159
	++ @155 + about_this_pace
	IF ~~ THEN REPLY @157 + warwick_portfolio 
	++ @158 + ruhe
	END

	IF ~~ THEN BEGIN about_this_pace
	SAY @160
	++ @156 + guide_01
	IF ~~ THEN REPLY @157 + warwick_portfolio 
	++ @158 + ruhe
	IF ~~ THEN REPLY @161 + come_back_later
	END
	
		IF ~~ THEN BEGIN come_back_later
		SAY @162
		IF ~Global("WarwickOffersKeys","LOCALS",0)~ THEN GOTO wait_a_moment_spellkeys
		IF ~Global("WarwickOffersKeys","LOCALS",1)~ THEN GOTO bye_02
		END
		
				IF ~~ THEN BEGIN wait_a_moment_spellkeys
				SAY @163
				IF ~~ THEN GOTO offer_spellkeys
				END
		
			IF ~~ THEN BEGIN warwick_portfolio
			SAY @164
			IF ~~ THEN REPLY @165 GOTO offer_spellkeys 
			IF ~~ THEN REPLY @166 + guidance_intro
			END
			
				IF ~~ THEN BEGIN guidance_intro
				SAY @167
				IF ~PartyGoldGT(99)~ THEN REPLY @168 + buy_guidance
				IF ~PartyGoldLT(100)~ THEN REPLY @169 + not_enough_gold_guidance
				IF ~~ THEN REPLY @49 GOTO bye_02
				IF ~~ THEN REPLY @170 GOTO bye_02 
				END
				
					IF ~~ THEN BEGIN buy_guidance
					SAY @171
					IF ~~ THEN DO ~TakePartyGold(100)
					DestroyGold(100)
					SetGlobal("WarwickGuidance","LOCALS",1)~ GOTO guidance_loop
					END
				
					IF ~~ THEN BEGIN not_enough_gold_guidance
					SAY @172
					IF ~~ THEN REPLY @173 GOTO where_make_money_no_guidance
					IF ~~ THEN REPLY @174 GOTO offer_spellkeys 
					IF ~~ THEN REPLY @175 GOTO bye_02
					END
					
						IF ~~ THEN BEGIN where_make_money_no_guidance
						SAY @176
						IF ~~ THEN REPLY @174 GOTO offer_spellkeys 
						IF ~~ THEN REPLY @175 GOTO bye_02
						END
	
IF ~True()~ THEN BEGIN hello_again
SAY @177
IF ~PartyGoldGT(4999)
Global("WarwickSpellKeys","AC#W41",0)
Global("WarwickOffersKeys","LOCALS",1)~ THEN REPLY @178 GOTO buy_spellkey
IF ~PartyGoldGT(4999)
GlobalGT("WarwickSpellKeys","AC#W41",0)
GlobalLT("WarwickSpellKeys","AC#W41",4)
Global("WarwickOffersKeys","LOCALS",1)~ THEN REPLY @179 GOTO need_more_spellkeys_yes 
IF ~PartyGoldGT(4999)
GlobalGT("WarwickSpellKeys","AC#W41",3)
Global("WarwickOffersKeys","LOCALS",1)~ THEN REPLY @179 GOTO need_more_spellkeys_no
IF ~Global("WarwickGuidance","LOCALS",1)~ THEN REPLY @180 + guidance_loop
IF ~Global("WarwickGuidance","LOCALS",0)~ THEN REPLY @181 + guidance_intro
IF ~~ THEN REPLY @182 GOTO bye_02
IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",1)
GlobalLT("AC#W_TharundarSoul","GLOBAL",10)
Global("Margrog_Bebilith","LOCALS",0)~ THEN REPLY @183 + margrog_disappeard
END

	IF ~~ THEN BEGIN margrog_disappeard
	SAY @184
	IF ~~ THEN REPLY @185 GOTO margrog_disappeard_02
	END
	
		IF ~~ THEN BEGIN margrog_disappeard_02
		SAY @186
		IF ~~ THEN REPLY @187 GOTO margrog_tracking
		END
		
			IF ~~ THEN BEGIN margrog_tracking
			SAY @188
			IF ~~ THEN GOTO margrog_exit
			END
			
				IF ~~ THEN BEGIN margrog_exit
				SAY @189
				IF ~~ THEN DO ~EraseJournalEntry(@470701)
				AddJournalEntry(@470702,QUEST)
				SetGlobal("AC#W_TharundarSoul","GLOBAL",3)
				SetGlobal("Margrog_Bebilith","LOCALS",1)~ EXIT 
				END


		IF ~~ THEN BEGIN guidance_loop
		SAY @190
		IF ~~ THEN REPLY @191 GOTO about_samora
		IF ~~ THEN REPLY @192 + samora_places
		IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @193 + search_margrog		
		IF ~GlobalGT("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @194 + about_margrog		
		IF ~Global("WarwickOffersKeys","LOCALS",0)~ THEN REPLY @195 + offer_spellkeys
		IF ~~ THEN REPLY @182 GOTO bye_02
		END	
		
			IF ~~ THEN BEGIN search_margrog
			SAY @196
			IF ~~ THEN REPLY @197 + guidance_loop
			IF ~~ THEN REPLY @182 GOTO bye_02
			END

			IF ~~ THEN BEGIN about_margrog
			SAY @198
			=
			@199
			IF ~~ THEN REPLY @197 + guidance_loop
			IF ~~ THEN REPLY @182 GOTO bye_02
			END
		
		IF ~~ THEN BEGIN samora_places
		SAY @200
		=
		@201
		=
		@202
		IF ~~ THEN REPLY @60 GOTO samora_places_02
		IF ~~ THEN REPLY @197 + guidance_loop
		IF ~~ THEN REPLY @182 GOTO bye_02
		END
		
		IF ~~ THEN BEGIN samora_places_02
		SAY @203
		=
		@204
		=
		@205
		IF ~~ THEN REPLY @197 + guidance_loop
		IF ~~ THEN REPLY @182 GOTO bye_02
		END
		
			IF ~~ THEN BEGIN about_samora
			SAY @206
			IF ~~ THEN REPLY @60 GOTO about_samora_02
			IF ~~ THEN REPLY @197 + guidance_loop
			IF ~~ THEN REPLY @182 GOTO bye_02
			END
			
			IF ~~ THEN BEGIN about_samora_02
			SAY @207 
			=
			@208
			IF ~~ THEN REPLY @60 GOTO about_samora_03
			IF ~~ THEN REPLY @197 + guidance_loop
			IF ~~ THEN REPLY @182 GOTO bye_02
			END

IF ~~ THEN BEGIN about_samora_03
SAY @209
=
@210
IF ~~ THEN REPLY @197 + guidance_loop
IF ~~ THEN REPLY @182 GOTO bye_02
END

IF ~~ THEN BEGIN need_more_spellkeys_no
SAY @211
IF ~~ THEN GOTO something_else
END

		IF ~~ THEN BEGIN need_more_spellkeys_yes
		SAY @212
		IF ~PartyGoldGT(4999)~ THEN REPLY @213 + buy_spellkey
		IF ~PartyGoldLT(5000)~ THEN REPLY @169 + not_enough_gold
		IF ~~ THEN REPLY @49 GOTO no_interest_bying
		IF ~~ THEN REPLY @170 GOTO no_interest_bying
		END
/*
IF ~~ THEN BEGIN ort
SAY ~Ich möchte Euch zunächst warnen, dass man hier schon viel über Euch und Eure Gruppe zu wissen scheint. Vor kurzem kam hier ein einzelner Reisender vorbei, der einigen Gästen in dieser Taverne von einer Gruppe Materier berichtete, die hier in Kürze eintreffen werden. Seine Beschreibung trifft ganz gut auf Euch zu, würde ich sagen. Nun ja, viele werden sich nicht mehr daran erinnern, doch dieser tote Glabrezu hier hat Euch sicher nicht grundlos angegriffen.~
++ ~Ich habe schon seit Betreten der Endlosen Stiege das Gefühl, dass mir jemand Steine in den Weg legen will. Wisst Ihr mehr über diesen Fremden?~ + warn
END

IF ~~ THEN BEGIN warn
SAY ~Nein, leider nicht. Nach seiner Sprache scheint er - ebenso wie Ihr- aus Toril zu stammen, aber das wisst Ihr ja wahrscheinlich schon. Seid einfach vorsichtig hier unten, versteht Ihr? Der Grund, warum Ihr hier seid, wird den Bewohnern dieser Ebene sicher nicht gefallen.~
++ ~Ihr wisst, warum ich hier bin? Woher? Hat dieser sonderbare Fremde etwas erzählt?~ + woher
++ ~Ich bin lediglich hier, um Handel zu treiben und Waffen zu kaufen. Was sollten die Dämonen dagegen haben?~ + handel
END

IF ~~ THEN BEGIN woher
SAY ~Der Fremde erwähnte lediglich, dass Ihr Spione seid, die hier einen wichtigen Auftrag ausführen müssten. Zusammen mit anderen Gerüchten, die ich hier so aufgeschnappt habe, kann ich mir denken, dass es um Graz'zts mysteriöse Gefangene geht, über die jeder in seinem Reich derzeit spricht.~
++ ~Jeder spricht darüber? Ich dachte, es sei ein Geheimnis?~ + secret
END

IF ~~ THEN BEGIN handel
SAY ~Ach <CHARNAME>, es hat keinen Sinn, mich anzulügen. Ich bin mir sicher, dass Ihr diese beschwerliche Reise hierher nicht aufgenommen habt, um ein bißchen einzukaufen. Zusammen mit den Dingen, die der fremde Materier sagte, habe ich mir ein Bild davon gemacht, was Eure wharen Absichten sind.~
++ ~Was hat dieser Mann über mich gesagt?~ + woher
END

IF ~~ THEN BEGIN secret
SAY ~Das Geheimnis ist lediglich, wer dieses Wesen ist und wo es sich momentan aufhält. Ansonsten prahlen die meisten Einwohner Azzagarats mit der Tatsache, dass Graz'zt in seinem Palast seit einiger Zeit 'Damenbesuch' hat.~
++ ~Dann hält sich dieser 'Gast' also in Graz'zts Palast auf?~ + palace
END

IF ~~ THEN BEGIN palace
SAY ~Das weiß ich nicht. Vielleicht, vielleicht auch nicht. Da gibt es die wildesten Gerüchte, zum Beispiel, dass Graz'zt Hochzeitspläne hat.~
IF ~~ THEN REPLY ~Wer in der Stadt könnte mehr über diese Gerüchte wissen?~ + who_knows_more
END

	IF ~~ THEN BEGIN who_knows_more
	SAY ~Ich seid also doch mehr als einfache Händler, was? An Eurer Stelle würde ich es einmal bei Margrog versuchen. Er ist zwar ein schmieriger Nalfeshnee, der mit allerlei Drogen handelt, kommt aber eine Menge in Graz'zts Reich herum. Sein "Haus" ist nicht zu übersehen, es ist dieses Ding auf Beinen im Westen der Stadt. Mit seinem Haus marschiert er regelmäßig durch ganz Azzagrat, und derzeit hat sich der Tanar'ri häuslich in Samora eingerichtet.~
	IF ~~ THEN GOTO sell_spellkeys
	END
*/	
	IF ~~ THEN BEGIN offer_spellkeys
	SAY @214
	IF ~~ THEN REPLY @215 GOTO not_mentioned_spell_failure
	IF ~~ THEN REPLY @216 GOTO not_mentioned_spell_failure
	END
	
		IF ~~ THEN BEGIN not_mentioned_spell_failure
		SAY @217
		IF ~~ THEN + not_mentioned_spell_failure_02
		IF ~InParty("valygar") !StateCheck("valygar",CD_STATE_NOTVALID)~ THEN EXTERN ~ValygarJ~ valygar_spell_failure
		END
		
		IF ~~ THEN BEGIN not_mentioned_spell_failure_02
		SAY @218		
		IF ~~ THEN DO ~AddJournalEntry(@400501,QUEST)
		SetGlobal("WarwickOffersKeys","LOCALS",1)~ GOTO sell_spellkeys_02
		END
	
		IF ~~ THEN BEGIN sell_spellkeys_02
		SAY @219
		IF ~~ THEN REPLY @220 GOTO spellkeys_loop_01
		END

		IF ~~ THEN BEGIN spellkeys_loop_01
		SAY @221
		IF ~PartyGoldGT(4999)~ THEN REPLY @222 + buy_spellkey
		IF ~PartyGoldLT(5000)~ THEN REPLY @169 + not_enough_gold
		IF ~~ THEN REPLY @223 + 5000_goldcoins_outrageous
		IF ~~ THEN REPLY @224 + how_do_spellkeys_work
		IF ~~ THEN REPLY @49 GOTO no_interest_bying
		IF ~~ THEN REPLY @170 GOTO no_interest_bying
		END
		
			IF ~~ THEN BEGIN 5000_goldcoins_outrageous
			SAY @225
			IF ~~ THEN GOTO spellkeys_loop_01
			END
			
			IF ~~ THEN BEGIN how_do_spellkeys_work
			SAY @226
			IF ~~ THEN REPLY @227 GOTO spellkeys_loop_01
			IF ~~ THEN REPLY @228 + spellkeys_priests
			END
			
				IF ~~ THEN BEGIN spellkeys_priests
				SAY @229
				IF ~~ THEN REPLY @230 GOTO powerkeys
				IF ~~ THEN REPLY @231 GOTO powerkeys
				IF ~~ THEN REPLY @232 GOTO spellkeys_loop_01
				END
				
					IF ~~ THEN BEGIN powerkeys
					SAY @233
					IF ~~ THEN REPLY @234 GOTO spellkeys_loop_01
					IF ~~ THEN REPLY @235 GOTO spellkeys_loop_01
					END
		
			IF ~~ THEN BEGIN no_interest_bying
			SAY @236
			IF ~~ THEN + something_else 
			END
			
			IF ~~ THEN BEGIN not_enough_gold
			SAY @172
			IF ~~ THEN REPLY @237 GOTO something_else
			END
			
			IF ~~ THEN BEGIN buy_spellkey
				SAY @238
				IF ~~ THEN DO ~TakePartyGold(5000)
				DestroyGold(5000)
				GiveItemCreate("AC#W_SK1",LastTalkedToBy,1,0,0)
				IncrementGlobal("WarwickSpellKeys","AC#W41",1)~ GOTO something_else
				END

IF ~~ THEN BEGIN something_else
SAY @239
IF ~~ THEN REPLY @240 GOTO bye_02
END	

	IF ~~ THEN BEGIN bye_02
	SAY @241
	IF ~~ THEN EXIT 
	END			

// NPC Dialogues
APPEND ~MAZZYJ~
IF ~~ THEN BEGIN mazzy_halfling_meat
   SAY @242
   IF ~~ THEN EXTERN AC#W41BK pfui
END
END

APPEND ~ValygarJ~
IF ~~ THEN BEGIN valygar_spell_failure
   SAY @245
   IF ~~ THEN EXTERN AC#WWARW not_mentioned_spell_failure_02
END
END




