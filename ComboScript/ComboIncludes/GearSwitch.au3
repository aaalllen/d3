#include-once

;------------------------------------------------------------------------------
; Gear Switching
;	MagicFind references as we used to switch gear right before killing elites	
;------------------------------------------------------------------------------

func SwitchGear()
	if WinActive($win_title) then
	  $SelfSpam = false
	  If $switchingGear == True Then ;prevent spamming switch inventory key because of user panic
		 Return
	  EndIf
	  $switchingGear = True  
	  BlockInput(1)
	  $StartPos = MouseGetPos()
	  Send($CloseAllButton)
	  Sleep(150)
	  Send($InventoryButton)
	  Sleep(100)
	  For $i = 1 To $upperBound
		 MouseClick ("right", $ItemSwitchCoords[$i][0], $ItemSwitchCoords[$i][1], 1, 1 )
		 Sleep(10)
		 ;ToolTip("i = " & $i)
		 ;TogglePause()
	  Next

	  if $SwitchBothRings == True  Then
		 Send("{ALT DOWN}");
		 MouseClick ( "right", $SecRingCoords[1][0], $SecRingCoords[1][1], 1, 0 )
		 Send("{ALT UP}")
	  endif

	  Send($CloseAllButton)

	  MouseMove($StartPos[0], $StartPos[1], 0)
	  BlockInput(0)
	  $switchingGear = False
	endif
endfunc

;------------------------------------------------------------------------------
; Setup
;------------------------------------------------------------------------------

func GearSwitchSetup()
	$MB_YESNO = 4
	$MB_YES = 6

	if MsgBox($MB_YESNO, $title, "Do you want to run the gear switch setup?") == $MB_Yes then
		RunGearSwitchSetup()
	endif
endfunc


;------------------------------------------------------------------------------
; MF Setup 
;------------------------------------------------------------------------------
func RunGearSwitchSetup()

	$MB_YESNO = 4
	$MB_YES = 6

	$inGameInstructions = "F7 to suspend keypress detection" & @CRLF & _
	"F8 to exit the program"

	$bindingInstructions = "Instead of ALT use: !" & @CRLF & _
	"Instead of SHIFT use: +" & @CRLF & _
	"Instead of CTRL use: ^" & @CRLF & _
	"Examples:" & @CRLF & _
	"SHIFT+CTRL+K = +^K"& @CRLF & _
	"ALT+4 = !4"& @CRLF & _
	"K = K"& @CRLF & _
	"Please check your settings.ini to change other button defaults"

   
	MsgBox(0, $title, $inGameInstructions)
	
	WriteDefaultIni()

	$LButton = InputBox($title, "Enter which hotkey you want to use that'll toggle the gear swap." _
	& @CRLF & $bindingInstructions, "{F" & $SwitchGearButton, "}", 251, 250)
	If $LButton <> "" then
		IniWrite($SettingsFile, "Button", "SwitchGearButton", " " & $LButton)
		$MFButton = $LButton
	Else
		$MFButton = "{F1}"
		ErrorMsg()
		IniWrite($SettingsFile, "Button", "SwitchGearButton",$MFButton)
	endif

	$LInventory = InputBox($title, "In game keybinding used to open your inventory (i by default)." _
	& @CRLF & $bindingInstructions, "" & $InventoryButton, "", 251, 250)
	If $LInventory <> "" then
		IniWrite($SettingsFile, "GameKeybindings", "InventoryButton", " " & $LInventory)
		$InventoryButton = $LInventory
	Else
		$InventoryButton = "i"
		ErrorMsg()
		IniWrite($SettingsFile, "GameKeybindings", "InventoryButton", " i")
	endif

	$LCloseAllButton = InputBox($title, "Enter which hotkey closes all windows in game (SPACE by default)(If you didn't change it in game, you can just press OK here)." _
	& @CRLF & $bindingInstructions, "" & $CloseAllButton, "", 251, 250)
	If $LCloseAllButton <> "" then
		IniWrite($SettingsFile, "GameKeybindings", "CloseAllButton", " " & $LCloseAllButton)
		$CloseAllButton = $LCloseAllButton
	Else
		$CloseAllButton = "{Backspace}"
		ErrorMsg()
		IniWrite($SettingsFile, "GameKeybindings", "CloseAllButton", "{Backspace}")
	endif

	; how many items do you want to switch?
	$LNumOfItems = InputBox($title, "How many items slots will you change?")
	If $LNumOfItems <> "" then
		IniWrite($SettingsFile, "ItemSwitch", "NumOfItems", " " & $LNumOfItems)
		$NumOfItems = $LNumOfItems
	Else
		$NumOfItems = 2
		ErrorMsg()
		IniWrite($SettingsFile, "ItemSwitch", "NumOfItems", " 2")
	endif

	; do you want to switch both rings?

	if MsgBox($MB_YESNO, $title, "Do you want to switch both rings?") == $MB_YES then
		$SwitchBothRings = true
		IniWrite($SettingsFile, "ItemSwitch", "SwitchBothRings", $SwitchBothRings)
	Else
		$SwitchBothRings = false
		IniWrite($SettingsFile, "ItemSwitch", "SwitchBothRings", $SwitchBothRings)
	endif

	; input item locations
	; 	loop for items - 1 if we change 2nd ring too
	$upperBound = $NumOfItems
	if $SwitchBothRings ==  then
		$upperBound = $upperBound - 1
	endif

	Dim $LCoords[$upperBound][2]

	For $i = 0 To $upperBound - 1
		MsgBox(0, "", "Move the mouse into the position of the " & $i + 1 & " (st/nd/rd/th) item in your inventory." & @CRLF & _
		"Coordinate recognition will happen " & $sleepTimeForCoordDetection/1000 & " sec after pressing 'OK'")
		sleep($sleepTimeForCoordDetection)
		$pos = MouseGetPos()
		$LCoords[$i][0] = $pos[0]
		$LCoords[$i][1] = $pos[1]
	Next
	$ItemSwitchCoords = $LCoords
	IniWriteSection($SettingsFile, "ItemSwitchCoords", $ItemSwitchCoords, 0)

	; input 2nd ring location

	if $SwitchBothRings then
		MsgBox(0, "", "Move the mouse into the position of the 2nd ring in your inventory." & @CRLF & _
		"Coordinate recognition will happen 2 sec after pressing 'OK'")
		sleep($sleepTimeForCoordDetection)
		$pos = MouseGetPos()
		Global $SecondRingCoords[2][2]
		$SecondRingCoords[1][0] = $pos[0]
		$SecondRingCoords[1][1] = $pos[1]
		$sData = $SecondRingCoords[1][0]&"="&$SecondRingCoords[1][1]
		IniWriteSection($SettingsFile, "SecondRingCoords", $sData)
	endif

	ReadSettings()
	MsgBox(0, "", "Setup complete, you can now start swapping gear")

endfunc