C_LONGINT:C283($Lon_id; $Lon_state; $Lon_time; $Lon_x)
C_TEXT:C284($Txt_name)

PROCESS PROPERTIES:C336(\
Current process:C322; \
$Txt_name; \
$Lon_state; \
$Lon_time)

If ($Txt_name="macro_call")
	
	$Lon_x:=Find in array:C230(<>tTxt_commands; <>tTxt_Results{<>tTxt_Results})
	
	If ($Lon_x>0)
		
		$Lon_id:=<>tLon_Command_IDs{$Lon_x}
		
		SET MACRO PARAMETER:C998(Highlighted method text:K5:18; \
			getSyntax($Lon_id))
		
		ACCEPT:C269
		
	End if 
End if 