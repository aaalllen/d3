Global $monkMantraTimer = TimerInit()

; LeftClick = crippling wave
; RightClick = cyclone strike
Global $MonkMantraButton = "{1}"
Global $MonkSerenityButton = "{2}"
Global $MonkEpiphanyButton = "{3}"
Global $MonkInnerSancButton = "{4}"
Global $monkMantraMillisecCD = 2800

func DoZdpsMonk()
	Local $timerDiff  =  TimerDiff($monkMantraTimer)
	MouseClick("left")	
	
	;check mantra CD timer
	If $timerDiff >= $monkMantraMillisecCD Then
		$monkMantraTimer = TimerInit()
		ControlSend($win_title, "", "", $MonkMantraButton)
	EndIf
	
	; 2/3/4
	ControlSend($win_title, "", "", $MonkSerenityButton)		
	MouseClick("left")
	ControlSend($win_title, "", "", $MonkEpiphanyButton)
	MouseClick("left")
	ControlSend($win_title, "", "", $MonkInnerSancButton)
	MouseClick("left")
endfunc
