//%attributes = {}
// **
// @method 00_test
// @uid B9AEC0C3AECC4EDB8AB7BF9B39DDE978
// @author Vincent de Lachaux
// @date 02/12/11
// @version 1.0
//
// @param
// @return
// */
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_parameters)

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	TRACE:C157
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------

//$Txt_version:=Application version

// ----------------------------------------------------
// End