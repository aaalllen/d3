; LeftClick = crippling wave
; RightClick = cyclone strike
Global $MonkMantraButton = "{1}"
Global $MonkSerenityButton = "{2}"
Global $MonkEpiphanyButton = "{3}"
Global $MonkInnerSancButton = "{4}"
Global $monkMantraMillisecCD = 2800

Global $monkMantraTimer = TimerInit()

func DoZdpsMonk()
	Local $timerDiff  =  TimerDiff($monkMantraTimer)
	DoLeftClick()
	
	;check mantra CD timer
	If $timerDiff >= $monkMantraMillisecCD Then
		$monkMantraTimer = TimerInit()
		ControlSend($win_title, "", "", $MonkMantraButton)
	EndIf
	
	; 2/3/4
	ControlSend($win_title, "", "", $MonkSerenityButton)		
	DoLeftClick()
	ControlSend($win_title, "", "", $MonkEpiphanyButton)
	DoLeftClick()
	ControlSend($win_title, "", "", $MonkInnerSancButton)
	DoLeftClick()
endfunc
