//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : form_open_page
// Database: 4DPop Commands
// ID[18E5BF62795F44E0BED7AF199B412494]
// Created #9-10-2013 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($1)

C_LONGINT:C283($Lon_page; $Lon_parameters)

If (False:C215)
	C_LONGINT:C283(form_open_page; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1; "Missing parameter"))
	
	$Lon_page:=$1
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
OBJECT SET VISIBLE:C603(*; "more.@"; False:C215)
OBJECT SET VISIBLE:C603(*; "move.@"; True:C214)
OBJECT SET VISIBLE:C603(*; "splitter"; True:C214)

(OBJECT Get pointer:C1124(Object named:K67:5; "move.subform"))->:=$Lon_page

If (splitter=0)
	
	SET TIMER:C645(-1)
	
Else 
	
	splitter:=splitter-327
	
	SET TIMER:C645(-1)
	
End if 

// ----------------------------------------------------
// End