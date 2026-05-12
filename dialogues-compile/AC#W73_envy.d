/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues AC#W73, test of envy chamber
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#W73DM~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#W73DM hello_0
@0
= @1
= @2
==JaheiraJ IF ~InParty("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @3
==AnomenJ IF ~InParty("anomen") !StateCheck("anomen",CD_STATE_NOTVALID)~ THEN @4
==KeldorJ IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN @5
END
IF~OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @6 EXTERN AC#W73DM nope_01
IF~OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @7 EXTERN AC#W73DM nope_01
IF~OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @8 EXTERN AC#W73DM betray
IF~OR(2)
!InParty("keldorn")
StateCheck("keldorn",CD_STATE_NOTVALID)~THEN REPLY @9 EXTERN AC#W73DM yes
IF ~InParty("keldorn") !StateCheck("keldorn",CD_STATE_NOTVALID)~ THEN EXTERN AC#W73DM take_ring_back

	CHAIN IF ~Global("Applause","LOCALS",1)~ THEN AC#W73DM applause
	@10
	DO ~SetGlobal("JobDone","AC#W73",1)
	SetGlobal("Gave_Player_Ring","AC#W73",10)
	SetGlobal("AC#W_test_envy","GLOBAL",10)
	AddexperienceParty(1000)
	CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(3)
	PlaySound("PORTAL2")
	DestroySelf()~ EXIT

	CHAIN IF ~~ THEN AC#W73DM betray
	@11
	END
	IF~~THEN REPLY @12 EXTERN AC#W73DM nope_01
	IF~~THEN REPLY @7 EXTERN AC#W73DM nope_01
	IF~~THEN REPLY @13 EXTERN AC#W73DM yes

CHAIN IF ~Global("Gave_Slave_Ring","AC#W73",1)~ THEN AC#W73DM hello_kill_him
@14
END
IF~~THEN REPLY @15 EXTERN AC#W73DM take_ring_back
IF~~THEN REPLY @9 EXTERN AC#W73DM yes
	
CHAIN IF ~Global("Gave_Player_Ring","AC#W73",1)~ THEN AC#W73DM hello_again
@16
END
IF~PartyHasItem("AC#W73RI")~THEN EXTERN AC#W73DM player_still_has_ring
IF~!PartyHasItem("AC#W73RI")~THEN EXTERN AC#W73DM player_has_ring_hidden

	CHAIN IF ~~ THEN AC#W73DM player_still_has_ring
	@17
	END
	IF~~THEN REPLY @18 EXTERN AC#W73DM take_ring_back
	IF~~THEN REPLY @19 EXTERN AC#W73DM keep_ring

	CHAIN IF ~~ THEN AC#W73DM take_ring_back
	@20
	DO ~ActionOverride("AC#W73SL",DestroyItem("AC#W73RI"))
	TakePartyItem("AC#W73RI")
	DestroyItem("AC#W73RI")
	SetGlobal("JobDone","AC#W73",1)
	SetGlobal("Gave_Player_Ring","AC#W73",10)
	SetGlobal("AC#W_test_envy","GLOBAL",10)
	Kill("AC#W73SL")
	CreateCreatureObjectOffset("AC#W73SN",Player1,[10.10])
	CreateCreatureObjectOffset("AC#W73SN",Player2,[10.10])
	CreateCreatureObjectOffset("AC#W73SN",Player3,[10.10])
	CreateCreatureObjectOffset("AC#W73SN",Player4,[10.10])
	CreateCreatureObjectOffset("AC#W73SN",Player5,[10.10])
	CreateCreatureObjectOffset("AC#W73SN",Player6,[10.10])
	AddexperienceParty(1000)
	CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(3)
	PlaySound("PORTAL2")
	DestroySelf()~ EXIT
	
	CHAIN IF ~~ THEN AC#W73DM keep_ring
	@21
	DO ~ActionOverride("AC#W73SL",DestroyItem("AC#W73RI"))
	SetGlobal("JobDone","AC#W73",1)
	SetGlobal("Gave_Player_Ring","AC#W73",10)
	SetGlobal("AC#W_test_envy","GLOBAL",10)
	Kill("AC#W73SL")
	AddexperienceParty(1000)
	CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(3)
	PlaySound("PORTAL2")
	DestroySelf()~ EXIT
	
	CHAIN IF ~~ THEN AC#W73DM player_has_ring_hidden
	@22
	DO ~Kill("AC#W73SL")
	AddexperienceParty(1000)
	SetGlobal("JobDone","AC#W73",1)
	SetGlobal("Gave_Player_Ring","AC#W73",10)
	SetGlobal("AC#W_test_envy","GLOBAL",10)
	CreateVisualEffectObject("SPDIMNDR",Myself)
	Wait(3)
	PlaySound("PORTAL2")
	DestroySelf()~ EXIT

CHAIN IF ~True()~ THEN AC#W73DM hello_again
@23
END
IF~~THEN REPLY @6 EXTERN AC#W73DM nope_01
IF~~THEN REPLY @9 EXTERN AC#W73DM yes

/*
CHAIN AC#W73DM maretta_01
~Tut sie das? Nach allem, was ich für sie getan habe? Und was hat sie Euch erzählt, dass Ihr so frenetisch ihrem Wunsch Folge leistet?~
END
IF~~THEN REPLY ~Wir sind nicht gekommen, um zu reden, sondern um Dich herauszufordern, Dämon!~ EXTERN AC#W73DM challenge
IF~~THEN REPLY ~Ihr werdet keine armen Seelen mehr stehlen!~ EXTERN AC#W73DM steal_souls

CHAIN AC#W73DM steal_souls
~Als würde ich an so etwas Interesse haben! Verdammte Sterbliche gibt es hier mehr als genug. Mir scheint es eher, als würde Maretta ihr gepudertes Kissen, auf dem sie ihren süßen Hintern plattsitzt, langsam zu heiß. Graz'zt wäre nicht erfreut, wenn er erfahren würde, dass eine seiner Statthalterinnen mit dem Feinde paktiert. Aber das wird jetzt nicht mehr Eure Sorge sein, närrische Sterbliche.~
END
IF~~THEN EXTERN AC#W73DM fight
*/
CHAIN AC#W73DM nope_01
@24
= @25
END
IF~~THEN REPLY @26 EXTERN AC#W73DM take_ring_back
IF~~THEN REPLY @27 EXTERN AC#W73DM take_a_look

CHAIN IF ~~ THEN AC#W73DM take_a_look
@28
DO ~GiveItemCreate("AC#W73RI",Player1,0,0,0)
SetGlobal("Gave_Player_Ring","AC#W73",1)
SetGlobalTimer("PlayerHasRing","GLOBAL",TWO_ROUNDS)
~ EXIT

	CHAIN IF ~~ THEN AC#W73DM yes
	@29
	DO ~GiveItemCreate("AC#W73RI","AC#W73SL",0,0,0)
SetGlobal("Gave_Slave_Ring","AC#W73",1)
SetGlobalTimer("WaitForKill","GLOBAL",TWO_ROUNDS)~ EXIT

	
	


