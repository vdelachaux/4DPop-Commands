//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project method : popCommands
// ID[B46EB21E06B944A9B38C2A56DEBE3541]
// Created 24/05/07 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// 
// ----------------------------------------------------
// Declarations
#DECLARE($ptr : Pointer)

var $Win_hdl : Integer

// ----------------------------------------------------
// Initialisations
// NO PARAMETERS REQUIRED

Compiler_Variables

INIT(Macintosh option down:C545 | Windows Alt down:C563)

// ----------------------------------------------------
$Win_hdl:=Open form window:C675("4DPOP_COMMANDS"; \
Choose:C955(<>Lon_options ?? 3; Pop up form window:K39:11; -Palette form window:K39:9); \
Horizontally centered:K39:1; \
Vertically centered:K39:4; *)
DIALOG:C40("4DPOP_COMMANDS")
CLOSE WINDOW:C154

CLEAR VARIABLE:C89(<>tTxt_Results)

// ----------------------------------------------------
// End