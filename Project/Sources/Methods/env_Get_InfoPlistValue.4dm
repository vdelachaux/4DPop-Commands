//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : env_Get_Info_plist_Value
// Created 25/09/07 by Vincent de Lachaux
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
C_TEXT:C284($0)
C_TEXT:C284($1)

C_LONGINT:C283($Lon_i)
C_TEXT:C284($Dom_dict; $Dom_key; $Dom_root; $Dom_value; $File_plist; $Txt_buffer)

If (False:C215)
	C_TEXT:C284(env_Get_InfoPlistValue; $0)
	C_TEXT:C284(env_Get_InfoPlistValue; $1)
End if 

$File_plist:=Get 4D folder:C485(Database folder:K5:14)
$File_plist:=$File_plist+"Info.plist"

If (Test path name:C476($File_plist)=Is a document:K24:1)
	
	$Dom_root:=DOM Parse XML source:C719($File_plist)
	
	If (OK=1)
		
		$Dom_dict:=DOM Find XML element:C864($Dom_root; "plist/dict/")
		
		If (OK=1)
			
			$Lon_i:=0
			
			Repeat 
				
				$Lon_i:=$Lon_i+1
				$Dom_key:=DOM Get XML element:C725($Dom_dict; "key"; $Lon_i; $Txt_buffer)
				
				If ($Txt_buffer=$1)
					
					$Dom_value:=DOM Get next sibling XML element:C724($Dom_key)
					DOM GET XML ELEMENT VALUE:C731($Dom_value; $0)
					
				End if 
			Until ($Txt_buffer=$1)\
				 | (OK=0)
			
		End if 
		
		DOM CLOSE XML:C722($Dom_root)
		
	End if 
	
Else 
	
	ALERT:C41("Error 43 - File not found\r\""+$File_plist+"\"")
	
End if 