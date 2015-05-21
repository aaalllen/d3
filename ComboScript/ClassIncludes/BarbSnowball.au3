#include-once

; LeftClick = WW
; RightClick = WarCry
Global $SnowballZerkerButton = "{1}"
Global $SnowballBattleRageButton = "{2}"
Global $SnowballShoutButton = "{3}"
Global $SnowballIgnorePainButton = "{4}"
Global $SnowballSpamKey = 20 ; spacebar

Global $barbSnowballWarCryMillisecCD = 20000
Global $barbSnowballWarcryBuffTimer = TimerInit()

Global $barbSnowballBattleRageMillisecCD = 114000
Global $barbSnowballBattleRageBuffTimer = TimerInit()

func DoSnowballBarb()
	;check WarCry timer
	Local $warcryTimerDiff  =  TimerDiff($barbSnowballWarcryBuffTimer)	
	If $warcryTimerDiff >= $barbSnowballWarCryMillisecCD Then
		$barbSnowballWarcryBuffTimer = TimerInit()
		DoSnowballWarCry()
	EndIf
	
	;check BattleRage timer
	Local $battleRageTimerDiff  =  TimerDiff($barbSnowballBattleRageBuffTimer)	
	If $battleRageTimerDiff >= $barbSnowballBattleRageMillisecCD Then
		$barbSnowballBattleRageBuffTimer = TimerInit()
		DoSnowballBattleRage()
	EndIf
	
	;If _IsPressed($SnowballSpamKey) Then
	If $AutoSpam == true Then
		DoSnowballZerker()
		DoSnowballShout()
		DoSnowballIgnorePain()
	EndIf
endfunc

func DoSnowballZerker()
	ControlSend($win_title, "", "", $SnowballZerkerButton)
endfunc

func DoSnowballShout()
	ControlSend($win_title, "", "", $SnowballShoutButton)
endfunc

func DoSnowballIgnorePain()
	ControlSend($win_title, "", "", $SnowballIgnorePainButton)
endfunc

func DoSnowballWarCry()
	DoRightClick()
endfunc

func DoSnowballBattleRage()
	ControlSend($win_title, "", "", $SnowballBattleRageButton)
endfunc