//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : fakeCloseWindow
// ID[6A4D69FF7DA442BB88BBDB6BCAEC483C]
// Created 22/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
// Empty method used to force the close box in a dialog
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_parameters)

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------

// Nothing to do. It's cool ;-)

// ----------------------------------------------------
// End