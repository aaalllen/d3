#include-once

; LeftClick = Consecration
; RightClick = Law
Global $CrusaderLoNSteedChargeButton = "{a}"
Global $CrusaderLoNAKChampionButton = "{w}"
Global $CrusaderLoNIronSkinButton = "{s}"
Global $CrusaderLoNBombardmentButton = "{d}"

; Timers
Global $CrusaderLoNSteedDuration = 4900
Global $CrusaderLoNSteedMillisecCD = $CrusaderLoNSteedDuration - 500
Global $CrusaderLoNSteedBuffTimer = TimerInit() - ($CrusaderLoNSteedDuration + 1000)

func DoCrusaderLoN()
	;check WarCry timer
	;Local $steedTimerDiff  =  TimerDiff($CrusaderLoNSteedBuffTimer)	
	;If $steedTimerDiff >= $CrusaderLoNSteedMillisecCD Then
		;$CrusaderLoNSteedBuffTimer = TimerInit()
		
		
		;CrusaderLoNLeftClick()	
		
		CrusaderLoNIronSkin()
		CrusaderLoNAKChampion()
		;sleep(200)
		
		;CrusaderLoNLeftClick()						
		CrusaderLoNRightClick()
		CrusaderLoNBombardment()
		
		CrusaderLoNLeftClick()	
		
		CrusaderLoNSteed()
	;EndIf
	
endfunc

func StartCrusaderLoN()
	;Send("{E down}")
endfunc

func EndCrusaderLoN()
	;Send("{E up}")
	
	;CrusaderLoNResetTimers()
endfunc

func CrusaderLoNResetTimers()
	$CrusaderLoNSteedBuffTimer = TimerInit() - ($CrusaderLoNSteedDuration + 1000)
endfunc

func CrusaderLoNSteed()
	ControlSend($win_title, "", "", $CrusaderLoNSteedChargeButton)
endfunc

func CrusaderLoNBombardment()
	ControlSend($win_title, "", "", $CrusaderLoNBombardmentButton)
endfunc

func CrusaderLoNAKChampion()
	ControlSend($win_title, "", "", $CrusaderLoNAKChampionButton)
endfunc

func CrusaderLoNIronSkin()
	ControlSend($win_title, "", "", $CrusaderLoNIronSkinButton)
endfunc

func CrusaderLoNLeftClick()
	;Send("{E up}")
	Send("{SPACE DOWN}")
	DoLeftClick()
	Send("{SPACE UP}")

	;HoldLeftClick()
	;ReleaseLeftClick()
endfunc

func CrusaderLoNRightClick()
	DoRightClick()
endfunc