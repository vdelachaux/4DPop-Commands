//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project method : macro_syntax
// ID[1C84C3668886452E9DAB081E847F19ED]
// Created 24/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_BOOLEAN:C305($Boo_modifier)
C_LONGINT:C283($Lon_parameters; $Lon_x)
C_TEXT:C284($Txt_selected)

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	//NO PARAMETERS REQUIRED
	
	INIT
	
	GET MACRO PARAMETER:C997(Highlighted method text:K5:18; $Txt_selected)
	
	$Boo_modifier:=Macintosh option down:C545 | Windows Alt down:C563
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Length:C16($Txt_selected)>0)
	
	ARRAY TEXT:C222($tTxt_Results; 0x0000)
	
	Repeat 
		
		$Lon_x:=Find in array:C230(<>tTxt_commands; "@"+$Txt_selected+"@"; $Lon_x+1)
		
		If ($Lon_x>0)
			
			If (Character code:C91(<>tTxt_commands{$Lon_x})#At sign:K15:46)
				
				APPEND TO ARRAY:C911($tTxt_Results; <>tTxt_commands{$Lon_x})
				
			End if 
		End if 
	Until ($Lon_x=-1)
	
	Case of 
			
			//…………………………………………………
		: (Size of array:C274($tTxt_Results)=0)
			
			//provoque l'émission d'un bip sonore.
			//provoque l'émission d'un bip sonore.
			BEEP:C151
			
			// Nothing found
			
			//…………………………………………………
		: (Size of array:C274($tTxt_Results)=1)  //only one
			
			If ($Boo_modifier)
				
				OPEN URL:C673(Replace string:C233(<>Txt_Url; "{id}"; String:C10(<>tLon_Command_IDs{Find in array:C230(<>tTxt_commands; $tTxt_Results{1})})))
				
			Else 
				
				SET MACRO PARAMETER:C998(Highlighted method text:K5:18; getSyntax(<>tLon_Command_IDs{Find in array:C230(<>tTxt_commands; $tTxt_Results{1})}))
				
			End if 
			
			//…………………………………………………
		Else 
			
			<>tTxt_commands{0}:=$Txt_selected
			
			commands
			
			//…………………………………………………
	End case 
	
Else 
	
	CLEAR VARIABLE:C89(<>tTxt_commands{0})
	
	commands
	
End if 

// ----------------------------------------------------
// End