
; LeftClick = phalanx
; RightClick = steed charge
Global $SaderAkChamp = "{1}"
Global $SaderIronSkin = "{2}"
Global $SaderLaw = "{3}"
Global $SaderProvoke = "{4}"

func DoPonySader()	
	MouseClick("left")	
	ControlSend($win_title, "", "", $SaderAkChamp)
	ControlSend($win_title, "", "", $SaderIronSkin)		
	MouseClick("left")		
	ControlSend($win_title, "", "", $SaderLaw)
	ControlSend($win_title, "", "", $SaderProvoke)
endfunc