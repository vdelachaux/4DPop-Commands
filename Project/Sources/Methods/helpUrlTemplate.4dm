//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : helpUrlTemplate
// ID[4FA6A8FE8AA44CBCBC3352E237803F6B]
// Created 21/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_TEXT:C284($0)

C_LONGINT:C283($Lon_major; $Lon_minor; $Lon_parameters)
C_TEXT:C284($Txt_buffer; $Txt_url)

If (False:C215)
	C_TEXT:C284(helpUrlTemplate; $0)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	//No parameter required
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------

$Txt_buffer:=Application version:C493
$Lon_major:=Num:C11($Txt_buffer[[1]]+$Txt_Buffer[[2]])

$Txt_url:="http://doc.4d.com/4dv"+String:C10($Lon_major)

$Lon_minor:=Num:C11($Txt_buffer[[3]])

If ($Lon_minor#0)
	
	$Txt_url:=$Txt_url+"."+String:C10($Lon_minor)
	
End if 

$Txt_url:=$Txt_url+"/help/command/{lang}/page{id}.html"

$0:=$Txt_url

// ----------------------------------------------------
// End