//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : getSyntax
// ID[005D7345C2B34005B2B7DB64B0936B19]
// Created 24/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_TEXT:C284($0)
C_LONGINT:C283($1)

C_BLOB:C604($Blb_result)
C_LONGINT:C283($Lon_id; $Lon_parameters; $Lon_x)
C_TEXT:C284($Dom_result; $Txt_comment; $Txt_syntax)

If (False:C215)
	C_TEXT:C284(getSyntax; $0)
	C_LONGINT:C283(getSyntax; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1; "Missing parameter"))
	
	$Lon_id:=$1
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Macintosh option down:C545 | Windows Alt down:C563)
	
	$Txt_syntax:=Command name:C538(538)+"("+String:C10($Lon_id)+")"
	
Else 
	
	If (Size of array:C274(<>tTxt_Results)>0)\
		 & (<>tTxt_Results<Size of array:C274(<>tTxt_Results))
		
		$Txt_syntax:=<>tTxt_Results{<>tTxt_Results}
		
	End if 
	
	$Txt_syntax:=Command name:C538($Lon_id)
	
End if 

$0:=$Txt_syntax

/* XSLT no more available

	If (<>Lon_options ?? 6)
$Txt_syntax:=$Txt_syntax+"\r"
If (BLOB size(<>Blb_help)>0)
_O_XSLT SET PARAMETER("xpath_in"; "'//*[@resname=\"cmd"+String($Lon_id)+"\"]/target'")
_O_XSLT APPLY TRANSFORMATION(<>Blb_help; <>Blb_evaluate; $Blb_result; True)
If (OK=1)
$Dom_result:=DOM Parse XML variable($Blb_result)
If (OK=1)
DOM GET XML ELEMENT VALUE(DOM Find XML element($Dom_result; "value"); $Txt_syntax)
DOM CLOSE XML($Dom_result)
End if 
End if 
If (Length($Txt_syntax)>0)
$Lon_x:=Position("->"; $Txt_syntax)
If ($Lon_x>0)  //function
$Txt_syntax:="$"+Substring($Txt_syntax; $Lon_x+3)+":="+Substring($Txt_syntax; 1; $Lon_x-1)
End if 
$Txt_syntax:=$Txt_syntax+"\r"
If (<>Lon_options ?? 1)  //get the abstract
_O_XSLT SET PARAMETER("xpath_in"; "'//*[@resname=\"desc"+String($Lon_id)+"\"]/target'")
_O_XSLT APPLY TRANSFORMATION(<>Blb_help; <>Blb_evaluate; $Blb_result; True)
If (OK=1)
$Dom_result:=DOM Parse XML variable($Blb_result)
If (OK=1)
DOM GET XML ELEMENT VALUE(DOM Find XML element($Dom_result; "value"); $Txt_comment)
DOM CLOSE XML($Dom_result)
End if 
End if 
If (Length($Txt_comment)>0)
$Txt_syntax:=Choose(<>Lon_options ?? 4; $Txt_syntax+"//"+Replace string($Txt_comment; "\r"; "//")+"\r";"//"+Replace string($Txt_comment; "\r"; "//")+"\r"+$Txt_syntax)
End if 
End if 
End if 
End if 
Else 
End if 

*/