;------------------------------------------------------------------------------
; Globals - These are defaults but will get overwritten by the settings file
;------------------------------------------------------------------------------
Global $baseTickMillisecond = 150
Global $SwitchGearButton = "{F1}"
Global $RequestInviteButton = "{F2}" ; no longer need this, so disabled
Global $AntiIdleButton = "{F3}"
Global $PauseButton = "{F5}"
Global $SettingsFile = IniRead("LocalSetup.ini", "FileConfig", "SettingsFile", "DefaultSettings.ini")

;Don't mess with values below
Global $title = "Diablo III - Wizard Combo Script"						
Global $win_title = "Diablo III"; English
Global $Paused = false
Global $switchingGear = false
Global $AntiIdle = false
Global $SelfSpam = false
Global $sleepTimeForCoordDetection = 2000 ;set the amount of time you want to wait during MF setup between each item coordinate

; Pause for chatting
Global $EnterButton = "{Enter}"
Global $ReplyButton = "{r}"
Global $ChatEscButton = "{ESC}"
Global $MapButton = "{TAB}"

; do not include these in the SetHotkeys() method
;HotKeySet($EnterButton, "EnterTogglePause")
;HotKeySet($ReplyButton, "ReplyTogglePause")
ChatToggleEnableHotKeys()

;------------------------------------------------------------------------------
; Hotkeys
;------------------------------------------------------------------------------
func SetHotkeys()
	HotKeySet($SwitchGearButton, "SwitchGear")
	HotKeySet($AntiIdleButton, "AntiIdle")
	;HotKeySet($RequestInviteButton, "RequestInvite")
endfunc

func ClearHotkeys()
	HotKeySet($SwitchGearButton)
	HotKeySet($AntiIdleButton)
	;HotKeySet($RequestInviteButton)
	ChatToggleDisableHotKeys()
endfunc