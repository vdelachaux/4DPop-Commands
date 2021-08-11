//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : GET_COMMAND_LIST
// Created 26/06/08 by vdl
// ----------------------------------------------------
// Description
//
// ----------------------------------------------------
C_BOOLEAN:C305($Boo_localized)
C_LONGINT:C283($Lon_id)
C_TEXT:C284($Dom_command; $Dom_item; $Txt_buffer; $Txt_command; $Txt_path)

If (Not:C34(<>Lon_options ?? 2))
	
	$Txt_path:=Get 4D folder:C485(Current resources folder:K5:16)+"4D_Commands.xlf"
	
	If (Test path name:C476($Txt_path)=Is a document:K24:1)
		
		$Dom_command:=DOM Parse XML source:C719($Txt_path)
		$Boo_localized:=(OK=1)
		
	End if 
End if 

ARRAY TEXT:C222(<>tTxt_commands; 0)
ARRAY LONGINT:C221(<>tLon_Command_IDs; 0)

Repeat 
	
	$Lon_id:=$Lon_id+1
	$Txt_command:=Command name:C538($Lon_id)
	
	If (OK=1)
		
		If (Length:C16($Txt_command)>0)
			
			APPEND TO ARRAY:C911(<>tTxt_commands; $Txt_command)
			APPEND TO ARRAY:C911(<>tLon_Command_IDs; $Lon_id)
			
			If ($Boo_localized)
				
				$Dom_item:=DOM Find XML element by ID:C1010($Dom_command; String:C10($Lon_id))
				
				If (OK=1)
					
					If (<>tTxt_Languages#1)  //FR
						
						//'en' read the target
						$Dom_item:=DOM Get next sibling XML element:C724(\
							DOM Get first child XML element:C723($Dom_item); $Txt_buffer; $Txt_command)
						
					Else 
						
						//'fr' read the source
						$Dom_item:=DOM Get first child XML element:C723($Dom_item; $Txt_buffer; $Txt_command)
						
					End if 
					
					If (OK=1)
						
						APPEND TO ARRAY:C911(<>tTxt_commands; $Txt_command)
						APPEND TO ARRAY:C911(<>tLon_Command_IDs; $Lon_id)
						
					End if 
				End if 
				
				OK:=1
				
			End if 
		End if 
	End if 
Until (OK=0)

If ($Boo_localized)
	
	DOM CLOSE XML:C722($Dom_command)
	
End if 