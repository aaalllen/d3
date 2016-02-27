#include <Misc.au3>
#Include <Array.au3>

#RequireAdmin
_Singleton("D3AntiIdle")

;------------------------------------------------------------------------------
; Set Class Spam Types (holding down 3)
;------------------------------------------------------------------------------
Global $SpamKeyPress = 53; s -- 33 ; Keyboard 3 (Not Numpad)
Global $StopSpamKeyPress = 46; f -- 34; Keyboard 4 (Not Numpad)
Global $AutoSpam = false

; find the first true play style
Global $IsSnowballBarb = false
Global $IsCondemnSader = false
Global $IsPonySader = false
Global $IsZdpsMonk = false
Global $IsZdpsWD = false
Global $IsDuoMonk = false
Global $IsWizDBSuperNova = false
Global $IsSupportHotaBarb = false
Global $IsSupportWWBarb = false
Global $IsLoNCrusader = true

;------------------------------------------------------------------------------
; Set the variables and keybindings
;------------------------------------------------------------------------------
#include "ClassIncludes/ClassIncludes.au3"
#include "ComboIncludes/StartingIncludes.au3"
#include "ComboIncludes/ReadSettings.au3"
ReadSettings()

;HotKeySet("{F9}", "CheckMouseCoord")

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
			If $IsSnowballBarb == true Then
				$AutoSpam = true
				StartSnowballBarb()
				DoSnowballBarb()
			ElseIf $IsCondemnSader == true  Then				
				$AutoSpam = true
				DoCondemnSader()		
			ElseIf $IsPonySader == true Then
				DoPonySader()	
			ElseIf $IsZdpsMonk == true Then
				$AutoSpam = true
				DoZdpsMonk()
			ElseIf $IsDuoMonk == true Then
				$AutoSpam = true
				DoDuoMonk()
			ElseIf $IsZdpsWD == true Then
				$AutoSpam = true
				DoWDZdps()
			ElseIf $IsWizDBSuperNova == true Then
				$AutoSpam = true
				;StartWizDBSuperNova()
				DoWizDBSuperNova()
			ElseIf $IsSupportHotaBarb == true Then
				$AutoSpam = true
				StartBarbGlobe()
				DoBarbGlobe()
			ElseIf $IsSupportWWBarb == true Then
				$AutoSpam = true
				StartBarbGlobeWW()
				DoBarbGlobeWW()
			ElseIf $IsLoNCrusader == true Then
				;$AutoSpam = true
				;StartCrusaderLoN()
				;DoCrusaderLoN()
			EndIf			
		endif
		
		If NOT $Paused AND _IsPressed($StopSpamKeyPress) Then
			$AutoSpam = false
			If $IsSnowballBarb == true Then
				EndSnowballBarb()
			ElseIf $IsWizDBSuperNova == true Then
				;EndWizDBSuperNova()
			ElseIf $IsSupportHotaBarb == true Then
				EndBarbGlobe()
			ElseIf $IsSupportWWBarb == true Then
				EndBarbGlobeWW()
			ElseIf $IsLoNCrusader == true Then
				;EndCrusaderLoN()
			EndIf	
		endif
		
	else ;when window is not active, disable all hotkeys
		ClearHotkeys()
	endif
	sleep(Random($baseTickMillisecond,$baseTickMillisecond+75, 1))
wend

#include "ComboIncludes/EndingIncludes.au3"
