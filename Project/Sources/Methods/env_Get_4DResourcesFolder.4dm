//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : env_Get_4DResourcesFolder
// ID[20431DF71F9E47C8A84E3C98FBE18E6C]
// Created 21/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_TEXT:C284($0)

C_LONGINT:C283($Lon_i; $Lon_parameters)
C_TEXT:C284($Txt_appResFolderPath)

If (False:C215)
	C_TEXT:C284(env_Get_4DResourcesFolder; $0)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------

$Txt_appResFolderPath:=Application file:C491

If ($Txt_appResFolderPath="@.app")
	
	$Txt_appResFolderPath:=$Txt_appResFolderPath+":Contents"+Folder separator:K24:12
	
Else 
	
	For ($Lon_i; Length:C16($Txt_appResFolderPath); 1; -1)
		
		If ($Txt_appResFolderPath[[$Lon_i]]=Folder separator:K24:12)
			
			$Txt_appResFolderPath:=Substring:C12($Txt_appResFolderPath; 1; $Lon_i)
			
			$Lon_i:=0
			
		End if 
	End for 
End if 

$Txt_appResFolderPath:=$Txt_appResFolderPath+"resources"+Folder separator:K24:12

$0:=$Txt_appResFolderPath

// ----------------------------------------------------
// End