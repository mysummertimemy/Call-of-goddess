/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogue book of fiends:
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WBKFD~

IF ~True()~ THEN BEGIN 0
   SAY @0 
   IF ~~ THEN REPLY @1 + close_book
   IF ~Global("AC#W01_Book_of_fiends","GLOBAL",0)~ THEN REPLY @2 DO ~SetGlobal("AC#W01_Book_of_fiends","GLOBAL",1)~ + open_book
   IF ~Global("AC#W01_Book_of_fiends","GLOBAL",1)~ THEN REPLY @2 + whats_up
END

IF ~~ THEN BEGIN open_book
SAY @3
IF ~~ THEN GOTO first_talk
END

	IF ~~ THEN BEGIN first_talk
	SAY @4
	IF ~~ THEN REPLY @5 GOTO who_are_you
	END
	
		IF ~~ THEN BEGIN who_are_you
		SAY @6
		IF ~~ THEN REPLY @7 GOTO better_friends
		IF ~~ THEN REPLY @8 + whats_your_name
		IF ~~ THEN REPLY @9 + what_do_you_do
		IF ~~ THEN REPLY @10 + close_book
		END
		
		
		IF ~~ THEN BEGIN better_friends 
		SAY @11
		IF ~~ THEN REPLY @9 + what_do_you_do
		IF ~~ THEN REPLY @12 + bye_book		
		IF ~~ THEN REPLY @10 + close_book
		END
		
		IF ~~ THEN BEGIN whats_your_name
		SAY @13
		IF ~~ THEN REPLY @7 GOTO better_friends
		IF ~~ THEN REPLY @9 + what_do_you_do
		IF ~~ THEN REPLY @10 + close_book
		END
		
			IF ~~ THEN BEGIN what_do_you_do
			SAY @14
			IF ~~ THEN REPLY @15 GOTO about_place 
			IF ~~ THEN REPLY @12 + bye_book
			IF ~~ THEN REPLY @10 + close_book
			END

	IF ~~ THEN BEGIN whats_up
	SAY @16
	IF ~~ THEN REPLY @17 GOTO about_place
	IF ~~ THEN REPLY @18 GOTO who_are_you
	IF ~~ THEN REPLY @9 + what_do_you_do
	IF ~~ THEN REPLY @19 + bye_book
	IF ~~ THEN REPLY @1 + close_book
	END

		IF ~~ THEN BEGIN bye_book
		SAY @20
		IF ~~ THEN GOTO close_book
		END

IF ~~ THEN BEGIN close_book
   SAY @21
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN about_place
SAY @22
IF ~GlobalGT("AC#W_AcidSwampQuest","GLOBAL",0)~ THEN REPLY @23 GOTO acid_pools_of_yemach
IF ~~ THEN REPLY @24 + in_samora
IF ~~ THEN REPLY @25 + places_in_samora
IF ~~ THEN REPLY @26 + about_place_where_we_are
IF ~~ THEN REPLY @27 + about_tanarri
IF ~Global("AC#W_Larva_quest","GLOBAL",0)~ THEN REPLY @28 + search_margrog
IF ~~ THEN REPLY @29 + about_people
IF ~~ THEN REPLY @30 + in_infinite_staircase
IF ~~ THEN REPLY @18 GOTO who_are_you
IF ~~ THEN REPLY @9 + what_do_you_do
IF ~~ THEN REPLY @19 + bye_book
IF ~~ THEN REPLY @31 + close_book
END

IF ~~ THEN BEGIN search_margrog
SAY @32
IF ~~ THEN REPLY @33 + about_place
IF ~~ THEN REPLY @31 + close_book 
END

	IF ~~ THEN BEGIN places_in_samora
	SAY @34
	IF ~~ THEN REPLY @35 + in_sodden_solar
	IF ~~ THEN REPLY @36 GOTO in_marettas_beds
	IF ~~ THEN REPLY @37 GOTO in_damned_fortune
	IF ~~ THEN REPLY @38 + places_outside_samora
	IF ~GlobalGT("AC#W_AcidSwampQuest","GLOBAL",0)~ THEN REPLY @23 GOTO acid_pools_of_yemach
	IF ~~ THEN REPLY @33 + about_place
	IF ~~ THEN REPLY @31 + close_book 	
	END
	
		IF ~~ THEN BEGIN places_outside_samora
		SAY @39
		IF ~~ THEN REPLY @25 + places_in_samora
		IF ~~ THEN REPLY @40 + in_soulfields
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book  
		END
		
		
		IF ~~ THEN BEGIN about_people
		SAY @41
		IF ~~ THEN REPLY @42 GOTO about_grazzt
		IF ~~ THEN REPLY @43 + about_maretta
		IF ~Global("AC#W_Larva_quest","GLOBAL",1)~ THEN REPLY @44 + about_margrog
		END
				
		IF ~~ THEN BEGIN about_margrog
		SAY @45
		=
		@46
		=
		@47
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

		IF ~~ THEN BEGIN about_grazzt
		SAY @48 
		=
		@49
		=
		@50
		=
		@51
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END
		
		IF ~~ THEN BEGIN about_maretta
		SAY @52
		=
		@53
		=
		@54 
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

		IF ~~ THEN BEGIN about_tanarri
	SAY @55
	= 
	@56
	=
	@57
	=
	@58
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book 
		END

	IF ~~ THEN BEGIN about_place_where_we_are
	SAY @59
	IF ~~ THEN GOTO no_place_i_know
	IF ~AreaCheck("AC#W30")~ THEN GOTO in_infinite_staircase
	IF ~AreaCheck("AC#W40")~ THEN GOTO in_samora
	IF ~AreaCheck("AC#W41")~ THEN GOTO in_sodden_solar
	IF ~AreaCheck("AC#W42")~ THEN GOTO in_marettas_beds
	IF ~AreaCheck("AC#W49")~ THEN GOTO in_damned_fortune
	IF ~AreaCheck("AC#W50")~ THEN GOTO in_soulfields
	IF ~AreaCheck("AC#W54")~ THEN GOTO acid_pools_of_yemach
	IF ~AreaCheck("AC#W80")~ THEN GOTO in_grazzts_prison
	END
	
		IF ~~ THEN BEGIN in_infinite_staircase
		SAY @60
		=
		@61
		=
		@62
		=
		@63
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book 
		END

		IF ~~ THEN BEGIN in_samora
		SAY @64
		=
		@65
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book 
		END
	
		IF ~~ THEN BEGIN in_sodden_solar
		SAY @66
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END
		
		IF ~~ THEN BEGIN in_marettas_beds
		SAY @67
		=
		@68
		=
		@69
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END
		
		IF ~~ THEN BEGIN in_grazzts_prison
		SAY @70
		=
		@71
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

		IF ~~ THEN BEGIN no_place_i_know
		SAY @72
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

		IF ~~ THEN BEGIN acid_pools_of_yemach
		SAY @73
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END
		
		IF ~~ THEN BEGIN in_soulfields
		SAY @74
		=
		@75 
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

		IF ~~ THEN BEGIN in_damned_fortune
		SAY @76
		=
		@77
		=
		@78
		IF ~~ THEN REPLY @33 + about_place
		IF ~~ THEN REPLY @31 + close_book
		END

