//%attributes = {}
// ----------------------------------------------------
// Project method : clean4dFolder
// ID[E84BF62E0502449BB1FF9F0D1529302B]
// Created 01/12/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_i; $Lon_parameters)
C_TEXT:C284($Txt_path)

ARRAY TEXT:C222($tTxt_files; 0)
ARRAY TEXT:C222($tTxt_folders; 0)

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	//NO PARAMETERS REQUIRED
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
$Txt_path:=Get 4D folder:C485

FOLDER LIST:C473($Txt_path; $tTxt_folders)

For ($Lon_i; 1; Size of array:C274($tTxt_folders); 1)
	
	DOCUMENT LIST:C474($Txt_path+$tTxt_folders{$Lon_i}; $tTxt_tempoFiles)
	FOLDER LIST:C473($Txt_path+$tTxt_folders{$Lon_i}; $tTxt_tempoFolders)
	
	If ((Size of array:C274($tTxt_tempoFiles)+Size of array:C274($tTxt_tempoFolders))=0)
		
		DELETE FOLDER:C693($Txt_path+$tTxt_folders{$Lon_i})
		
	End if 
	
End for 

// ----------------------------------------------------
// End