#include-once

func TogglePause()
	;MsgBox(0, 'info','TogglePause')
	$Paused = NOT $Paused
	while $Paused
		sleep(100)
		;disable switch MF gear button and setup keys
		ChatToggleDisableHotKeys()
		
		ToolTip($title & ' is Paused. Hit ' & $PauseButton & ' to resume.',0,0)
	wend
	ChatToggleEnableHotKeys()
	
	ToolTip("")
endfunc

func ChatToggleEnableHotKeys()
	;MsgBox(0, 'info','ChatToggleEnableHotKeys')
	HotKeySet($SwitchGearButton, "SwitchGear")
	HotKeySet($AntiIdleButton, "AntiIdle")
	;HotKeySet($RequestInviteButton, "RequestInvite")
	HotKeySet($EnterButton, "EnterTogglePause")
	HotKeySet($ReplyButton, "ReplyTogglePause")
endfunc

func ChatToggleDisableHotKeys()
	;MsgBox(0, 'info','ChatToggleDisableHotKeys')
	HotKeySet($SwitchGearButton)
	;HotKeySet($SetupButton)
	;HotKeySet($RequestInviteButton)
	HotKeySet($EnterButton)
	HotKeySet($ReplyButton)
endfunc
 
 
func EnterTogglePause()
	;MsgBox(0, 'info','EnterTogglePause')
	;have to disable the hotkey to send it
	HotKeySet($EnterButton)
	Send($EnterButton)
	Send($CloseAllButton)
	HotKeySet($EnterButton, "EnterTogglePause")

	TypingPause()
endfunc

func TypingPause()
	;MsgBox(0, 'info','TypingPause')
	if WinActive($win_title) then
		$Paused = NOT $Paused

		;need a while loop for some reason instead of an if
		while $Paused
			sleep(100)
			HotKeySet($PauseButton)
			HotKeySet($ReplyButton)
			HotKeySet($ChatEscButton, "ClearChatWithEsc")
			
			ToolTip($title & ' is paused for chat. Hit ' & $EnterButton & ' to resume.',0,0)
		wend

		HotKeySet($PauseButton, "TogglePause")
		HotKeySet($ReplyButton, "ReplyTogglePause")
		HotKeySet($ChatEscButton)
		ToolTip("")
	endif
endfunc

func ClearChatWithEsc()
	;MsgBox(0, 'info','ClearChatWithEsc')
	HotKeySet($ChatEscButton)
	Send($ChatEscButton)
	HotKeySet($ChatEscButton, "ClearChatWithEsc")
	
	TypingPause()
endfunc

func ReplyTogglePause()
	;MsgBox(0, 'info','ReplyTogglePause')
	;have to disable the hotkey to send it
	HotKeySet($ReplyButton)
	Send($ReplyButton)
	HotKeySet($ReplyButton, "ReplyTogglePause")

	TypingPause()
endfunc