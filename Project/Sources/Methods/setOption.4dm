//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : setOption
// ID[6904A9E3A6954B11A005B3261E7E275B]
// Created 22/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($1)

C_LONGINT:C283($Lon_option; $Lon_parameters)

If (False:C215)
	C_LONGINT:C283(setOption; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1; "Missing parameter"))
	
	$Lon_option:=$1
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Self:C308-> ?? 0)
	
	<>Lon_options:=<>Lon_options ?+ $Lon_option
	
Else 
	
	<>Lon_options:=<>Lon_options ?- $Lon_option
	
End if 

pref.set("syntaxoptions"; <>Lon_options)

// ----------------------------------------------------
// End