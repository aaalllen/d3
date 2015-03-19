#include-once

func RequestInvite()	
	if WinActive($win_title) AND NOT $Paused Then
		;; Hover over the player to request an invite from and press the hotkey
		MouseClick("right")
		
		;; use this section to help get the right coordinates
		;$jPos = MouseGetPos()
		;MsgBox(0, "Mouse x,y:", $jPos[0] & "," & $jPos[1])
		
		MouseClick("left",416,895,1,2)	
	endif

endfunc

func CheckMouseCoord()	
	if WinActive($win_title) AND NOT $Paused Then
		; use this section to help get the right coordinates
		$jPos = MouseGetPos()
		MsgBox(0, "Mouse x,y:", $jPos[0] & "," & $jPos[1])
	endif

endfunc