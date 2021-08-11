C_LONGINT:C283($Lon_formEvent; $Lon_id; $Lon_x)

$Lon_formEvent:=Form event code:C388

$Lon_x:=Find in array:C230(<>tTxt_commands; <>tTxt_Results{<>tTxt_Results})

If ($Lon_x>0)
	
	$Lon_id:=<>tLon_Command_IDs{$Lon_x}
	
End if 

Case of 
		
		//______________________________________________________
	: ($Lon_x=-1)
		
		//______________________________________________________
	: ($Lon_formEvent=On Clicked:K2:4)
		
		//______________________________________________________
	: ($Lon_formEvent=On Double Clicked:K2:5)
		
		OPEN URL:C673(Replace string:C233(<>Txt_Url; "{id}"; String:C10($Lon_id)))
		
		//______________________________________________________
	: ($Lon_formEvent=On Begin Drag Over:K2:44)
		
		SET TEXT TO PASTEBOARD:C523(getSyntax($Lon_id))
		
		//______________________________________________________
End case 