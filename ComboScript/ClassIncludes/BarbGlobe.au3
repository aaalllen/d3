#include-once

; LeftClick = Hammer
; RightClick = Ancients
Global $BarbGlobeIgnorePainButton = "{2}"
Global $BarbGlobeZerkerButton = "{3}"
Global $BarbGlobeWarCryButton = "{4}"

; Timers
Global $BarbGlobeWarCryDuration = 20000
Global $BarbGlobeIgnorePainDuration = 11000
Global $BarbGlobeWarCryMillisecCD = $BarbGlobeWarCryDuration - 500
Global $BarbGlobeIgnorePainMillisecCD = $BarbGlobeIgnorePainDuration - 500
BarbGlobeResetTimers()

func DoBarbGlobe()
	;check WarCry timer
	Local $warcryTimerDiff  =  TimerDiff($BarbGlobeWarcryBuffTimer)	
	If $warcryTimerDiff >= $BarbGlobeWarCryMillisecCD Then
		$BarbGlobeWarcryBuffTimer = TimerInit()
		BarbGlobeWarCry()
	EndIf
	
	;check IgnorePain timer
	Local $ignorePainTimerDiff  =  TimerDiff($BarbGlobeIgnorePainBuffTimer)	
	If $ignorePainTimerDiff >= $BarbGlobeIgnorePainMillisecCD Then
		$BarbGlobeIgnorePainBuffTimer = TimerInit()
		BarbGlobeIgnorePain()
	EndIf
	
	BarbGlobeZerker()
endfunc

func StartBarbGlobe()
endfunc

func EndBarbGlobe()	
	BarbGlobeResetTimers()
endfunc

func BarbGlobeResetTimers()
	$BarbGlobeWarcryBuffTimer = TimerInit() - ($BarbGlobeWarCryDuration + 1000)
	$BarbGlobeIgnorePainBuffTimer = TimerInit() - 9500
endfunc

func BarbGlobeWarCry()
	ControlSend($win_title, "", "", $BarbGlobeWarCryButton)
endfunc

func BarbGlobeIgnorePain()
	ControlSend($win_title, "", "", $BarbGlobeIgnorePainButton)
endfunc

func BarbGlobeZerker()
	ControlSend($win_title, "", "", $BarbGlobeZerkerButton)
endfunc