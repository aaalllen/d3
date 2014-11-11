#include <Misc.au3>
#Include <Array.au3>

#RequireAdmin
_Singleton("D3AntiIdle")

;------------------------------------------------------------------------------
; Set Class Spam Types (holding down 3)
;------------------------------------------------------------------------------
#include "ClassIncludes/Crusader.au3"
#include "ClassIncludes/Monk.au3"
Global $SpamKey = 33 ; Keyboard 3 (Not Numpad)

; find the first true play style
Global $IsPonySader = true
Global $IsZdpsMonk = true

;------------------------------------------------------------------------------
; Globals - These are defaults but will get overwritten by the settings file
;------------------------------------------------------------------------------
Global $baseTickMillisecond = 150
Global $SwitchGearButton = "{F1}"
Global $RequestInviteButton = "{F2}" ; no longer need this, so disabled
Global $AntiIdleButton = "{F3}"
Global $Spam1234Button = "{3}"
Global $SettingsFile = IniRead("LocalSetup.ini", "FileConfig", "SettingsFile", "DefaultSettings.ini")

;Don't mess with values below
Global $title = "Diablo III - Wizard Combo Script"						
Global $win_title = "Diablo III"; English
Global $Paused = false
Global $switchingGear = false
Global $AntiIdle = false
Global $SelfSpam = false
Global $sleepTimeForCoordDetection = 2000 ;set the amount of time you want to wait during MF setup between each item coordinate

#include "ComboIncludes/ReadSettings.au3"
ReadSettings()

; assign hot keys after reading the settings

;---------------------------------------
; Main loop - for keycodes check bottom of script
;---------------------------------------
while 1
	if WinActive($win_title) then
		SetHotkeys()
		
		If NOT $Paused AND _IsPressed($SpamKey) Then
			If $IsPonySader == true Then
				DoPonySader()	
			ElseIf $IsZdpsMonk == true Then
				DoZdpsMonk()
			EndIf
		endif
		
	else ;when window is not active, disable all hotkeys
		ClearHotkeys()
	endif
	sleep(Random($baseTickMillisecond,$baseTickMillisecond+75, 1))
wend

func SetHotkeys()
	HotKeySet($SwitchGearButton, "SwitchGear")
	HotKeySet($AntiIdleButton, "AntiIdle")
	;HotKeySet($RequestInviteButton, "RequestInvite")
endfunc

func ClearHotkeys()
	HotKeySet($SwitchGearButton)
	HotKeySet($AntiIdleButton)
	;HotKeySet($RequestInviteButton)
endfunc


#include "ComboIncludes/AntiIdle.au3"
#include "ComboIncludes/RequestInvite.au3"
#include "ComboIncludes/Clicking.au3"
#include "ComboIncludes/EndingIncludes.au3"
