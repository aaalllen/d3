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
		HotKeySet($SwitchGearButton, "SwitchGear")
		;HotKeySet($AntiIdleButton, "AntiIdle")
		;HotKeySet($RequestInviteButton, "RequestInvite")
		;HotKeySet($Spam1234Button, "Spam1234")
		
		;If _IsPressed(01) Then
		If _IsPressed(33) Then
			Spam1234()
		endif
		
	else ;when window is not active, disable all hotkeys
		HotKeySet($SwitchGearButton)
		;HotKeySet($AntiIdleButton)
		;HotKeySet($RequestInviteButton)
		;HotKeySet($Spam1234Button)
	endif
	;Sleep(1000)
	sleep(Random(250,325, 1))
wend

func Spam1234()	
	if WinActive($win_title) AND NOT $Paused Then
		ControlSend($win_title, "", "", "{1}")
		;sleep(Random(25,45, 1))
		ControlSend($win_title, "", "", "{2}")
		;sleep(Random(25,45, 1))
		ControlSend($win_title, "", "", "{3}")
		;sleep(Random(25,45, 1))
		ControlSend($win_title, "", "", "{4}")
	endif

endfunc

#include "ComboIncludes/AntiIdle.au3"
#include "ComboIncludes/RequestInvite.au3"
#include "ComboIncludes/EndingIncludes.au3"
