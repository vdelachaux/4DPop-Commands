//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Project method : 4DPop_COMMAND_LIST
// Database: 4DPop Commands
// ID[3E135E732A384BBE9345BD15117FDE35]
// Créé le 12/11/12 par Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_POINTER:C301($1)

C_LONGINT:C283($Lon_id; $Lon_parameters)
C_POINTER:C301($Ptr_arrayNames)

ARRAY TEXT:C222($tTxt_buffer; 0)

If (False:C215)
	C_POINTER:C301(4DPop_COMMAND_LIST; $1)
End if 

//%W-518.1
//%W-518.7

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

INIT

If (Asserted:C1132($Lon_parameters>=1; "Missing parameter"))
	
	If (Asserted:C1132(Not:C34(Is nil pointer:C315($1)); "Nil pointer!"))
		
		If (Asserted:C1132(Not:C34(Undefined:C82($1->)); "Pointer to an undefined variable!"))
			
			$Ptr_arrayNames:=$1
			
		Else 
			
			ABORT:C156
			
		End if 
		
	Else 
		
		ABORT:C156
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Not:C34(Is nil pointer:C315($Ptr_arrayNames)))
	
	Repeat 
		
		$Lon_id:=$Lon_id+1
		$tTxt_buffer{0}:=Command name:C538($Lon_id)
		
		If (OK=1)
			
			If (Length:C16($tTxt_buffer{0})>0)
				
				APPEND TO ARRAY:C911($tTxt_buffer; $tTxt_buffer{0})
				
			End if 
		End if 
	Until (OK=0)
	
	COPY ARRAY:C226($tTxt_buffer; $Ptr_arrayNames->)
	
End if 

// ----------------------------------------------------
// End