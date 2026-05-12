/***************************************************************************************************************************************************
****************************************************************************************************************************************************
Dialogues in Waukeen's temple AC#W03
****************************************************************************************************************************************************
****************************************************************************************************************************************************/
BEGIN ~AC#WDAER~

IF ~Global("AC#WaukeenWorldKnows","GLOBAL",1)
Global("Thankyou","LOCALS",0)~ THEN BEGIN hello_thanks
SAY @0
IF ~~ THEN DO ~SetGlobal("Thankyou","LOCALS",1)~ EXIT 
END

IF ~True()~ THEN BEGIN 0 // from:
  SAY #58435 /* ~Willkommen. Dieser Altar ist Waukeen geweiht, unserer Herrin der Münzen. Sie, die gütig auf alle herablächelt, die handeln. Gibt es etwas, dass ich für Euch tun könnte?~ */
  IF ~~ THEN REPLY #58436 /* ~Ich dachte, Waukeen wäre tot. Wie könnt Ihr sie immer noch anbeten?~ */ GOTO 1
  IF ~~ THEN REPLY #58451 /* ~Handel scheint mir nicht sonderlich heilig zu sein.~ */ GOTO 4
  IF ~~ THEN REPLY #58452 /* ~Ich würde gern Eure Dienste in Anspruch nehmen, bitte.~ */ GOTO 7
  IF ~~ THEN REPLY #58453 /* ~Nichts. Ich gehe jetzt.~ */ GOTO 8
END

IF ~~ THEN BEGIN 1 // from: 0.0 6.0
  SAY #58437 /* ~Mein Kind, Waukeen ist nicht tot. Sie wird... vermisst. Lliira, die Göttin der Freude, gewährt ihren Anhängern während ihrer Abwesenheit Macht, momentan zumindest.~ */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY #58438 /* ~Einige haben unsere Herrin verlassen, um Shaundakar anzubeten, die Göttin der Karawanen, und auch einige andere... aber es gibt trotzdem noch viele, die geduldig auf ihre Rückkehr warten.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #58439 /* ~Ich stehe fest im Glauben. Waukeen ist Amns Schutzheilige, und wenn sie zurückkehrt, werden alle Krankheiten, die uns befallen haben, vergehen... Ihr werdet schon sehen.~ */
  IF ~~ THEN REPLY #58440 /* ~Ich habe Handel nie als etwas angesehen, das man anbeten könnte.~ */ GOTO 4
  IF ~~ THEN REPLY #58449 /* ~Ich würde jetzt gern Eure Dienste in Anspruch nehmen, bitte.~ */ GOTO 7
  IF ~~ THEN REPLY #58450 /* ~Ich mache mich jetzt auf den Weg.~ */ GOTO 8
END

IF ~~ THEN BEGIN 4 // from: 0.1 3.0
  SAY #58441 /* ~Ich bin sicher, es gibt viele, die so denken wie Ihr, mein Kind. Wie erklärt Ihr Euch dann den Wohlstand durch den ganzen Handel, der in den Reichen betrieben wird?~ */
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #58442 /* ~Wunderbare Städte wurden errichtet, verschiedene Kulturen fangen an, miteinander zu kommunizieren... alles wegen des Handels. Ohne ihn würden wir immer noch in Höhlen leben.~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #58443 /* ~Für viele, die Handel betreiben, gibt es nicht Wichtigeres auf der Welt. Unter Waukeens Schirmherrschaft werden Vermögen gewonnen und wieder verloren.~ */
  IF ~~ THEN REPLY #58444 /* ~Ich dachte, Waukeen wäre tot. Wie könnt Ihr sie immer noch anbeten?~ */ GOTO 1
  IF ~~ THEN REPLY #58445 /* ~Ich würde gern sehen, was Ihr anzubieten habt.~ */ GOTO 7
  IF ~~ THEN REPLY #58447 /* ~Ich mache mich jetzt auf den Weg.~ */ GOTO 8
END

IF ~~ THEN BEGIN 7 // from: 0.2 3.1 6.1
  SAY #58446 /* ~Natürlich. Die Anhänger Waukeens sind immer bereit, zu dienen... zu einem fairen und ehrlichen Preis, versteht sich.~ */
  IF ~~ THEN DO ~StartStore("AC#W03ST",LastTalkedToBy)~ EXIT
END

IF ~~ THEN BEGIN 8 // from: 0.3 3.2 6.2
  SAY #58448 /* ~Möge das Glück mit Euch sein, <GIRLBOY>.~ */
  IF ~~ THEN EXIT
END

BEGIN ~AC#WFAER~

IF ~Global("AC#WaukeenWorldKnows","GLOBAL",1)
Global("Thankyou","LOCALS",0)~ THEN BEGIN hello_thanks
SAY @0
IF ~~ THEN DO ~SetGlobal("Thankyou","LOCALS",1)~ EXIT 
END

IF ~Global("Faerthae_Steal","AC#W03",1)~ THEN BEGIN steal
SAY @1
IF ~~ THEN DO ~SetGlobal("Faerthae_Steal","AC#W03",0)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @2
IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @7 + farthae_thief
IF ~~ THEN REPLY @33 GOTO bye_farthae
END

IF ~True()~ THEN BEGIN hello_1
SAY @3
IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @7 + farthae_thief
IF ~~ THEN REPLY @33 GOTO bye_farthae
END

IF ~~ THEN BEGIN bye_farthae
SAY @32
IF ~~ THEN EXIT
END

	IF ~~ THEN BEGIN farthae_thief
	SAY @8
	IF ~~ THEN DO ~GiveGoldForce(100) SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)~ EXIT 
	END

BEGIN ~AC#WASSO~

IF ~Global("AC#WaukeenWorldKnows","GLOBAL",1)
Global("Thankyou","LOCALS",0)~ THEN BEGIN hello_thanks
SAY @0
IF ~~ THEN DO ~SetGlobal("Thankyou","LOCALS",1)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @4
   IF ~~ THEN REPLY @5 GOTO 1
   IF ~~ THEN REPLY @6 GOTO 2
   IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
   Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @7 + thief
END

	IF ~~ THEN BEGIN thief
	SAY @8
	IF ~~ THEN REPLY @5 DO ~GiveGoldForce(100) SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)  ~ GOTO 1
	IF ~~ THEN REPLY @9 DO ~GiveGoldForce(100) SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)  ~ + what_do_you_want
	END
	
	IF ~~ THEN BEGIN what_do_you_want
   SAY @10
   IF ~~ THEN REPLY @5 GOTO 1
   IF ~~ THEN REPLY @6 GOTO 2
	END

IF ~~ THEN BEGIN 1
   SAY @11 
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
   SAY @12
   IF ~~ THEN REPLY @13 GOTO 3
END

IF ~~ THEN BEGIN 3
   SAY @14 
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 4
   SAY @15
   IF ~~ THEN REPLY @16 GOTO 5
   IF ~~ THEN REPLY @17 GOTO 5
   IF ~GlobalGT("AC#W01_Steal","GLOBAL",0)
   Global("AC#W01_ThiefAccused","GLOBAL",0)~ THEN REPLY @7 + thief_02
END

	IF ~~ THEN BEGIN thief_02
	SAY @8
	IF ~~ THEN REPLY @9 DO ~GiveGoldForce(100) SetGlobal("AC#W01_ThiefAccused","GLOBAL",10) SetGlobal("AC#W01_Steal","GLOBAL",20) AddJournalEntry(@100210,QUEST_DONE)  EraseJournalEntry(@100200)  ~ + 5
	END

IF ~~ THEN BEGIN 5
   SAY @18
   IF ~~ THEN EXIT
END

BEGIN ~AC#WCOOK~

IF ~Global("AC#WaukeenWorldKnows","GLOBAL",1)
Global("Thankyou","LOCALS",0)~ THEN BEGIN hello_thanks
SAY @19
IF ~~ THEN DO ~SetGlobal("Thankyou","LOCALS",1)~ EXIT 
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
   SAY @20
   IF ~~ THEN REPLY @21 GOTO 1
   IF ~~ THEN REPLY @22 GOTO 2
   IF ~~ THEN REPLY @23 GOTO 3
   IF ~~ THEN REPLY @24 GOTO 3
END

IF ~~ THEN BEGIN 1
   SAY @25
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
   SAY @26
   IF ~~ THEN REPLY @27 GOTO 4
   IF ~~ THEN REPLY @28 EXIT
END

IF ~~ THEN BEGIN 3
   SAY @29
   IF ~~ THEN EXIT 
END

IF ~~ THEN BEGIN 4
   SAY @30
   IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN hello_again
SAY @31
IF ~~ THEN EXIT 
END

