#include-once

#include "Clicking.au3"
#include "ChatPause.au3"
#include "AntiIdle.au3"
#include "RequestInvite.au3"
#include "GearSwitch.au3"

;------------------------------------------------------------------------------
; Helper functions
;------------------------------------------------------------------------------
func RequestEnd()
	$MB_YESNO = 4
	$MB_YES = 6

	if MsgBox($MB_YESNO, $title, "End script?") == $MB_YES then
		Exit
	endif
endfunc
 
func ErrorMsg()
   MsgBox(0, $title, "Incorrect value entered or the user pressed cancel. Default value will be used!")
endfunc
