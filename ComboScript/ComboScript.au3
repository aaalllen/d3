#include <Misc.au3>
#Include <Array.au3>

#RequireAdmin
_Singleton("D3AntiIdle")

;------------------------------------------------------------------------------
; Globals - These are defaults but will get overwritten by the settings file
;------------------------------------------------------------------------------
Global $SwitchGearButton = "{F1}"
Global $RequestInviteButton = "{F2}"
Global $AntiIdleButton = "{F3}"
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
		HotKeySet($SwitchGearButton, "SwitchGear")
		HotKeySet($AntiIdleButton, "AntiIdle")
		HotKeySet($RequestInviteButton, "RequestInvite")
	else ;when window is not active, disable all hotkeys
		HotKeySet($SwitchGearButton)
		HotKeySet($AntiIdleButton)
		HotKeySet($RequestInviteButton)
	endif
	Sleep(200)
wend

#include "ComboIncludes/AntiIdle.au3"
#include "ComboIncludes/RequestInvite.au3"
#include "ComboIncludes/EndingIncludes.au3"
