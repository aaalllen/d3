#include-once

func AntiIdle()
	$AntiIdle = NOT $AntiIdle	
	
	while $AntiIdle
		ControlSend($win_title, "", "", "{i}")
		
		ToolTip("Idling",0,0)
		sleep(Random(45000,69200, 1))
	wend
	
	ToolTip("")
endfunc