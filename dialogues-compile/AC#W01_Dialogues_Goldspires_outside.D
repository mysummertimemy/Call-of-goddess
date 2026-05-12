/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues new merchant after Waukeen's rescue
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WMEND~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WMEND hello_0
@280
END
IF~~THEN REPLY @281 EXTERN AC#WMEND what_brings_you_here
IF~~THEN REPLY @282 EXTERN AC#WMEND what_do_you_have
IF~~THEN REPLY @283 EXTERN AC#WMEND start_store
IF~~THEN REPLY @284 EXTERN AC#WMEND bye

CHAIN IF ~True()~ THEN AC#WMEND hello_0
@285
END
IF~~THEN REPLY @281 EXTERN AC#WMEND what_brings_you_here
IF~~THEN REPLY @282 EXTERN AC#WMEND what_do_you_have
IF~~THEN REPLY @283 EXTERN AC#WMEND start_store
IF~~THEN REPLY @284 EXTERN AC#WMEND bye

	CHAIN IF ~~ THEN AC#WMEND what_brings_you_here
	@286
	END
	IF~~THEN REPLY @282 EXTERN AC#WMEND what_do_you_have
	IF~~THEN REPLY @283 EXTERN AC#WMEND start_store
	IF~~THEN REPLY @284 EXTERN AC#WMEND bye
	
	CHAIN IF ~~ THEN AC#WMEND what_do_you_have
	@287
	END
	IF~~THEN REPLY @283 EXTERN AC#WMEND start_store
	IF~~THEN REPLY @284 EXTERN AC#WMEND bye

	CHAIN IF ~~ THEN AC#WMEND bye
	@288
	EXIT
	
	CHAIN IF ~~ THEN AC#WMEND start_store
	@289
	DO ~StartStore("AC#WMEND",LastTalkedToBy)~ EXIT
	
// Boy who's happy with sweeties

BEGIN ~AC#WBOY1~
BEGIN ~AC#WAEND~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#WBOY1 hello_0
@290
== AC#WAEND @298
== AC#WBOY1 @299
END
IF~~THEN REPLY @291 EXTERN AC#WBOY1 wheres_that_new_merchant
IF~~THEN REPLY @292 EXTERN AC#WBOY1 bye
IF~~THEN REPLY @293 EXTERN AC#WBOY1 bye
IF~~THEN REPLY @294 EXTERN AC#WBOY1 bye
IF~~THEN REPLY @295 EXTERN AC#WBOY1 bye

	CHAIN IF ~~ THEN AC#WBOY1 wheres_that_new_merchant
	@296
	DO ~ActionOverride("AC#WAEND",EscapeArea())
	EscapeArea()~ EXIT	
	
	CHAIN IF ~~ THEN AC#WBOY1 bye
	@297
	DO ~ActionOverride("AC#WAEND",EscapeArea())
	EscapeArea()~ EXIT	
	
// spice merchant trying to get rid of rival using gehenna chili
BEGIN ~AC#W01S1~

IF ~Global("AC#W01_Spicy","GLOBAL",11)~ THEN BEGIN hello_no_deal
SAY @0
IF ~~ THEN REPLY @1 GOTO told_truth
END

	IF ~~ THEN BEGIN told_truth
	SAY @2
	IF ~~ THEN DO ~SetGlobal("AC#W01_Spicy","GLOBAL",20)
		EscapeArea()~ EXIT 
		END

IF ~Global("AC#W01_Spicy","GLOBAL",3)~ THEN BEGIN hello_no_deal
SAY @3
IF ~~ THEN REPLY @4 GOTO liked_spice
END

	IF ~~ THEN BEGIN liked_spice
	SAY @5
	IF ~~ THEN REPLY @6 GOTO bye_damn_it
	IF ~~ THEN REPLY @7 + wheres_pepper_from
	END
	
	IF ~~ THEN BEGIN wheres_pepper_from
	SAY @8
	IF ~~ THEN GOTO bye_damn_it
	END

		IF ~~ THEN BEGIN bye_damn_it
		SAY @9
		IF ~~ THEN DO ~SetGlobal("AC#W01_Spicy","GLOBAL",20)
		EscapeArea()~ EXIT 
		END

IF ~Global("AC#W01_Spicy","GLOBAL",1)~ THEN BEGIN hello_again
SAY @10
IF ~~ THEN EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @11
IF ~~ THEN REPLY @12 GOTO second_best
IF ~~ THEN REPLY @13 GOTO second_best
END

	IF ~~ THEN BEGIN second_best
	SAY @14
	IF ~~ THEN REPLY @15 GOTO second_best_02
	IF ~~ THEN REPLY @16 + ok_listen
	END
	
		IF ~~ THEN BEGIN second_best_02
		SAY @17
		IF ~~ THEN GOTO ok_listen
		END
		
		IF ~~ THEN BEGIN ok_listen
		SAY @18
		IF ~~ THEN REPLY @19 GOTO get_off
		IF ~~ THEN REPLY @20 + what_should_i_do
		END
				
			IF ~~ THEN BEGIN what_should_i_do
			SAY @21
			IF ~~ THEN GOTO add_spices
			END
			
				IF ~~ THEN BEGIN add_spices
				SAY @22
				IF ~~ THEN REPLY @23 GOTO what_do_i_get
				IF ~~ THEN REPLY @24 GOTO get_off
				END
				
					IF ~~ THEN BEGIN what_do_i_get
					SAY @25
					IF ~~ THEN REPLY @26 GOTO accept
					IF ~~ THEN REPLY @27 + get_off
					END
					
						IF ~~ THEN BEGIN accept
						SAY @28
						IF ~~ THEN DO ~GiveItemCreate("AC#W08PP",LastTalkedToBy(),1,0,0)~ GOTO wait_here
						END
						
							IF ~~ THEN BEGIN wait_here
							SAY @29
							IF ~~ THEN DO ~SetGlobal("AC#W01_Spicy","GLOBAL",1)~ EXIT 
							END

			IF ~~ THEN BEGIN get_off
			SAY @30
			IF ~~ THEN DO ~SetGlobal("AC#W01_Spicy","GLOBAL",20)
			EscapeArea()~ EXIT 
			END

// merchant wrongfully accusing PCs for thievery
BEGIN ~AC#W01MX~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_thieves
   SAY @31
 IF ~~ THEN DO ~GiveItemCreate("AC#W01X1",Player1,1,0,0)~ GOTO help_me
 IF ~OR(2)
 CheckStatGT(Player1,16,DEX)
 CheckStatGT(Player1,1,PICKPOCKET)~ THEN DO ~GiveItemCreate("AC#W01X1",Player1,1,0,0)~ GOTO give_stolen_item
END

	IF ~~ THEN BEGIN give_stolen_item
	SAY @32
	IF ~~ THEN REPLY @266 GOTO help_me
	IF ~~ THEN REPLY @257 GOTO slipped_something
	END

		IF ~~ THEN BEGIN slipped_something
		SAY @258
		IF ~~ THEN REPLY @259 GOTO slipped_something_02
		IF ~~ THEN REPLY @260 GOTO help_me
		END
		
		IF ~~ THEN BEGIN slipped_something_02
		SAY @261
		IF ~~ THEN REPLY @262 GOTO slipped_something_03
		END
		
		IF ~~ THEN BEGIN slipped_something_03
		SAY @263
		IF ~~ THEN REPLY @264 GOTO slipped_something_bye
		END
		
		IF ~~ THEN BEGIN slipped_something_bye
		SAY @265
		IF ~~ THEN DO ~AddexperienceParty(300)
		EscapeArea()~ EXIT 
		END
	
	IF ~~ THEN BEGIN help_me
	SAY @33
	IF ~~ THEN REPLY @34 GOTO PC_theft_01
	IF ~~ THEN REPLY @35 GOTO PC_theft_01
	IF ~~ THEN REPLY @36 GOTO PC_theft_01
	END
	
		IF ~~ THEN BEGIN PC_theft_01
		SAY @37
		IF ~~ THEN DO ~SetGlobal("PC_Thievery","AC#W01",1)
		CreateCreatureObjectOffset("AC#W01GX",LastTalkedToBy,[10.10])~ EXIT 
		END
		
		IF ~~ THEN BEGIN where_is_guy_black_robes
		SAY @38
		IF ~~ THEN REPLY @39 EXTERN AC#W01GX chain_what_punishment
		END

// guard thievery
BEGIN ~AC#W01GX~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
   SAY @40
 IF ~~ THEN GOTO chain_thievery_01
END

	IF ~~ THEN BEGIN bye_let_him_go
	SAY @41
	IF ~~ THEN GOTO bye_final 
	END
	
	IF ~~ THEN BEGIN cut_hand_finish
	SAY @42
	IF ~~ THEN GOTO bye_final 
	END
		
	IF ~~ THEN BEGIN bye_final
	SAY @43
	IF ~~ THEN DO ~TakePartyItem("AC#W01X1")
	DestroyItem("AC#W01X1")
	AddexperienceParty(300)
	SetGlobal("PC_Thievery","AC#W01",10)
	ActionOverride("AC#W01MX",EscapeArea())
	EscapeArea()~ EXIT 
	END
	
	IF ~~ THEN BEGIN bye_keep_goblet
	SAY @255
	IF ~~ THEN DO ~AddexperienceParty(300)
	SetGlobal("PC_Thievery","AC#W01",10)
	ActionOverride("AC#W01MX",EscapeArea())
	EscapeArea()~ EXIT 
	END

	IF ~~ THEN BEGIN Nalia_thievery_02
	SAY @44
	IF ~~ THEN GOTO chain_accuse_thievery
	END
	
	IF ~~ THEN BEGIN your_version
	SAY @45
	IF ~~ THEN REPLY @46 GOTO chain_accuse_thievery
	END
// chain #1 

CHAIN IF ~~ THEN AC#W01GX chain_thievery_01
@47
== AC#W01MX @48  
== AC#W01GX @49   
END
IF ~~ THEN REPLY @50 EXTERN AC#W01MX chain_thievery_02

	CHAIN IF ~~ THEN AC#W01MX chain_thievery_02
	@51
	== AC#W01GX @52    
	END
	IF ~~ THEN REPLY @53 GOTO chain_thievery_03
	IF ~~ THEN REPLY @54 GOTO chain_thievery_03

		CHAIN IF ~~ THEN AC#W01MX chain_thievery_03
		@55  
		== AC#W01GX @56   
		END
		IF ~~ THEN REPLY @57 EXTERN AC#W01GX your_version 
		IF ~ReputationGT(LastTalkedToBy,15)~ THEN REPLY @58 EXTERN AC#W01GX your_version
		IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan_thievery_01
		IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ Nalia_thievery_01
		IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ Anomen_thievery_01
		IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ Korgan_thievery_01
		IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ Keldorn_thievery_01
		//IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ Jaheira_thievery_01
	
			CHAIN IF ~~ THEN AC#W01GX where_is_the_goblet
			@59
			== AC#W01MX @60    
			END
			IF ~~ THEN REPLY @61 GOTO chain_accuse_thievery


					CHAIN IF ~~ THEN AC#W01GX chain_korgan_thievery_axe
					@62
					== KORGANJ @63 				
					== AC#W01MX @64
					= @65 
					== AC#W01GX @66
					END
					IF ~~ THEN REPLY @39 GOTO chain_what_punishment
					IF ~~ THEN REPLY @67 EXTERN AC#W01MX where_is_guy_black_robes
				
				CHAIN IF ~~ THEN AC#W01GX chain_accuse_thievery
				@68
				== AC#W01MX @69
				= @70    
				END
				IF ~~ THEN REPLY @39 GOTO chain_what_punishment
				IF ~~ THEN REPLY @71 GOTO chain_what_punishment
				IF ~~ THEN REPLY @72 GOTO chain_what_punishment
				
				CHAIN IF ~~ THEN AC#W01GX chain_what_punishment
				@73
				== AC#W01MX @74 
				== AC#W01GX @75				
				END
				IF ~~ THEN REPLY @76 GOTO chain_let_him_go
				IF ~~ THEN REPLY @77 GOTO chain_left_hand
				IF ~~ THEN REPLY @78 GOTO chain_loose_head
				IF ~~ THEN REPLY @254 GOTO bye_keep_goblet
				
				CHAIN IF ~~ THEN AC#W01GX chain_let_him_go
				@79
				== AC#W01MX @80 				
				END
				IF ~~ THEN REPLY @81 GOTO bye_let_him_go
				IF ~~ THEN REPLY @77 GOTO chain_left_hand
				IF ~~ THEN REPLY @78 GOTO chain_loose_head
				
				CHAIN IF ~~ THEN AC#W01GX chain_left_hand
				@82
				== AC#W01MX @83 
				== AC#W01GX @84				
				END
				IF ~~ THEN REPLY @85 GOTO chain_let_him_go
				IF ~~ THEN REPLY @86 GOTO chain_look_left_hand
				IF ~~ THEN REPLY @87 GOTO cut_hand_finish
				
				CHAIN IF ~~ THEN AC#W01GX chain_loose_head
				@88
				== AC#W01MX @83 
				== AC#W01GX @84				
				END
				IF ~~ THEN REPLY @85 GOTO chain_let_him_go
				IF ~~ THEN REPLY @86 GOTO chain_look_left_hand
				IF ~~ THEN REPLY @87 GOTO cut_hand_finish
				
				CHAIN IF ~~ THEN AC#W01GX chain_look_left_hand
				@89			
				END
				IF ~~ THEN REPLY @85 GOTO chain_let_him_go
				IF ~~ THEN REPLY @87 GOTO cut_hand_finish
	
// spectators
BEGIN ~AC#W01C1~
BEGIN ~AC#W01C2~
BEGIN ~AC#W01C3~
BEGIN ~AC#W01C4~
BEGIN ~AC#W01C5~

// Tharundar Olehm final celebration
BEGIN ~AC#W01TH~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 01
   SAY @90
 IF ~~ THEN GOTO chain_celebration_01
END

	IF ~~ THEN BEGIN celebration_exit_01
	SAY @91
	=
	@92
	IF ~~ THEN REPLY @93 + something_else
	IF ~~ THEN REPLY @94 GOTO bye_finally
	IF ~~ THEN REPLY @95 GOTO bye_finally
	END
	
		IF ~~ THEN BEGIN something_else
		SAY @96
		IF ~GlobalGT("AC#W_TharundarSoul","GLOBAL",0)
		GlobalLT("AC#W_TharundarSoul","GLOBAL",20)~ THEN REPLY @97 GOTO about_your_soul
		IF ~PartyHasItem("AC#WGIL4")~ THEN REPLY @98 + have_traitor_letter
		IF ~~ THEN REPLY @99 GOTO bye_finally
		END
		
			IF ~~ THEN BEGIN have_traitor_letter
			SAY @100
			IF ~~ THEN REPLY @101 DO ~TakePartyItem("AC#WGIL4")
			SetGlobal("AC#W_Traitor_Goldspires","GLOBAL",1)
			EraseJournalEntry(@110018)
			AddJournalEntry(@110019,QUEST)~ GOTO have_traitor_letter_02
			END
			
				IF ~~ THEN BEGIN have_traitor_letter_02
				SAY @102
				=
				@103
				=
				@104
				IF ~~ THEN REPLY @93 + something_else
				IF ~~ THEN REPLY @302 GOTO bye_finally 
				END
	
		IF ~~ THEN BEGIN about_your_soul
		SAY @106
		IF ~~ THEN REPLY @107 GOTO about_your_soul_02
		END
		
			IF ~~ THEN BEGIN about_your_soul_02
			SAY @108
			IF ~Dead("AC#WNAL2")~ THEN REPLY @109 DO ~SetGlobal("AC#W_TharundarSoul","GLOBAL",20)~ + margrog_dead 
			IF ~~ THEN REPLY @110 + difficult_decision
			IF ~~ THEN REPLY @111 GOTO bye_finally
			END
			
				IF ~~ THEN BEGIN margrog_dead
				SAY @112
				IF ~~ THEN REPLY @113 GOTO margrod_thanks
				END
				
				IF ~~ THEN BEGIN difficult_decision
				SAY @114
				IF ~~ THEN REPLY @93 + something_else
				IF ~~ THEN REPLY @115 GOTO bye_finally
				END
				
					IF ~~ THEN BEGIN margrod_thanks
					SAY @116
					IF ~~ THEN REPLY @93 + something_else
					IF ~~ THEN REPLY @115 GOTO bye_finally
					END
	
	IF ~~ THEN BEGIN bye_finally
	SAY @117
	IF ~~ THEN DO ~SetGlobal("AC#WCelebration","GLOBAL",10)	
	DestroySelf()~ EXIT 
	END

// chain #1 

CHAIN IF ~~ THEN AC#W01TH chain_celebration_01
@118
== AC#W01C1 @119  
== AC#W01C2 @120  
== AC#W01C3 @121  
== AC#W01C4 @122  
== AC#W01C5 @123  
END
IF ~~ THEN GOTO chain_celebration_02

// chain #2

CHAIN IF ~~ THEN AC#W01TH chain_celebration_02
@124
== AC#W01C1 @125  
== AC#W01C2 @126  
== AC#W01C3 @127  
== AC#W01C4 @128    
END
IF ~~ THEN GOTO chain_secret
IF ~Global("AC#WaukeenWorldKnows","GLOBAL",1)~ THEN GOTO chain_tell_the_world

// chain #3A: Tharundar reveals charname
CHAIN IF ~~ THEN AC#W01TH chain_tell_the_world
@129 
END
IF ~~ THEN DO ~ReputationInc(2)~ GOTO chain_tell_the_world_02

	CHAIN IF ~~ THEN AC#W01TH chain_tell_the_world_02
	@130
	== AC#W01C1 @131  
	== AC#W01C2 @132  
	== AC#W01C3 @133  
	== AC#W01C4 @134  
	== AC#W01C5 @135  
	END
	IF ~~ THEN GOTO chain_festival
	
// chain #3B: Tharundar doesn't tell who is charname
CHAIN IF ~~ THEN AC#W01TH chain_secret
@136 
END
IF ~~ THEN GOTO chain_festival

CHAIN IF ~~ THEN AC#W01TH chain_festival
@137  
= @138  
== AC#W01C3 @139  
== AC#W01C4 @140    
END
IF ~~ THEN GOTO celebration_exit_01
/*
Dialogues Merchants
*/
BEGIN ~AC#W01M1~
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @141
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 1
   SAY @142
    IF ~~ THEN EXIT
END

BEGIN ~AC#W01M2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @143
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 1
   SAY @144
    IF ~~ THEN EXIT
END

BEGIN ~AC#W01M3~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @145
   IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,MALE)~ THEN BEGIN hello_lord
   SAY @146
    IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)~ THEN BEGIN hello_lady
   SAY @256
    IF ~~ THEN EXIT
END

BEGIN ~AC#W01G1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @147
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 1
   SAY @148
    IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
   Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @149 + thief_accuse
    IF ~~ THEN REPLY @150 + bye
    IF ~~ THEN REPLY @151 + bye
END

	IF ~~ THEN BEGIN thief_accuse
	SAY @152
	IF ~~ THEN REPLY @153 DO ~SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)  ReputationInc(1)~ + bye
	END

	IF ~~ THEN BEGIN bye
	SAY @154
	IF ~~ THEN EXIT
	END

BEGIN ~AC#W01G2~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @147
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 1
   SAY @148
    IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
   Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @149 + thief_accuse
    IF ~~ THEN REPLY @150 + bye
    IF ~~ THEN REPLY @151 + bye
END

	IF ~~ THEN BEGIN thief_accuse
	SAY @152
	IF ~~ THEN REPLY @153 DO ~SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)  ReputationInc(1)~ + bye
	END

	IF ~~ THEN BEGIN bye
	SAY @154
	IF ~~ THEN EXIT
	END

// Lucky Aello

BEGIN ~AC#LUCKY~

IF ~True()~ THEN BEGIN 0
   SAY @155
   IF ~~ THEN REPLY @156 GOTO 1
   IF ~~ THEN REPLY @157 GOTO bye_aello
   IF ~Global("AC_Lucky","AC#W01",0)~ THEN REPLY @158 GOTO 2
END

	IF ~~ THEN BEGIN bye_aello
	SAY @300
	IF ~~ THEN EXIT 
	END

IF ~~ THEN BEGIN 1
   SAY @159
   IF ~~ THEN DO ~StartStore("AC#LUCKY",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN 2
   SAY @160
   IF ~~ THEN REPLY @161 GOTO 1
   IF ~~ THEN REPLY @162 GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY @163
   IF ~~ THEN REPLY @161 GOTO 1
   IF ~~ THEN REPLY @164 GOTO 4
END

IF ~~ THEN BEGIN 4
   SAY @165
   IF ~~ THEN REPLY @161 GOTO 1
   IF ~~ THEN REPLY @166 GOTO 5
END

IF ~~ THEN BEGIN 5
   SAY @167
   IF ~~ THEN REPLY @161 GOTO 1
   IF ~~ THEN REPLY @168 GOTO 6
   IF ~~ THEN REPLY @169 GOTO 6
   IF ~~ THEN REPLY @170 GOTO 7
END

IF ~~ THEN BEGIN 6
   SAY @171
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",1)~ EXIT
END

IF ~~ THEN BEGIN 7
   SAY @172
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",1)~ EXIT
END

IF ~~ THEN BEGIN 8
   SAY @173
   IF ~~ THEN EXTERN ~ACLESTIU~ 1
END

IF ~~ THEN BEGIN 9
   SAY @174
   IF ~~ THEN EXTERN ~ACLESTIU~ 2
END

IF ~~ THEN BEGIN 10
   SAY @175
   IF ~~ THEN EXTERN ~ACLESTIU~ 3
END

IF ~~ THEN BEGIN 11
   SAY @176
   IF ~~ THEN EXTERN ~ACLESTIU~ 6
END

IF ~~ THEN BEGIN 12
   SAY @176
   IF ~~ THEN EXTERN ~ACLESTIU~ 7
END

BEGIN ~ACLESTIU~

IF ~Global("AC_Lucky","AC#W01",2)~ THEN BEGIN 0
   SAY @177
   IF ~~ THEN EXTERN ~AC#LUCKY~ 8
END

IF ~~ THEN BEGIN 1
   SAY @178
   IF ~~ THEN EXTERN ~AC#LUCKY~ 9
END

IF ~~ THEN BEGIN 2
   SAY @179
   IF ~~ THEN EXTERN ~AC#LUCKY~ 10
END

IF ~~ THEN BEGIN 3
   SAY @180
   =
   @181
   IF ~~ THEN REPLY @182 GOTO 4
   IF ~~ THEN REPLY @301 GOTO 4
END

IF ~~ THEN BEGIN 4
   SAY @183
   IF ~~ THEN REPLY @184 EXTERN ~AC#LUCKY~ 11
   IF ~~ THEN REPLY @185 GOTO 5
END

IF ~~ THEN BEGIN 5
   SAY @186
      IF ~~ THEN EXTERN ~AC#LUCKY~ 12
END

IF ~~ THEN BEGIN 6
   SAY @187
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",3)~ EXIT
END

IF ~~ THEN BEGIN 7
   SAY @187
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",4)~ EXIT
END

IF ~Global("AC_Lucky","AC#W01",5)~ THEN BEGIN 8
   SAY @188
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",7)~ EXIT
END

IF ~Global("AC_Lucky","AC#W01",6)~ THEN BEGIN 8
   SAY @189
   IF ~~ THEN DO ~SetGlobal("AC_Lucky","AC#W01",7)~ EXIT
END

BEGIN ~AC#W01N1~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @190
   IF ~~ THEN REPLY @191 GOTO 2
   IF ~~ THEN REPLY @192 GOTO 3
END

IF ~True()~ THEN BEGIN 1
   SAY @193
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
   SAY @194
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3
   SAY @195
   IF ~~ THEN EXIT
END


/*
Quest: Thief in Goldspires
__________________________________________________________________
*/
BEGIN ~AC#W01TW~

IF ~True()~ THEN BEGIN hello_0
SAY @196 
=
@197
=
@198
IF ~~ THEN DO ~SetGlobal("AC#WTHF1","GLOBAL",10)
EraseJournalEntry(@100203)
AddJournalEntry(@100204,QUEST_DONE)
EscapeArea()~ EXIT 
END

BEGIN ~AC#WTHF1~

IF ~Global("AC#WTHF1","GLOBAL",2)~ THEN BEGIN hello_it_worked
SAY @199
IF ~~ THEN GOTO youll_see
END

	IF ~~ THEN BEGIN youll_see
	SAY @200
	IF ~~ THEN GOTO look_gold
	END
	
		IF ~~ THEN BEGIN look_gold
		SAY @201
		IF ~~ THEN GOTO look_gold_02
		END
		
			IF ~~ THEN BEGIN look_gold_02
			SAY @202
			IF ~~ THEN DO ~SetGlobal("AC#WTHF1","GLOBAL",3)
			StartCutSceneMode()
			StartCutScene("AC#W01CH")~ EXIT 
			END

IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
   Global("AC#WTHF1","GLOBAL",0)~ THEN BEGIN Steal_1
   SAY @203
   IF ~PartyHasItem("AC#WTHF1")~ THEN REPLY @204 GOTO Steal_2
   IF ~!PartyHasItem("AC#WTHF1")~ THEN REPLY @205 GOTO Steal_3
END

IF ~~ THEN BEGIN Steal_2
   SAY @206
   IF ~~ THEN DO ~TakePartyItem("AC#WTHF1")~ GOTO Steal_4
END

IF ~~ THEN BEGIN Steal_3
   SAY @207
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Steal_4
   SAY @208
   IF ~~ THEN DO ~SetGlobal("AC#WTHF1","GLOBAL",1)
   SetGlobalTimer("AC#W_Wait_Thief","GLOBAL",ONE_DAY)
   EraseJournalEntry(@100200)
   EscapeArea()~ 
   UNSOLVED_JOURNAL @100203 EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @209
   IF ~~ THEN REPLY @210 GOTO 1
   IF ~~ THEN REPLY @211 GOTO 2
   IF ~~ THEN REPLY @212 GOTO bye_no_interest
END

IF ~~ THEN BEGIN 1
   SAY @213
   IF ~~ THEN REPLY @214 GOTO 3
   IF ~~ THEN REPLY @215 GOTO 4
   IF ~~ THEN REPLY @216 GOTO 2
END

IF ~~ THEN BEGIN 2
   SAY @217
   IF ~~ THEN DO ~EscapeArea()~ EXIT
END

	IF ~~ THEN BEGIN bye_no_interest
   SAY @218
   IF ~~ THEN DO ~EscapeArea()~ EXIT
	END

IF ~~ THEN BEGIN 3
   SAY @219
   IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 4
   SAY @220
   IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5
   SAY @221
   IF ~~ THEN REPLY @222 GOTO 6
   IF ~~ THEN REPLY @223 GOTO 15
   IF ~~ THEN REPLY @224 GOTO 2
   IF ~~ THEN REPLY @225 GOTO bye_guard
   IF ~~ THEN REPLY @226 GOTO bye_no_interest
END

	IF ~~ THEN BEGIN bye_guard
	SAY @227
	IF ~~ THEN DO ~EscapeArea()~ EXIT
	END

IF ~~ THEN BEGIN 6
   SAY @228
   IF ~~ THEN REPLY @229 GOTO 7
END

IF ~~ THEN BEGIN 7
   SAY @230
   IF ~~ THEN REPLY @231 GOTO 8
   IF ~~ THEN REPLY @232 GOTO 2
   IF ~~ THEN REPLY @225 GOTO bye_guard
   IF ~~ THEN REPLY @226 GOTO bye_no_interest
END

IF ~~ THEN BEGIN 8
   SAY @233
   IF ~~ THEN REPLY @234 GOTO 9
   IF ~~ THEN REPLY @235 GOTO 9
   IF ~~ THEN REPLY @232 GOTO 2
   IF ~~ THEN REPLY @225 GOTO bye_guard
   IF ~~ THEN REPLY @226 GOTO bye_no_interest
END

IF ~~ THEN BEGIN 9
   SAY @236
   IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ THEN REPLY @237 GOTO 10
   IF ~CheckStatGT(LastTalkedToBy,15,CHR)~ THEN REPLY @238 GOTO 11
   IF ~CheckStatGT(LastTalkedToBy,9,CHR)~ THEN REPLY @239 GOTO 12
   IF ~~ THEN REPLY @232 GOTO 2
   IF ~~ THEN REPLY @225 GOTO bye_guard
   IF ~~ THEN REPLY @226 GOTO bye_no_interest
   IF ~CheckStatLT(LastTalkedToBy,10,CHR)~ THEN REPLY @240 GOTO 13
END

IF ~~ THEN BEGIN 10
   SAY @241
   IF ~~ THEN DO ~SetGlobal("AC#W01_Steal","GLOBAL",4)~ GOTO 14
END

IF ~~ THEN BEGIN 11
   SAY @242
   IF ~~ THEN DO ~SetGlobal("AC#W01_Steal","GLOBAL",3)~ GOTO 14
END

IF ~~ THEN BEGIN 12
   SAY @243
   IF ~~ THEN DO ~SetGlobal("AC#W01_Steal","GLOBAL",2)~ GOTO 14
END

IF ~~ THEN BEGIN 13
   SAY @244
   IF ~~ THEN DO ~SetGlobal("AC#W01_Steal","GLOBAL",1)~ GOTO 14
END

IF ~~ THEN BEGIN 14
   SAY @245
   IF ~~ THEN UNSOLVED_JOURNAL @100200
EXIT
END

IF ~~ THEN BEGIN 15
   SAY @246
   IF ~~ THEN REPLY @247 GOTO 7
END

/*
BEGIN ~ACBAR01~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY ~Willkommen in meinem Gasthaus, Fremde! Im Namen der Priesterschaft Waukeens heiße ich Euch hier herzlich willkommen! Was kann ich für Euch tun?~
   IF ~~ THEN REPLY ~Ich suche den Hohepriester Tharundar Olehm. Wisst Ihr, wo ich ihn finden kann?~ GOTO 1
   IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ GOTO 2
   IF ~~ THEN REPLY ~Ich werde vielleicht später noch einmal wiederkommen. Gehabt Euch wohl.~ EXIT
END

IF ~~ THEN BEGIN 1
   SAY ~Oh, tut mir leid, das ist eine der wenigen Sachen, wo ich Euch überhaupt nicht weiterhelfen kann. Aber ich vermute mal, dass er sich im Verwaltungsgebäude nördlich von hier aufhält. Fragt dort noch einmal nach, da kann Euch sicher jemand weiterhelfen! Kann ich sonst noch was für Euch tun?~
   IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ GOTO 2
   IF ~~ THEN REPLY ~Ich werde vielleicht später noch einmal wiederkommen. Gehabt Euch wohl.~ EXIT
END

IF ~~ THEN BEGIN 2
   SAY ~Schön! Macht es Euch nur bequem, und ruft nach mir, wenn es Euch an etwas fehlen sollte!~
   IF ~~ THEN DO ~StartStore("Acbar01",LastTalkedToBy())~ EXIT
END

IF ~True()~ THEN BEGIN 3
   SAY ~Nett, Euch wiederzusehen, Fremde! Kann ich heute etwas für Euch tun?~
   IF ~~ THEN REPLY ~Ich suche den Hohepriester Tharundar Olehm. Wisst Ihr, wo ich ihn finden kann?~ GOTO 1
   IF ~~ THEN REPLY ~Ich würde gerne Eure Dienste in Anspruch nehmen.~ GOTO 2
   IF ~~ THEN REPLY ~Ich werde vielleicht später noch einmal wiederkommen. Gehabt Euch wohl.~ EXIT
END
*/
// NPC - Dialogues
APPEND ~JANJ~
IF ~~ THEN BEGIN Jan_thievery_01
SAY @248
IF ~~ THEN DO ~GiveItem("AC#W01X1","AC#W01MX")
DestroyItem("AC#W01X1")~ EXTERN AC#W01GX where_is_the_goblet
END
END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN Nalia_thievery_01
SAY @249
IF ~~ THEN EXTERN AC#W01GX Nalia_thievery_02
END
END

APPEND ~ANOMENJ~
IF ~~ THEN BEGIN Anomen_thievery_01
SAY @250
IF ~~ THEN EXTERN AC#W01GX chain_accuse_thievery
END
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN Korgan_thievery_01
   SAY @251
   =
   @252
   IF ~~ THEN EXTERN AC#W01GX chain_korgan_thievery_axe
END
END

APPEND ~KELDORJ~
IF ~~ THEN BEGIN Keldorn_thievery_01
   SAY @253
   IF ~~ THEN EXTERN AC#W01GX chain_accuse_thievery
END
END

