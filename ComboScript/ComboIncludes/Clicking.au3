#include-once

func DoLeftClick()
	DoClick("left")
endfunc

func DoRightClick()
	DoClick("right")
endfunc

func DoClick($mouseButton)
	$jPos = MouseGetPos()
	ControlClick($win_title, "", "", $mouseButton, 1, $jPos[0],$jPos[1])
endfunc

func DebugMousePosition()
	$jPos = MouseGetPos()
	MsgBox(0, "Mouse x,y:", $jPos[0] & "," & $jPos[1])
endfunc