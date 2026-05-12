/**********************************************************************************************************************************************
***********************************************************************************************************************************************
Dialoge in Infinite staircase level 3 (Samora landing platform)
***********************************************************************************************************************************************
**********************************************************************************************************************************************/
// Squirrel of Defamation
BEGIN ~AC#W30SQ~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W30SQ hello_0
@0
END
IF~~THEN REPLY @1 EXTERN AC#W30SQ talking_squirrel
IF~~THEN REPLY @2 EXTERN AC#W30SQ talking_squirrel
IF~~THEN REPLY @3 EXTERN AC#W30SQ who_is_there
IF ~~ THEN REPLY @4 + get_away

	CHAIN AC#W30SQ who_is_there
	@5
	END
	IF~~THEN REPLY @6 EXTERN AC#W30SQ talking_squirrel
	IF~~THEN REPLY @2 EXTERN AC#W30SQ talking_squirrel
	IF ~~ THEN REPLY @7 + get_away
	IF ~~ THEN REPLY @8 + on_our_way
	
	CHAIN AC#W30SQ talking_squirrel
	@9
	==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @10
	==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @11
	==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN @12
	END
	IF~~THEN REPLY @13 EXTERN AC#W30SQ defamation
	IF~~THEN REPLY @14 EXTERN AC#W30SQ actual_defamation
	IF ~~ THEN REPLY @7 + get_away
	
		CHAIN AC#W30SQ defamation
		@15
		END
		IF~~THEN REPLY @14 EXTERN AC#W30SQ actual_defamation
		IF ~~ THEN REPLY @7 + get_away
		
		CHAIN AC#W30SQ actual_defamation
		@16
		==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @17
		==KORGANJ IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN @18
		==AC#W30SQ @19
		==CerndJ IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN @20
		END
		IF ~~ THEN REPLY @21 EXTERN AC#W30SQ thanks_squirrel
		IF ~~ THEN REPLY @22 EXTERN AC#W30SQ offend_squirrel
		IF ~~ THEN REPLY @7 + get_away
		IF ~InParty("cernd") !StateCheck("cernd",CD_STATE_NOTVALID)~ THEN EXTERN AC#W30SQ thanks_squirrel

			CHAIN AC#W30SQ thanks_squirrel
			@23
			END
			IF ~~ THEN EXTERN AC#W30SQ give_pinecone_item
			
				CHAIN AC#W30SQ give_pinecone_item
				@24
				END
				IF ~~ THEN DO ~GiveItemCreate("AC#WPINE",LastTalkedToBy,1,0,0)~ EXTERN AC#W30SQ bye_squirrel

			CHAIN AC#W30SQ offend_squirrel
			@25
			==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @26
			END
			IF ~~ THEN REPLY @27 EXTERN AC#W30SQ bye_squirrel
			IF ~~ THEN REPLY @28 EXTERN AC#W30SQ thanks_squirrel

		CHAIN AC#W30SQ get_away
		@29
		END
		IF ~~ THEN EXTERN AC#W30SQ bye_squirrel
		
		CHAIN AC#W30SQ on_our_way
		@30
		END
		IF ~~ THEN EXTERN AC#W30SQ bye_squirrel
		
		CHAIN AC#W30SQ bye_squirrel
		@31
		DO ~SetGlobal("Squirrel","AC#W30",2)
		EscapeArea()~ EXIT
	
// Gnomish inventor
BEGIN ~AC#W30GN~ 

CHAIN IF ~Global("GnomeAppears","AC#W30",2)~ THEN AC#W30GN hello_again
@32
END
IF~~THEN REPLY @33 EXTERN AC#W30GN about_flying_things
IF~PartyHasItem("AC#WDVWG")~THEN REPLY @34 DO ~TakePartyItem("AC#WDVWG") DestroyItem("AC#WDVWG")~ EXTERN AC#W30GN have_deva_wing
IF~Global("Wilbur_Potions","LOCALS",1)~THEN REPLY @35 DO ~SetGlobal("Wilbur_Potions","LOCALS",1)~ EXTERN AC#W30GN buy_potions
IF~~THEN REPLY @36 EXTERN AC#W30GN bye_02

	CHAIN AC#W30GN have_deva_wing	
	@37
	= @38
	= @39
	END
	IF~~THEN DO ~GiveItemCreate("AC#WALEM",LastTalkedToBy,1,0,0)~ EXIT
	
	CHAIN AC#W30GN about_flying_things
	@40
	END
	IF~~THEN EXTERN AC#W30GN about_flying_things_cont
	IF~Global("Wilbur_Jan","LOCALS",0) InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~THEN DO ~SetGlobal("Wilbur_Jan","LOCALS",1)~ EXTERN AC#W30GN about_flying_things_cont_jan

	CHAIN AC#W30GN about_flying_things_cont
	@41
	END
	IF~~THEN REPLY @42 EXTERN AC#W30GN about_flying_things_02
	IF~Global("Wilbur_Potions","LOCALS",0)~THEN REPLY @43 EXTERN AC#W30GN potions
	IF~~THEN REPLY @36 EXTERN AC#W30GN bye_02
	
	CHAIN AC#W30GN about_flying_things_cont_jan
	@41
	==JanJ IF ~InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~ THEN @61
	==AC#W30GN IF ~InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~ THEN @62
	==AC#W30GN IF ~InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~ THEN @65
	==JanJ IF ~InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~ THEN @66
	==AC#W30GN IF ~InParty("jan") !StateCheck("jan",CD_STATE_NOTVALID)~ THEN @67
	==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID) InParty("jan")~ THEN @72
	END
	IF~~THEN REPLY @42 EXTERN AC#W30GN about_flying_things_02
	IF~Global("Wilbur_Potions","LOCALS",0)~THEN REPLY @43 EXTERN AC#W30GN potions
	IF~~THEN REPLY @36 EXTERN AC#W30GN bye_02
	
	CHAIN AC#W30GN about_flying_things_02	
	@44
	END
	IF~~THEN REPLY @42 EXTERN AC#W30GN about_flying_things_3
	IF~~THEN REPLY @36 EXTERN AC#W30GN bye_02
	
	CHAIN AC#W30GN about_flying_things_3	
	@45
	END
	IF~Global("Wilbur_Potions","LOCALS",1)~THEN REPLY @35 DO ~SetGlobal("Wilbur_Potions","LOCALS",1)~ EXTERN AC#W30GN buy_potions
	IF~~THEN REPLY @36 EXTERN AC#W30GN bye_02
	
	CHAIN AC#W30GN potions	
	@46
	END
	IF~~THEN REPLY @47 DO ~SetGlobal("Wilbur_Potions","LOCALS",1)~ EXTERN AC#W30GN buy_potions
	IF~~THEN REPLY @48 EXTERN AC#W30GN about_flying_things
	
	CHAIN AC#W30GN buy_potions	
	@49
	END
	IF~~THEN DO ~StartStore("AC#W30GN",LastTalkedToBy())~ EXIT
	
	CHAIN AC#W30GN bye_02	
	@50
	EXIT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W30GN hello_0
@51
END
IF~~THEN REPLY @52 EXTERN AC#W30GN 02
IF~~THEN REPLY @53 EXTERN AC#W30GN 02
IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur

	CHAIN AC#W30GN 02
	@55
	END
	IF~~THEN REPLY @56 EXTERN AC#W30GN phoenix_backpack
	IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
	
	CHAIN AC#W30GN phoenix_backpack
	@57
	END
	IF~~THEN REPLY @58 EXTERN AC#W30GN phoenix_backpack_02
	IF~~THEN REPLY @59 EXTERN AC#W30GN phoenix_backpack_02
	IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
	
		CHAIN AC#W30GN phoenix_backpack_02
		@60		
		END
		IF~~THEN REPLY @63 EXTERN AC#W30GN who_are_you
		IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
		
		CHAIN AC#W30GN who_are_you
		@68
		END
		IF~~THEN REPLY @69 EXTERN AC#W30GN flying_machines
		IF~~THEN REPLY @70 EXTERN AC#W30GN idea_flying
		IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
		
			CHAIN AC#W30GN idea_flying
			@71			
			END
			IF~~THEN REPLY @73 EXTERN AC#W30GN how_often
			IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
			
			CHAIN AC#W30GN flying_machines
			@74
			END
			IF~~THEN REPLY @73 EXTERN AC#W30GN how_often
			IF~~THEN REPLY @54 EXTERN AC#W30GN bye_wilbur
			
				CHAIN AC#W30GN how_often
				@75
				END
				IF~~THEN EXTERN AC#W30GN back_to_basement
				
				CHAIN AC#W30GN back_to_basement
				@76 				
				END
				IF~~THEN EXTERN AC#W30GN bye_wilbur
				
				CHAIN AC#W30GN bye_wilbur
				@77
				DO ~SetGlobal("GnomeAppears","AC#W30",2)
				MoveToPointNoInterrupt([861.1186])~ EXIT

// Vampire assassin male
BEGIN ~AC#W30V1~ 

// Vampire assassin female
BEGIN ~AC#W30V2~ 

// Gildaar
BEGIN ~AC#WGIL2~ 
CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WGIL2 hello_0
@78
END
IF~~THEN REPLY @79 EXTERN AC#WGIL2 do_we_know_each_other
IF~~THEN REPLY @80 EXTERN AC#WGIL2 do_we_know_each_other
IF~~THEN REPLY @81 EXTERN AC#WGIL2 do_we_know_each_other
IF~~THEN REPLY @82EXTERN AC#WGIL2 do_we_know_each_other
IF~~THEN REPLY @83 EXTERN AC#WGIL2 who_are_you

	CHAIN AC#WGIL2 do_we_know_each_other
	@84
	END
	IF~~THEN REPLY @83 EXTERN AC#WGIL2 who_are_you
	IF~~THEN REPLY @85 EXTERN AC#WGIL2 who_are_you
	IF~~THEN REPLY @86 EXTERN AC#WGIL2 who_are_you

		CHAIN AC#WGIL2 who_are_you
		@87
		==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @88
		==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @89
		END
		IF~~THEN REPLY @90 EXTERN AC#WGIL2 prince_of_lies
		IF~~THEN REPLY @91 EXTERN AC#WGIL2 why_cyric_cares
		IF~~THEN REPLY @92 EXTERN AC#WGIL2 why_cyric_cares
		
		CHAIN AC#WGIL2 prince_of_lies
		@93
		==MinscJ IF ~InParty("minsc") !StateCheck("minsc",CD_STATE_NOTVALID)~ THEN @94
		END
		IF~~THEN REPLY @91 EXTERN AC#WGIL2 why_cyric_cares
		IF~~THEN REPLY @92 EXTERN AC#WGIL2 why_cyric_cares
		
			CHAIN AC#WGIL2 why_cyric_cares
			@95
			END
			IF~~THEN REPLY @96 EXTERN AC#WGIL2 how_do_you_know_that
			IF~~THEN REPLY @97 EXTERN AC#WGIL2 how_do_you_know_that
			IF~~THEN REPLY @98 EXTERN AC#WGIL2 why_do_i_even_tell_you
			
				CHAIN AC#WGIL2 how_do_you_know_that
				@99
				==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @100
				END
				IF~~THEN EXTERN AC#WGIL2 why_do_i_even_tell_you
				
				CHAIN AC#WGIL2 why_do_i_even_tell_you
				@101
				=
				@102
				==AC#W30V1 @103
				==AC#WGIL2 @104
				==AC#W30V1 @105
				==AC#WGIL2 @106
				DO ~SetGlobal("AC#WGildaarAbyss","GLOBAL",1)
				EraseJournalEntry(@110000)
				AddJournalEntry(@110010,QUEST)
				ActionOverride("AC#W30V1",Enemy())
				ActionOverride("AC#W30V2",Enemy())
				EscapeAreaObject("TrAC#W40")
				~ EXIT

// the three mages 

BEGIN ~AC#W20M1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @107
   IF ~Gender(Player1,MALE)~ THEN GOTO 1
   IF ~Gender(Player1,FEMALE)~ THEN GOTO 2
END

IF ~~ THEN BEGIN 1
   SAY @108
   IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 2
   SAY @109
   IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY @110
   IF ~~ THEN REPLY @111 GOTO 4
   IF ~~ THEN REPLY @112 GOTO 4
   IF ~~ THEN REPLY @113 GOTO fight
   IF ~~ THEN REPLY @114 GOTO 5
END

IF ~~ THEN BEGIN 4
   SAY @115
   IF ~~ THEN REPLY @116 GOTO 6
   IF ~~ THEN REPLY @117 GOTO who_warned_me
   IF ~~ THEN REPLY @118 + who_warned_me
   IF ~~ THEN REPLY @119 + fight
END

IF ~~ THEN BEGIN 5
   SAY @120
   IF ~~ THEN REPLY @121 GOTO 6
   IF ~~ THEN REPLY @117 GOTO who_warned_me
   IF ~~ THEN REPLY @118 + fight
   IF ~~ THEN REPLY @119 + fight
END

	IF ~~ THEN BEGIN who_warned_me
	SAY @122
	IF ~~ THEN REPLY @123 + give_more_gold_01
	IF ~~ THEN REPLY @124 GOTO 8
	IF ~~ THEN REPLY @125 GOTO 8
	END

IF ~~ THEN BEGIN 6
   SAY @126
   IF ~~ THEN REPLY @123 + give_more_gold_01
   IF ~~ THEN REPLY @124 GOTO 8
   IF ~~ THEN REPLY @125 GOTO 8
END

	IF ~~ THEN BEGIN give_more_gold_01
	SAY @127
	IF ~~ THEN GOTO give_more_gold_02
	END

		IF ~~ THEN BEGIN give_more_gold_02
		SAY @128
		IF ~~ THEN REPLY @129 GOTO give_gold_nope
		IF ~PartyGoldGT(9)~ THEN REPLY @130 + give_gold_not_enough
		IF ~PartyGoldGT(99)~ THEN REPLY @131 + give_gold_not_enough
		IF ~PartyGoldGT(999)~ THEN REPLY @132 + give_gold_not_enough
		IF ~PartyGoldGT(4999)~ THEN REPLY @133 + give_gold_OK
		IF ~~ THEN REPLY @134 GOTO give_gold_nope
		IF ~~ THEN REPLY @135 GOTO fight
		END
		
			IF ~~ THEN BEGIN give_gold_OK
			SAY @136
			IF ~~ THEN REPLY @137 DO ~TakePartyGold(5000)~ GOTO bye_take_gold
			IF ~~ THEN REPLY @135 GOTO fight			
			END

		IF ~~ THEN BEGIN give_gold_nope
		SAY @138
		IF ~~ THEN GOTO fight 
		END	
		
		IF ~~ THEN BEGIN give_gold_not_enough
		SAY @139
		IF ~~ THEN GOTO fight 
		END	

	IF ~~ THEN BEGIN 8
	SAY @140
	IF ~~ THEN GOTO fight 
	END
	
		IF ~~ THEN BEGIN bye_take_gold
		SAY @141
		IF ~~ THEN DO ~ActionOverride("AC#W20M2",EscapeArea())
   ActionOverride("AC#W20M3",EscapeArea())
   SetGlobal("KayurSpawn","AC#W30",20)
   EscapeArea()~ EXIT 
		END

IF ~~ THEN BEGIN fight
SAY @142
   IF ~~ THEN DO ~Enemy()
   ActionOverride("AC#W20M2",Enemy())
   ActionOverride("AC#W20M3",Enemy())
   SetGlobal("KayurSpawn","AC#W30",1)
   Shout(99)~ EXIT
END

// Dialogue Modron

BEGIN ~AC#W_MO1~

IF ~Global("ModronDoorOpens","AC#W30",21)~ THEN BEGIN hello_thank_you
SAY @143
IF ~~ THEN DO ~SetGlobal("ModronHelp","AC#W30",10)
GiveItem("AC#WSMMI",LastTalkedToBy)
EscapeAreaObject("Door03")~ EXIT 
END

IF ~Global("ModronHelp","AC#W30",1)~ THEN BEGIN hello_again
SAY @144
IF ~~ THEN GOTO wait_for_help
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @145
IF ~~ THEN GOTO 01
IF ~InParty("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2J~ imoen_modron
END

IF ~Global("ModronHelp","AC#W30",0)~ THEN BEGIN hello_again_not_identified
SAY @146
	=
	@147 
	=
	@148
	IF ~~ THEN REPLY @149 GOTO strange_bird
	IF ~~ THEN REPLY @150 + decide
	IF ~~ THEN REPLY @151 + parts
	IF ~~ THEN REPLY @152 + attack
	IF ~~ THEN REPLY @153 + go_away
	END

	IF ~~ THEN BEGIN 01
	SAY @154
	=
	@146
	=
	@147 
	=
	@148
	IF ~~ THEN REPLY @149 GOTO strange_bird
	IF ~~ THEN REPLY @150 + decide
	IF ~~ THEN REPLY @151 + parts
	IF ~~ THEN REPLY @152 + attack
	IF ~~ THEN REPLY @153 + go_away
	END
	
		IF ~~ THEN BEGIN strange_bird
		SAY @155
		IF ~~ THEN GOTO way_blocked
		END
		
		IF ~~ THEN BEGIN decide
		SAY @156
		IF ~~ THEN GOTO way_blocked
		END
		
		IF ~~ THEN BEGIN parts
		SAY @157
		IF ~~ THEN GOTO way_blocked 
		END
		
		IF ~~ THEN BEGIN attack
		SAY @158
		IF ~~ THEN DO ~Enemy()~ EXIT 
		END
		
		IF ~~ THEN BEGIN go_away
		SAY @159
		IF ~~ THEN DO ~~ EXIT
		END
		
			IF ~~ THEN BEGIN way_blocked
			SAY @146
			=
			@160
			IF ~~ THEN DO ~SetGlobal("ModronHelp","AC#W30",1)~ GOTO wait_for_help
			IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("ModronHelp","AC#W30",1)~ EXTERN ~HAERDAJ~ haerdalis_modron
			END
			
			IF ~~ THEN BEGIN wait_for_help
			SAY @161
			IF ~~ THEN REPLY @162 GOTO how_can_i_help
			IF ~~ THEN REPLY @163 + go_away_02
			IF ~~ THEN REPLY @164 + go_away_02
			END
			
				IF ~~ THEN BEGIN go_away_02
				SAY @165
				IF ~~ THEN EXIT
				END
				
				IF ~~ THEN BEGIN how_can_i_help
				SAY @146
				=
				@160
				IF ~~ THEN REPLY @166 GOTO are_u_monodron
				IF ~~ THEN REPLY @167 + open_portal
				IF ~~ THEN REPLY @163 + go_away_02
				IF ~~ THEN REPLY @164 + go_away_02
				END
				
					IF ~~ THEN BEGIN are_u_monodron
					SAY @168
					IF ~~ THEN REPLY @169 GOTO you_many
					END
					
						IF ~~ THEN BEGIN you_many
						SAY @170
						IF ~~ THEN REPLY @171 GOTO how_can_i_help
						END
						
					IF ~~ THEN BEGIN open_portal
					SAY @172
					IF ~~ THEN REPLY @173 GOTO how_open_portal
					IF ~~ THEN REPLY @163 + go_away_02
					IF ~~ THEN REPLY @164 + go_away_02
					END
					
						IF ~~ THEN BEGIN how_open_portal
						SAY @160
						IF ~~ THEN REPLY @174 GOTO how_can_i_help 
						IF ~~ THEN REPLY @163 + go_away_02
						IF ~~ THEN REPLY @164 + go_away_02
						END
// Abishai scouts
BEGIN ~AC#W30A1~

IF ~True()~ THEN BEGIN 0
SAY @175
IF ~~ THEN REPLY @176 GOTO give_item
IF ~~ THEN REPLY @177 + whats_up_with_item
IF ~~ THEN REPLY @178 + unkind
IF ~~ THEN REPLY @179 + voice
IF ~InParty("haerdalis") !StateCheck("haerdalis",CD_STATE_NOTVALID)~ THEN EXTERN ~HAERDAJ~ haerdalis_abishai
IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN ~KeldorJ~ keldorn_abishai
IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ~ edwin_abishai
END

		IF ~~ THEN BEGIN finally_give_item
		SAY @180
		IF ~~ THEN REPLY @176 GOTO give_item
		IF ~~ THEN REPLY @177 + whats_up_with_item
		IF ~~ THEN REPLY @178 + unkind
		IF ~~ THEN REPLY @179 + voice
		END

	IF ~~ THEN BEGIN whats_up_with_item
	SAY @181
	IF ~~ THEN REPLY @182 GOTO give_item 
	IF ~~ THEN REPLY @178 + unkind
	IF ~~ THEN REPLY @179 + voice
	END
	
	IF ~~ THEN BEGIN unkind
	SAY @183
	IF ~~ THEN REPLY @182 GOTO give_item 
	IF ~~ THEN REPLY @177 + whats_up_with_item
	IF ~~ THEN REPLY @179 + voice
	END
	
	IF ~~ THEN BEGIN voice
	SAY @184
	IF ~~ THEN REPLY @185 GOTO give_item
	IF ~~ THEN REPLY @186 GOTO go_on_try
	END
	
		IF ~~ THEN BEGIN go_on_try
		SAY @187
		IF ~~ THEN REPLY @188 GOTO give_item 
		END

	IF ~~ THEN BEGIN give_item
	SAY @189
	IF ~~ THEN DO ~TakePartyItem("AC#W30BZ")
	DestroyItem("AC#W30BZ")
	EraseJournalEntry(@470010)
	AddJournalEntry(@470011,QUEST)
	SetGlobal("AC#W_BaatezuJob","GLOBAL",10)
	EscapeArea()~ EXIT 
	END

// Waukeen in front of portal to Samora
BEGIN ~AC#WWAU3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
SAY @190
IF ~~ THEN EXTERN ~AC#WLIL1~ tach
END

IF ~~ THEN BEGIN moment
SAY @191
=
@192
=
@236 
=
@193 
IF ~~ THEN DO ~GiveItemCreate("AC#WCOIN",Player1,1,0,0)~ + give_coin
END

IF ~~ THEN BEGIN give_coin
SAY @194
IF ~~ THEN REPLY @195 + only_one_coin
IF ~~ THEN REPLY @196 + your_gratitude
IF ~~ THEN REPLY @197 + thank_you
END

	IF ~~ THEN BEGIN only_one_coin
	SAY @198
	IF ~~ THEN EXTERN ~AC#WLIL2~ no_time_to_waste
	END
	
	IF ~~ THEN BEGIN your_gratitude
	SAY @199
	IF ~~ THEN EXTERN ~AC#WLIL2~ no_time_to_waste
	END
	
	IF ~~ THEN BEGIN thank_you
	SAY @200
	IF ~~ THEN EXTERN ~AC#WLIL2~ no_time_to_waste
	END

IF ~~ THEN BEGIN time_to_leave
SAY @201
=
@202 
=
@203 
IF ~~ THEN REPLY @204 EXTERN ~AC#WLIL1~ new_platform
END

	IF ~~ THEN BEGIN bye
	SAY @205
	IF ~~ THEN DO ~SetGlobal("StaircaseAftermath","AC#W30",10)
	AddJournalEntry(@100001,QUEST_DONE)
	ActionOverride("AC#WLIL1",MoveToPointNoInterrupt([3700.1000]))
	ActionOverride("AC#WLIL2",MoveToPointNoInterrupt([3700.1000]))
	MoveToPointNoInterrupt([3700.1000])~ EXIT 
	END

// Lillend #1
BEGIN ~AC#WLIL1~

IF ~Global("StaircaseAftermath","AC#W30",3)~ THEN BEGIN tach_02
SAY @206
IF ~~ THEN DO ~SetGlobal("StaircaseAftermath","AC#W30",4)~ EXTERN ~AC#WWAU3~ moment
END

IF ~~ THEN BEGIN tach
SAY @207
IF ~~ THEN DO ~StartCutSceneMode()
SetGlobal("StaircaseAftermath","AC#W30",2)
CreateCreature("AC#W30F1",[4270.502],1)
CreateCreature("AC#W30F2",[4385.521],1)
Wait(1)
ActionOverride("AC#W30F1",StartDialogueNoSet([PC]))
~ EXIT
END

IF ~~ THEN BEGIN lillend_alufiend_01
SAY @208
IF ~~ THEN DO ~StartCutSceneMode()
SetGlobal("StaircaseAftermath","AC#W30",3)
ForceSpell("AC#W30F1",CUTSCENE_POWERWORD_KILL)
ActionOverride("AC#WLIL2",ForceSpell("AC#W30F2",CUTSCENE_POWERWORD_KILL))
Wait(1)
StartDialogueNoSet(Player1)~ EXIT 
END

IF ~~ THEN BEGIN new_platform
SAY @209
IF ~~ THEN REPLY @210 EXTERN ~AC#WLIL2~  portal_abyss_closing
IF ~~ THEN REPLY @211 DO ~SetGlobal("ShowWayBack","AC#W30",1)~ GOTO show_way_back_02
END

	IF ~~ THEN BEGIN show_way_back_02
	SAY @212
	IF ~~ THEN EXTERN ~AC#WLIL2~  portal_abyss_closing 
	END

// Lillend #2
BEGIN ~AC#WLIL2~

IF ~~ THEN BEGIN no_time_to_waste
SAY @213
IF ~~ THEN EXTERN ~AC#WWAU3~ time_to_leave 
END

IF ~~ THEN BEGIN portal_abyss_closing
SAY @214
IF ~~ THEN EXTERN ~AC#WWAU3~ bye 
END
// Alu-fiend

BEGIN ~AC#W30F1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @215
IF ~~ THEN EXTERN ~AC#WLIL1~ lillend_alufiend_01 
END

// Lillend #3 (to send party back)
BEGIN ~AC#WLIL3~

IF ~True()~ THEN BEGIN hello_0
SAY @216
IF ~~ THEN REPLY @217 GOTO send_me_back 
IF ~~ THEN REPLY @218 + bye
END

	IF ~~ THEN BEGIN send_me_back
	SAY @219
	IF ~~ THEN DO ~SetGlobal("ShowWayBack","AC#W30",3)
	DestroySelf()~ EXIT 
	END
	
	IF ~~ THEN BEGIN bye
	SAY @220
	IF ~~ THEN EXIT
	END

// Lillend #4 (in front of door to Goldspires)
BEGIN ~AC#WLIL4~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @221
IF ~~ THEN DO ~CreateVisualEffectObject("SPDIMNDR",Myself) 
Wait(1)				
DestroySelf()~ EXIT
END

// NPC Dialogues

APPEND ~HAERDAJ~
IF ~~ THEN BEGIN haerdalis_modron
			SAY @222
			IF ~~ THEN REPLY @223 GOTO haerdalis_knows_modrons
			IF ~~ THEN REPLY @224 EXTERN ~AC#W_MO1~ wait_for_help
			IF ~~ THEN REPLY @225 EXTERN ~AC#W_MO1~ wait_for_help
			END
			
			IF ~~ THEN BEGIN haerdalis_knows_modrons
			SAY @226
			IF ~~ THEN REPLY @227 GOTO haerdalis_knows_modrons_02
			IF ~~ THEN REPLY @224 EXTERN ~AC#W_MO1~ wait_for_help
			IF ~~ THEN REPLY @225 EXTERN ~AC#W_MO1~ wait_for_help
			END
			
				IF ~~ THEN BEGIN haerdalis_knows_modrons_02
				SAY @228
				IF ~~ THEN REPLY @229 EXTERN ~AC#W_MO1~ wait_for_help
				IF ~~ THEN REPLY @225 EXTERN ~AC#W_MO1~ wait_for_help
				IF ~InParty("korgan") !StateCheck("korgan",CD_STATE_NOTVALID)~ THEN EXTERN ~KORGANJ~ korgan_haerdalis
				END
END

// NPC-Dialogues

APPEND ~KORGANJ~
IF ~~ THEN BEGIN korgan_haerdalis
SAY @230
IF ~~ THEN REPLY @231 EXTERN ~AC#W_MO1~ wait_for_help
IF ~~ THEN REPLY @225 EXTERN ~AC#W_MO1~ wait_for_help
END
END

APPEND ~IMOEN2J~
IF ~~ THEN BEGIN imoen_modron
SAY @232
IF ~~ THEN EXTERN ~AC#W_MO1~ 01 
END
END	

APPEND ~KeldorJ~
IF ~~ THEN BEGIN keldorn_abishai
SAY @233
IF ~~ THEN EXTERN ~AC#W30A1~ finally_give_item 
END
END

APPEND ~HAERDAJ~
IF ~~ THEN BEGIN haerdalis_abishai
SAY @234
IF ~~ THEN EXTERN ~AC#W30A1~ finally_give_item 
END
END	

APPEND ~EDWINJ~
IF ~~ THEN BEGIN edwin_abishai
SAY @235
IF ~~ THEN EXTERN ~AC#W30A1~ finally_give_item 
END
END		

