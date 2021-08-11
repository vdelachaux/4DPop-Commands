//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project method : Commands
// ID[B46EB21E06B944A9B38C2A56DEBE3541]
// Created 24/05/07 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_POINTER:C301($1)

C_LONGINT:C283($Lon_parameters; $Win_hdl)

If (False:C215)
	C_POINTER:C301(Commands; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	//NO PARAMETERS REQUIRED
	
	Compiler_Variables
	
	init(Macintosh option down:C545 | Windows Alt down:C563)
	
Else 
	
	ABORT:C156
	
End if 

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