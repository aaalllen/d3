#include <Misc.au3>
#Include <Array.au3>

#RequireAdmin
_Singleton("D3AntiIdle")

;------------------------------------------------------------------------------
; Set the variables and keybindings
;------------------------------------------------------------------------------
#include "ComboIncludes/StartingIncludes.au3"
#include "ClassIncludes/ClassIncludes.au3"
#include "ComboIncludes/ReadSettings.au3"
ReadSettings()

;------------------------------------------------------------------------------
; Set Class Spam Types (holding down 3)
;------------------------------------------------------------------------------
Global $SpamKeyPress = 33 ; Keyboard 3 (Not Numpad)
Global $StopSpamKeyPress = 34; Keyboard 4 (Not Numpad)

; find the first true play style
Global $IsCondemnSader = true
Global $IsPonySader = true
Global $IsZdpsMonk = true
Global $AutoSpam = false

;------------------------------------------------------------------------------
; Main loop - for keycodes check bottom of script
;------------------------------------------------------------------------------
while 1
	if WinActive($win_title) then
		SetHotkeys()
		if NOT $Paused Then
			ChatToggleEnableHotKeys()
		endif
		
		If NOT $Paused AND (_IsPressed($SpamKeyPress) Or $AutoSpam == true) Then
			If $IsCondemnSader == true  Then				
				$AutoSpam = true
				DoCondemnSader()				
			ElseIf $IsPonySader == true Then
				DoPonySader()	
			ElseIf $IsZdpsMonk == true Then
				DoZdpsMonk()
			EndIf
		endif
		
		If NOT $Paused AND _IsPressed($StopSpamKeyPress) Then
			$AutoSpam = false
		endif
		
	else ;when window is not active, disable all hotkeys
		ClearHotkeys()
	endif
	sleep(Random($baseTickMillisecond,$baseTickMillisecond+75, 1))
wend

#include "ComboIncludes/EndingIncludes.au3"
