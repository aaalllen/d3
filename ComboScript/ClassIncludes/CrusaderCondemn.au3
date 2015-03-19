#include-once

;Condemnsader
;	LeftClick = zeal
;	RightClick = iron skin steed charge
Global $CondemnWithOutSteedCharge = true
Global $CondemnSaderAkChamp = "{1}"
Global $CondemnSaderCondemn = "{2}"
Global $CondemnSaderLaw = "{3}"
Global $CondemnSaderProvoke = "{4}"
Global $CondemnMoveKey = "{E}"
Global $CondemnStandSkillKey = 20 ; spacebar

func DoCondemnSader()
	DoCondemnCondemn()
	
	DoCondemnSaderAKChamp()
	DoCondemnAuxSkill()
	
	DoCondemnMove()
	DoCondemnZeal()
	DoCondemnCondemn()
	DoCondemnLaw()
	DoCondemnProvoke()
	
	DoCondemnMove()
	DoCondemnCondemn()
endfunc

func DoCondemnSaderAKChamp()
	ControlSend($win_title, "", "", $CondemnSaderAkChamp)
endfunc

func DoCondemnZeal()
	DoLeftClick()
endfunc

func DoCondemnCondemn()
	ControlSend($win_title, "", "", $CondemnSaderCondemn)
endfunc

func DoCondemnLaw()
	ControlSend($win_title, "", "", $CondemnSaderLaw)
endfunc

func DoCondemnProvoke()
	ControlSend($win_title, "", "", $CondemnSaderProvoke)
endfunc

func DoCondemnAuxSkill()
	If $CondemnWithOutSteedCharge == true Then
		DoRightClick()
	Endif
endfunc

func DoCondemnMove()
	If NOT _IsPressed($CondemnStandSkillKey) Then
		ControlSend($win_title, "", "", $CondemnMoveKey)
	endif
endfunc