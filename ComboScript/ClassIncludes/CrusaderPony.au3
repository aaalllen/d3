#include-once

;ponysader
;	LeftClick = phalanx
;	RightClick = steed charge
Global $PonySaderAkChamp = "{1}"
Global $PonySaderIronSkin = "{2}"
Global $PonySaderLaw = "{3}"
Global $PonySaderProvoke = "{4}"

func DoPonySader()	
	DoPonyAttack()
	DoPonySaderAKChamp()
	DoPonyIronSkin()
	DoPonyAttack()
	DoPonyLaw()
	DoPonyProvoke()
endfunc

func DoPonySaderAKChamp()
	ControlSend($win_title, "", "", $PonySaderAkChamp)
endfunc

func DoPonyAttack()
	DoLeftClick()
endfunc

func DoPonyIronSkin()
	ControlSend($win_title, "", "", $PonySaderIronSkin)
endfunc

func DoPonyLaw()
	ControlSend($win_title, "", "", $PonySaderLaw)
endfunc

func DoPonyProvoke()
	ControlSend($win_title, "", "", $PonySaderProvoke)
endfunc