
;ponysader
;	LeftClick = phalanx
;	RightClick = steed charge
Global $SaderAkChamp = "{1}"
Global $SaderIronSkin = "{2}"
Global $SaderLaw = "{3}"
Global $SaderProvoke = "{4}"

;condemn sader
;	LeftClick = regen
;	RightClick = condemn
Global $CondemnMove = "{E}"
Global $CondemnSpaceBarMove = 20;
func DoCondemn()
	DoRightClick()
endfunc

func DoPonySader()	
	DoLeftClick()
	ControlSend($win_title, "", "", $SaderAkChamp)
	ControlSend($win_title, "", "", $SaderIronSkin)		
	DoLeftClick()
	ControlSend($win_title, "", "", $SaderLaw)
	ControlSend($win_title, "", "", $SaderProvoke)
endfunc

func DoCondemnSader()
	; condem as right click
	DoLeftClick()
	DoCondemn()
	ControlSend($win_title, "", "", $SaderAkChamp)
	ControlSend($win_title, "", "", $SaderIronSkin)
	DoCondemnMove()
	DoLeftClick()
	DoCondemn()
	ControlSend($win_title, "", "", $SaderLaw)
	DoCondemn()
	ControlSend($win_title, "", "", $SaderProvoke)
	DoCondemnMove()
	DoCondemn()
endfunc

func DoCondemnMove()
	If NOT _IsPressed($CondemnSpaceBarMove) Then
		ControlSend($win_title, "", "", $CondemnMove)
	endif
endfunc