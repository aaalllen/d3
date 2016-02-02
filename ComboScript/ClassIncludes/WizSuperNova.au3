#include-once


; LeftClick = Cyclone stroke
; RightClick = Inner Sanctuary
Global $WizDBSuperNovaShellButton = "{1}"
Global $WizDBSuperNovaTeleportButton = "{2}"
Global $WizDBSuperNovaFrostNovaButton = "{3}"
Global $WizDBSuperNovaEBButton = "{4}"

func DoWizDBSuperNova()
	WizDBSuperNovaEB()
	WizDBSuperNovaShell()
	WizDBSuperNovaEB()
	WizDBSuperNovaFrostNova()
endfunc

func StartWizDBSuperNova()
	Send("{E down}")
endfunc

func EndWizDBSuperNova()
	Send("{E up}")
endfunc

func WizDBSuperNovaShell()
	ControlSend($win_title, "", "", $WizDBSuperNovaShellButton)
endfunc

func WizDBSuperNovaFrostNova()
	ControlSend($win_title, "", "", $WizDBSuperNovaFrostNovaButton)
endfunc

func WizDBSuperNovaEB()
	ControlSend($win_title, "", "", $WizDBSuperNovaEBButton)
endfunc