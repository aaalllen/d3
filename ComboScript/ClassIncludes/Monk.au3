#include-once

; LeftClick = Cyclone stroke
; RightClick = Inner Sanctuary
Global $MonkEpiphanyButton = "{1}"
Global $MysticAllyButton = "{2}"
Global $MonkBlindingLightButton = "{3}"
Global $MonkMantraButton = "{4}"

;Global $MonkSerenityButton = "{3}"

;Global $MonkInnerSancButton = "{4}"
;Global $monkMantraMillisecCD = 2800

;Global $monkMantraTimer = TimerInit()

func DoDuoMonk()
	;DoRightClick()
	ControlSend($win_title, "", "", "{3}")
endfunc

func DoZdpsMonk()
;	Local $timerDiff  =  TimerDiff($monkMantraTimer)
	;DoLeftClick()
	
	;check mantra CD timer
;	If $timerDiff >= $monkMantraMillisecCD Then
;		$monkMantraTimer = TimerInit()
;		ControlSend($win_title, "", "", $MonkMantraButton)
;	EndIf
	
;	ControlSend($win_title, "", "", $MonkSerenityButton)		
;	DoLeftClick()
;	ControlSend($win_title, "", "", $MonkEpiphanyButton)
;	DoLeftClick()
;	ControlSend($win_title, "", "", $MonkInnerSancButton)
;	DoLeftClick()
	DoMonkMantra()
	DoMonkEpiphany()
	DoMonkBlindingLight()
	DoMonkMantra()
	DoInnerSanctuary()
	DoMonkMantra()
endfunc

func DoMonkEpiphany()
	ControlSend($win_title, "", "", $MonkEpiphanyButton)
endfunc

func DoMonkBlindingLight()
	ControlSend($win_title, "", "", $MonkBlindingLightButton)
endfunc

func DoMonkMantra()
	ControlSend($win_title, "", "", $MonkMantraButton)
endfunc

func DoInnerSanctuary()
	DoRightClick()
endfunc