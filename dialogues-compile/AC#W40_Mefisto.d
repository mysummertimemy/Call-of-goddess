/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialoge with Mefisto, Graz'zt's town crier in Samora when Waukeen is free
***********************************************************************************************************************************************
**********************************************************************************************************************************************/
BEGIN ~AC#W40M2~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40M2 hello_01
@0
END
IF ~GlobalGT("Mefisto_Talk","AC#W40",0)~ THEN REPLY @1 EXTERN AC#W40M2 02
IF ~~ THEN REPLY @2 EXTERN AC#W40M2 switch_sides
IF ~~ THEN REPLY @3 EXTERN AC#W40M2 02

CHAIN IF ~~ THEN AC#W40M2 switch_sides
@4
= @5
END
IF ~~ THEN EXTERN AC#W40M2 fight

CHAIN IF ~~ THEN AC#W40M2 02
@6
END
IF ~~ THEN EXTERN AC#W40M2 fight

CHAIN IF ~~ THEN AC#W40M2 fight
@7
DO ~CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(3)
PlaySound("PORTAL2")
DestroySelf()~ EXIT

/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialoge with Mefisto, Graz'zt's town crier in Samora
***********************************************************************************************************************************************
**********************************************************************************************************************************************/

BEGIN ~AC#W#MEF~

IF ~Global("AC#WMefisto_helps_Gildaar","GLOBAL",10)~ THEN BEGIN hello_proceed_gildaar_styx
SAY @8
= 
@9
IF ~~ THEN REPLY @10 GOTO chain_gildaar_styx_02
IF ~~ THEN REPLY @11 GOTO chain_gildaar_styx_02
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @12 
IF ~~ THEN REPLY @13 + town_crier
IF ~~ THEN REPLY @14 + were_lucky
IF ~~ THEN REPLY @15 + were_lucky
IF ~Global("AC#W_Margrog_Mefisto","GLOBAL",1)~ THEN REPLY @16 + were_lucky
END

	IF ~~ THEN BEGIN town_crier
	SAY @17
	IF ~~ THEN GOTO were_lucky 
	IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID) Global("AerieMetMefisto","LOCALS",0)~ THEN EXTERN ~AerieJ~ aerie_mefisto
	IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID) Global("HaerdalisMetMefisto","LOCALS",0)~ THEN EXTERN HAERDAJ haerdalis_mefisto
	END	
	
	
	
	IF ~~ THEN BEGIN were_lucky
	SAY @18 
	IF ~~ THEN GOTO lovely_day
	IF ~InParty("aerie") !StateCheck("aerie",CD_STATE_NOTVALID) Global("AerieMetMefisto","LOCALS",0)~ THEN EXTERN ~AerieJ~ aerie_mefisto
	IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID) Global("HaerdalisMetMefisto","LOCALS",0)~ THEN EXTERN HAERDAJ haerdalis_mefisto
	END
			
	IF ~~ THEN BEGIN lovely_day
	SAY @19
	IF ~~ THEN REPLY @20 GOTO one_moment 
	IF ~~ THEN REPLY @15 GOTO one_moment 
	IF ~Global("AC#W_Margrog_Mefisto","GLOBAL",1)~ THEN REPLY @16 GOTO one_moment 
	END

		IF ~~ THEN BEGIN one_moment
		SAY @21
		IF ~~ THEN DO ~SetGlobal("AC#W_Met_Mefisto","GLOBAL",1)
		SetGlobal("Mefisto_Talk","AC#W40",1)
		CreateCreatureObjectOffset("AC#W40BR",LastTalkedToBy,[10.10])~ EXIT 
		END


IF ~Global("Mefisto_Talk","AC#W40",2)~ THEN BEGIN hello_02
SAY @22
IF ~~ THEN DO ~SetGlobal("Mefisto_Talk","AC#W40",3)~ GOTO her_ye_gorzengral
END

IF ~True()~ THEN BEGIN hello_again
SAY @23
IF ~!Dead("AC#WGIL4")
Global("AC#WGildaarAbyss","GLOBAL",3)~ THEN REPLY @24 GOTO gildaar_01
IF ~!Dead("AC#WGIL4")
GlobalGT("AC#WMefisto_helps_Gildaar","GLOBAL",0)
GlobalLT("AC#WMefisto_helps_Gildaar","GLOBAL",12)~ THEN REPLY @25 + about_gildaar
IF ~Global("AC#W_Margrog_Mefisto","GLOBAL",1)~ THEN REPLY @26 + need_attention_of_maretta
IF ~PartyHasItem("AC#WBOFO")~ THEN REPLY @27 + got_bottle
IF ~~ THEN REPLY @28 + what_news
IF ~~ THEN REPLY @29 + nothing_bye
IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",1)
GlobalLT("AC#W_TharundarSoul","GLOBAL",10)
Global("Margrog_Bebilith","LOCALS",0)~ THEN REPLY @30 + margrog_disappeard
END

		IF ~~ THEN BEGIN about_gildaar
		SAY @31
		IF ~Global("AC#WMefisto_helps_Gildaar","GLOBAL",5)~ THEN GOTO have_succubus_baby
		IF ~Global("AC#WMefisto_helps_Gildaar","GLOBAL",1)~ THEN GOTO offer_take_succubus_take
		IF ~Global("AC#WMefisto_helps_Gildaar","GLOBAL",11)~ THEN GOTO where_search_azzelbath
		END
		
			IF ~~ THEN BEGIN where_search_azzelbath
			SAY @32
			IF ~~ THEN REPLY @33 GOTO where_search_azzelbath_02
			END
			
				IF ~~ THEN BEGIN where_search_azzelbath_02
				SAY @34
				IF ~~ THEN EXIT
				END
		
			IF ~~ THEN BEGIN offer_take_succubus_take
			SAY @35
			IF~~THEN REPLY @36 EXTERN AC#W#MEF chain_take_succubus_baby_accept
			IF ~~ THEN REPLY @5 + have_succubus_baby_carry_on_bye 
			END
			
				IF ~~ THEN BEGIN have_succubus_baby
				SAY @37
				IF ~~ THEN REPLY @38 GOTO have_succubus_baby_carry_on_bye
				IF ~~ THEN REPLY @39 + where_is_succubus_baby_again
				END
				
					IF ~~ THEN BEGIN where_is_succubus_baby_again
					SAY @40
					IF ~~ THEN GOTO have_succubus_baby_carry_on_bye
					END
				
					IF ~~ THEN BEGIN have_succubus_baby_carry_on_bye
					SAY @41
					IF ~~ THEN EXIT 
					END

	IF ~~ THEN BEGIN margrog_disappeard
	SAY @42
	IF ~~ THEN REPLY @43 GOTO margrog_disappeard_02
	IF ~~ THEN REPLY @44 GOTO margrog_disappeard_02
	IF ~~ THEN REPLY @45 GOTO margrog_disappeard_02
	END
	
		IF ~~ THEN BEGIN margrog_disappeard_02
		SAY @46
		IF ~~ THEN REPLY @47 GOTO margrog_tracking
		END
		
			IF ~~ THEN BEGIN margrog_tracking
			SAY @48
			IF ~~ THEN GOTO margrog_exit
			END
			
				IF ~~ THEN BEGIN margrog_exit
				SAY @49
				IF ~~ THEN DO ~EraseJournalEntry(@470701)
				AddJournalEntry(@470702,QUEST)
				SetGlobal("AC#W_TharundarSoul","GLOBAL",3)
				SetGlobal("Margrog_Bebilith","LOCALS",1)~ EXIT 
				END

IF ~~ THEN BEGIN something_else
SAY @50
IF ~!Dead("AC#WGIL4")
Global("AC#WGildaarAbyss","GLOBAL",3)~ THEN REPLY @24 GOTO gildaar_01
IF ~Global("AC#W_Margrog_Mefisto","GLOBAL",1)~ THEN REPLY @26 + need_attention_of_maretta
IF ~~ THEN REPLY @28 + what_news
IF ~~ THEN REPLY @29 + nothing_bye
END

	IF ~~ THEN BEGIN got_bottle
	SAY @51
	IF ~~ THEN DO ~TakePartyItem("AC#WBOFO")
	DestroyItem("AC#WBOFO")~ GOTO delivered_bottle 
	END
	
		IF ~~ THEN BEGIN delivered_bottle
		SAY @52
		IF ~~ THEN REPLY @53 GOTO whats_next_maretta
		IF ~~ THEN REPLY @54 + what_did_you_tell_about_me		
		END
		
			IF ~~ THEN BEGIN what_did_you_tell_about_me
			SAY @55
			IF ~~ THEN REPLY @56 + lair_tarasque
			IF ~~ THEN REPLY @53 GOTO whats_next_maretta 
			IF ~~ THEN REPLY @57 GOTO whats_next_maretta 
			END
			
				IF ~~ THEN BEGIN lair_tarasque
				SAY @58
				IF ~~ THEN REPLY @57 GOTO whats_next_maretta 
				IF ~~ THEN REPLY @59 GOTO whats_next_maretta 
				END
		
			IF ~~ THEN BEGIN whats_next_maretta
			SAY @60
			IF ~~ THEN REPLY @61 + what_do_01
			IF ~~ THEN REPLY @62 + what_do_01
			END
			
				IF ~~ THEN BEGIN what_do_01
				SAY @63
				IF ~~ THEN GOTO bye_audience
				END
			
			IF ~~ THEN BEGIN bye_audience
			SAY @64
			IF ~~ THEN DO ~EraseJournalEntry(@400601)
			SetGlobal("Audience_Maretta","AC#W40",1)~ EXIT 
			END

	IF ~~ THEN BEGIN need_attention_of_maretta
	SAY @65
	IF ~~ THEN REPLY @66 GOTO chain_need_attention_of_maretta 
	END

	IF ~~ THEN BEGIN need_attention_of_maretta_02
	SAY @67
	IF ~~ THEN REPLY @68 + price_mefisto
	IF ~~ THEN REPLY @69 + price_mefisto
	END

	IF ~~ THEN BEGIN price_mefisto
	SAY @70
	IF ~~ THEN GOTO bottle_fools_laughter_01
	END
	
		IF ~~ THEN BEGIN bottle_fools_laughter_01
		SAY @71
		IF ~~ THEN REPLY @72 GOTO about_bottle_fools_laughter
		END
		
			IF ~~ THEN BEGIN about_bottle_fools_laughter
			SAY @73
			IF ~~ THEN REPLY @74 GOTO bottle_fools_laughter_02
			IF ~~ THEN REPLY @75 GOTO bottle_fools_laughter_02
			IF ~~ THEN REPLY @76 GOTO bottle_fools_laughter_02
			END
			
				IF ~~ THEN BEGIN bottle_fools_laughter_02
				SAY @77
				IF ~~ THEN REPLY @78 GOTO where_is_grimsnag
				IF ~~ THEN REPLY @79 + why_not_take_bottle_yourself
				END
				
						IF ~~ THEN BEGIN why_not_take_bottle_yourself
						SAY @80
						IF ~~ THEN REPLY @78 GOTO where_is_grimsnag
						END
				
					IF ~~ THEN BEGIN where_is_grimsnag
					SAY @81
					IF ~~ THEN GOTO grimsnag_bye
					END
					
					IF ~~ THEN BEGIN grimsnag_bye
					SAY @82
					IF ~~ THEN DO ~SetGlobal("AC#W_Margrog_Mefisto","GLOBAL",2)
					SetGlobal("AC#W_FoolsLaughter","GLOBAL",2)						
					EraseJournalEntry(@470500)
					AddJournalEntry(@400600,QUEST)
					~ EXIT 
					END

	IF ~~ THEN BEGIN what_news
	SAY @83
	IF ~RandomNum(10,1)~ THEN GOTO news_01
	IF ~RandomNum(10,2)~ THEN GOTO news_02
	IF ~RandomNum(10,3)~ THEN GOTO news_03
	IF ~RandomNum(10,4)~ THEN GOTO news_04
	IF ~RandomNum(10,5)~ THEN GOTO news_05
	IF ~RandomNum(10,6)~ THEN GOTO news_06
	IF ~RandomNum(10,7)~ THEN GOTO news_07
	IF ~RandomNum(10,8)~ THEN GOTO news_08
	IF ~RandomNum(10,9)~ THEN GOTO news_09
	IF ~RandomNum(10,10)~ THEN GOTO news_10
	END
	
		IF ~~ THEN BEGIN news_01
		SAY @84
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_02
		SAY @85
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_03
		SAY @86
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_04
		SAY @87
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_05
		SAY @88
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_06
		SAY @89
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_07
		SAY @90
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_08
		SAY @91
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_09
		SAY @92
		IF ~~ THEN EXIT 
		END
		
		IF ~~ THEN BEGIN news_10
		SAY @93
		IF ~~ THEN EXIT 
		END

	IF ~~ THEN BEGIN her_ye_gorzengral
	SAY @94
	IF ~~ THEN REPLY @95 GOTO truth_01
	IF ~~ THEN REPLY @96 + nothing_bye
	END

		IF ~~ THEN BEGIN truth_01
		SAY @97
		IF ~~ THEN REPLY @98 GOTO mefisto_name
		IF ~~ THEN REPLY @99 + something_important
		IF ~~ THEN REPLY @96 + nothing_bye
		END

			IF ~~ THEN BEGIN mefisto_name
			SAY @100
			IF ~~ THEN GOTO something_important
			END

				IF ~~ THEN BEGIN something_important
				SAY @101
				IF ~!Dead("AC#WGIL4")
				Global("AC#WGildaarAbyss","GLOBAL",3)~ THEN REPLY @24 GOTO gildaar_01
				IF ~Global("AC#W_Margrog_Mefisto","GLOBAL",1)~ THEN REPLY @26 + need_attention_of_maretta
				IF ~~ THEN REPLY @29 + nothing_bye
				END
				
					IF ~~ THEN BEGIN nothing_bye
					SAY @102
					IF ~~ THEN EXIT 
					END

					IF ~~ THEN BEGIN gildaar_01
					SAY @103
					IF ~~ THEN DO ~SetGlobal("AC#WGildaarAbyss","GLOBAL",4)
					EraseJournalEntry(@110012)~ GOTO gildaar_02 
					END
					
						IF ~~ THEN BEGIN gildaar_02
						SAY @104
						IF ~~ THEN REPLY @105 GOTO gildaar_03
						END
						
							IF ~~ THEN BEGIN gildaar_03
							SAY @106
							IF ~~ THEN GOTO gildaar_04
							END
							
								IF ~~ THEN BEGIN gildaar_04
								SAY @107
								IF ~~ THEN REPLY @108 GOTO gildaar_05 
								END
								
									IF ~~ THEN BEGIN gildaar_05
									SAY @109
									IF ~~ THEN REPLY @110 GOTO stupid_idea
									IF ~~ THEN REPLY @187 GOTO grazzt_holding_prisoners
									IF ~~ THEN REPLY @186 GOTO interest_me_even_more
									END
									
										IF ~~ THEN BEGIN stupid_idea
										SAY @111
										IF ~~ THEN GOTO interest_me_even_more
										END
										
										IF ~~ THEN BEGIN grazzt_holding_prisoners
										SAY @189
										IF ~~ THEN GOTO interest_me_even_more
										END
										
										IF ~~ THEN BEGIN interest_me_even_more
										SAY @188
										IF ~~ THEN REPLY @112 GOTO offer_01
										END
										
										IF ~~ THEN BEGIN offer_01
										SAY @113
										IF ~~ THEN REPLY @114 + proposal_get_rid_cyric
										END
										
										IF ~~ THEN BEGIN proposal_get_rid_cyric
										SAY @115
										IF ~~ THEN REPLY @116 GOTO  idea_get_rid_gildaar
										IF ~~ THEN REPLY @117 GOTO  idea_get_rid_gildaar
										END
										
											IF ~~ THEN BEGIN idea_get_rid_gildaar
											SAY @118
											IF ~~ THEN REPLY @119 GOTO chain_take_succubus_baby_01
											END

										IF ~~ THEN BEGIN proposal_get_rid_cyric_outro
										SAY @120
										IF ~~ THEN GOTO something_else
										END
										
										/*
											IF ~~ THEN BEGIN proposal
											SAY ~Ein Horn wäscht das andere, wie man in der Abyss zu sagen pflegt. Ihr helft mir, und ich werde einmal sehen, was ich über diesen Priester alles erzählen kann.~
											IF ~~ THEN EXIT 
											END
											*/
CHAIN AC#W#MEF chain_take_succubus_baby_01
@121
END
IF~OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @122 EXTERN AC#W#MEF chain_take_succubus_baby_02
IF~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @122 EXTERN ~KeldorJ~ Keldorn_take_succubus_baby
IF~~THEN REPLY @123 EXTERN AC#W#MEF chain_take_succubus_city_angry
IF~~THEN REPLY @124 EXTERN AC#W#MEF chain_take_succubus_baby_accept

		CHAIN AC#W#MEF chain_take_succubus_baby_accept
		@125
		==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @126
		END
		IF~~THEN EXTERN AC#W#MEF chain_take_succubus_baby_summary_bye
		
		CHAIN AC#W#MEF chain_take_succubus_baby_summary_bye
		@127
		DO ~EraseJournalEntry(@110012)
		AddJournalEntry(@110013,QUEST)
		SetGlobal("AC#WMefisto_helps_Gildaar","GLOBAL",5)~ EXIT
	
	CHAIN AC#W#MEF chain_take_succubus_city_angry
	@128
	==AC#W#MEF IF ~Gender(Player1,MALE)~ THEN @129
	==AC#W#MEF IF ~Gender(Player1,FEMALE)~ THEN @130   
	END
	IF~~THEN REPLY @122 EXTERN AC#W#MEF chain_take_succubus_baby_02
	IF~~THEN REPLY @131 EXTERN AC#W#MEF chain_take_succubus_word
	IF~~THEN REPLY @132 EXTERN AC#W#MEF chain_take_succubus_decline
	IF~~THEN REPLY @133 EXTERN AC#W#MEF chain_take_succubus_baby_accept
	
	CHAIN AC#W#MEF chain_take_succubus_baby_02
	@134
	==NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @135
	==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @136
	==KORGANJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @137
	END
	IF~~THEN REPLY @131 EXTERN AC#W#MEF chain_take_succubus_word
	IF~~THEN REPLY @133 EXTERN AC#W#MEF chain_take_succubus_baby_accept
	
		CHAIN AC#W#MEF chain_take_succubus_word
		@138
		END
		IF~~THEN REPLY @122 EXTERN AC#W#MEF chain_take_succubus_baby_02
		IF~~THEN REPLY @123 EXTERN AC#W#MEF chain_take_succubus_city_angry
		IF~~THEN REPLY @132 EXTERN AC#W#MEF chain_take_succubus_decline
		IF~~THEN REPLY @133 EXTERN AC#W#MEF chain_take_succubus_baby_accept
		
		CHAIN AC#W#MEF chain_take_succubus_decline
		@139
		END
		IF~~THEN EXTERN AC#W#MEF chain_take_succubus_offer
		
		CHAIN AC#W#MEF chain_take_succubus_offer
		@140
		END
		IF~~THEN REPLY @141 EXTERN AC#W#MEF chain_take_succubus_bye
		IF~~THEN REPLY @142 EXTERN AC#W#MEF chain_take_succubus_bye
		IF~~THEN REPLY @133 EXTERN AC#W#MEF chain_take_succubus_baby_accept
		
		CHAIN AC#W#MEF chain_take_succubus_bye
		@143
		DO ~EraseJournalEntry(@110012)
		SetGlobal("AC#WMefisto_helps_Gildaar","GLOBAL",1)~ EXIT

	// Mefisto talks about the river Styx
	//_________________________________________________________
	CHAIN AC#W#MEF chain_gildaar_styx_02
	@144
	==HAERDAJ IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN @145
	==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ @146
	END
	IF ~~ THEN REPLY @147 EXTERN AC#W#MEF what_is_styx
	IF ~~ THEN REPLY @148 EXTERN AC#W#MEF kill_gildaar_instead
	IF ~~ THEN REPLY @149 EXTERN AC#W#MEF chain_gildaar_styx_03

		CHAIN AC#W#MEF what_is_styx
		@150
		= @151
		= @152
		END
		IF ~~ THEN REPLY @149 EXTERN AC#W#MEF chain_gildaar_styx_03
		
		CHAIN AC#W#MEF kill_gildaar_instead
		@153
		END
		IF ~~ THEN REPLY @154 EXTERN AC#W#MEF chain_gildaar_styx_03
	
		CHAIN AC#W#MEF chain_gildaar_styx_03
		@155
		END
		IF ~~ THEN REPLY @156 EXTERN AC#W#MEF chain_go_search_merrenoloth_bye
		
			CHAIN AC#W#MEF chain_go_search_merrenoloth_bye
			@157
			DO ~SetGlobal("AC#WMefisto_helps_Gildaar","GLOBAL",11)
			AddJournalEntry(@110014,QUEST)~ EXIT 

			
CHAIN AC#W#MEF chain_need_attention_of_maretta
@158
==AC#W#MEF IF ~CheckStatLT(Player1,17,STR)~ THEN @159 
==AC#W#MEF IF ~CheckStatGT(Player1,16,STR)~ THEN @160 
==AC#W#MEF IF ~CheckStatGT(Player1,15,CHR)~ THEN @161 
==AC#W#MEF IF ~CheckStatLT(Player1,16,CHR)~ THEN @162
= @163 
END
IF~~THEN EXTERN AC#W#MEF need_attention_of_maretta_02
		
BEGIN ~AC#W40BR~

IF ~~ THEN BEGIN bye
SAY @164
IF ~~ THEN DO ~SetGlobal("Mefisto_Talk","AC#W40",2)
EscapeArea()~ EXIT 
END

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40BR chain_victory
@165
== AC#W#MEF @166  
== AC#W40BR @167
== AC#W#MEF @168  
== AC#W40BR @169
== AC#W#MEF @170
= @171
== AC#W40BR @172
== AC#W#MEF @173
== AC#W40BR @174
== AC#W#MEF @175
== AC#W40BR @176
END
IF ~~ THEN + bye

//_______________________________________________________________________________________________________________________
// Mefisto #3, Gildaar questline (retrieve demon baby)
//_______________________________________________________________________________________________________________________
BEGIN AC#W40M3
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W40M3 have_baby
@177
= @178
= @179
DO ~TakePartyItem("AC#WDMBB")
EraseJournalEntry(@110021)
SetGlobal("AC#WMefisto_helps_Gildaar","GLOBAL",10)
EscapeArea()~ EXIT

//_______________________________________________________________________________________________________________________		
// NPC-Dialogues
APPEND KeldorJ
IF ~~ THEN BEGIN Keldorn_take_succubus_baby
SAY @180
IF ~~ THEN EXTERN AC#W#MEF chain_take_succubus_baby_02
END
END

APPEND HAERDAJ
	IF ~~ THEN BEGIN haerdalis_mefisto
	SAY @181 
	IF ~~ THEN REPLY @182 EXTERN ~AC#W#MEF~ lovely_day 
	IF ~~ THEN REPLY @183 + haerdalis_mefisto_02
	END
	
	IF ~~ THEN BEGIN haerdalis_mefisto_02
	SAY @184
	IF ~~ THEN DO ~SetGlobal("HaerdalisMetMefisto","LOCALS",1)~ EXTERN ~AC#W#MEF~ lovely_day
	END
	END

APPEND ~AerieJ~
	IF ~~ THEN BEGIN aerie_mefisto
	SAY @185
	IF ~~ THEN DO ~SetGlobal("AerieMetMefisto","LOCALS",1)~ EXTERN ~AC#W#MEF~ lovely_day
	END
	END	
	
