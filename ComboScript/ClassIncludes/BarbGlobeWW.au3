#include-once

; LeftClick = WW
; RightClick = Ground Stomp
Global $BarbGlobeWWIgnorePainButton = "{2}"
Global $BarbGlobeWWFalterButton = "{3}"
Global $BarbGlobeWWWarCryButton = "{4}"

; Timers
Global $BarbGlobeWWWarCryDuration = 20000
Global $BarbGlobeWWIgnorePainDuration = 11000
Global $BarbGlobeWWWarCryMillisecCD = $BarbGlobeWWWarCryDuration - 500
Global $BarbGlobeWWIgnorePainMillisecCD = $BarbGlobeWWIgnorePainDuration - 500
BarbGlobeWWResetTimers()

func DoBarbGlobeWW()
	;check WarCry timer
	Local $warcryTimerDiff  =  TimerDiff($BarbGlobeWWWarcryBuffTimer)	
	If $warcryTimerDiff >= $BarbGlobeWWWarCryMillisecCD Then
		$BarbGlobeWWWarcryBuffTimer = TimerInit()
		BarbGlobeWWWarCry()
	EndIf
	
	;check IgnorePain timer
	Local $ignorePainTimerDiff  =  TimerDiff($BarbGlobeWWIgnorePainBuffTimer)	
	If $ignorePainTimerDiff >= $BarbGlobeWWIgnorePainMillisecCD Then
		$BarbGlobeWWIgnorePainBuffTimer = TimerInit()
		BarbGlobeWWIgnorePain()
	EndIf
	
	BarbGlobeWWFalter()
endfunc

func StartBarbGlobeWW()
	Send("{SPACE down}")
	HoldLeftClick()
endfunc

func EndBarbGlobeWW()
	ReleaseLeftClick()
	Send("{SPACE up}")
	
	BarbGlobeWWResetTimers()
endfunc

func BarbGlobeWWResetTimers()
	$BarbGlobeWWWarcryBuffTimer = TimerInit() - ($BarbGlobeWWWarCryDuration + 1000)
	$BarbGlobeWWIgnorePainBuffTimer = TimerInit() - 9500
endfunc

func BarbGlobeWWWarCry()
	ControlSend($win_title, "", "", $BarbGlobeWWWarCryButton)
endfunc

func BarbGlobeWWIgnorePain()
	ControlSend($win_title, "", "", $BarbGlobeWWIgnorePainButton)
endfunc

func BarbGlobeWWFalter()
	ControlSend($win_title, "", "", $BarbGlobeWWFalterButton)
endfunc
