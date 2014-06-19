;---------------------------------------
; Values read from the Settings.ini file
;---------------------------------------
func ReadSettings()

;; typical actions
	Global $SwitchGearButton = IniRead($SettingsFile, "Button", "SwitchGearButton", "{F1}")
	Global $RequestInviteButton = IniRead($SettingsFile, "Button", "RequestInviteButton", "{F2}")
	Global $AntiIdleButton = IniRead($SettingsFile, "Button", "AntiIdleButton", "{F3}")

;; personal game keyboard settings
	Global $CloseAllButton = IniRead($SettingsFile, "GameKeybindings", "CloseAllButton", "{Backspace}")	
	Global $InventoryButton = IniRead($SettingsFile, "GameKeybindings", "InventoryButton", "{i}")

;; item switcher	
	Global $NumOfItems = IniRead($SettingsFile, "ItemSwitch", "NumOfItems", "0")	
	Global $SwitchBothRings = IniRead($SettingsFile, "ItemSwitch", "SwitchBothRings", false)

	;; load coordinates
	Global $ItemSwitchCoords = IniReadSection($SettingsFile, "ItemSwitchCoords")
	
	;; 2nd ring?
	Global $upperBound = $NumOfItems	
	If $SwitchBothRings == True then
		$upperBound = $upperBound - 1
		Global $SecondRingCoords = IniReadSection($SettingsFile, "SecondRingCoords")
	endif
	
 endfunc
 
 
Func WriteDefaultIni()
	Global $SwitchGearButton = IniWrite($SettingsFile, "Button", "SwitchGearButton", "{F1}")
	Global $RequestInviteButton = IniWrite($SettingsFile, "Button", "RequestInviteButton", "{F2}")
	Global $AntiIdleButton = IniWrite($SettingsFile, "Button", "AntiIdleButton", "{F3}")
	
	Global $CloseAllButton = IniWrite($SettingsFile, "GameKeybindings", "CloseAllButton", "{Backspace}")
	Global $InventoryButton = IniWrite($SettingsFile, "GameKeybindings", "InventoryButton", "{i}")      
EndFunc