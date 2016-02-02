#include-once

; LeftClick = WW
; RightClick = WarCry
Global $WDZdpsZerkerButton = "{1}"
Global $WDZdpsBattleRageButton = "{2}"
Global $WDZdpsShoutButton = "{3}"
Global $WDZdpsIgnorePainButton = "{4}"
Global $WDZdpsSpamKey = 20 ; spacebar

func DoWDZdps()
	
		;DoWDZdpsBattleRage()
	
		DoWDZdpsZerker()
				
		DoWDZdpsIgnorePain()
		
		DoWDZdpsShout()
endfunc

func DoWDZdpsZerker()
	ControlSend($win_title, "", "", $WDZdpsZerkerButton)
endfunc

func DoWDZdpsShout()
	ControlSend($win_title, "", "", $WDZdpsShoutButton)
endfunc

func DoWDZdpsIgnorePain()
	ControlSend($win_title, "", "", $WDZdpsIgnorePainButton)
endfunc

func DoWDZdpsBattleRage()
	ControlSend($win_title, "", "", $WDZdpsBattleRageButton)
endfunc