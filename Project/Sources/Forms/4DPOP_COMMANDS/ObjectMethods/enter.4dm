C_LONGINT:C283($Lon_id; $Lon_x)

If (<>tTxt_Results>0)
	
	$Lon_x:=Find in array:C230(<>tTxt_commands; <>tTxt_Results{<>tTxt_Results})
	
	If ($Lon_x>0)
		
		$Lon_id:=<>tLon_Command_IDs{$Lon_x}
		OPEN URL:C673(Replace string:C233(<>Txt_Url; "{id}"; String:C10($Lon_id)))
		
	End if 
End if 