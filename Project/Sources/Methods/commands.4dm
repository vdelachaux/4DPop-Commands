//%attributes = {"invisible":true}
var $winRef : Integer

Compiler_Variables

INIT(Macintosh option down:C545 | Windows Alt down:C563)

// ----------------------------------------------------
$winRef:=Open form window:C675("COMMANDS"; \
Choose:C955(<>Lon_options ?? 3; Pop up form window:K39:11; -Palette form window:K39:9); \
Horizontally centered:K39:1; \
Vertically centered:K39:4; *)

DIALOG:C40("COMMANDS")
CLOSE WINDOW:C154

CLEAR VARIABLE:C89(<>tTxt_Results)