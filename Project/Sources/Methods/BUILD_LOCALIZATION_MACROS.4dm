//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : BUILD_LOCALIZATION_MACROS
// Database: 4DPop Commands
// ID[C03155D2EE7249A2BD4C7CACC0822981]
// Créé le 12/11/12 par Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
#DECLARE($language : Text)


If (False:C215)
	C_TEXT:C284(BUILD_LOCALIZATION_MACROS; $1)
End if 

var $command; $macros; $name; $node; $root; $source; $t; $target; $value : Text
var $success : Boolean
var $id : Integer
var $file : 4D:C1709.File

// ----------------------------------------------------
// Initialisations
If (Asserted:C1132(Count parameters:C259>=1; "Missing parameter"))
	
	$file:=Folder:C1567(Get 4D folder:C485(-1); fk platform path:K87:2).file("fr.lproj/4D_CommandsFR.xlf")
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Asserted:C1132($file.exists))
	
	$root:=DOM Parse XML source:C719($file.platformPath)
	
	If (Asserted:C1132(OK=1))
		
		// Remove id of the group (duplicated value with a command)
		$node:=DOM Find XML element:C864($root; "/xliff/file/body/group")
		DOM REMOVE XML ATTRIBUTE:C1084($node; "id")
		
		$macros:=DOM Create XML Ref:C861("macros")
		$node:=DOM Append XML child node:C1080($macros; XML DOCTYPE:K45:19; "macros SYSTEM \"http://www.4d.com/dtd/2007/macros.DTD\"")
		
		Repeat 
			
			$id:=$id+1
			$command:=Command name:C538($id)
			$success:=(OK=1)
			
			If ($success)
				
				If (Length:C16($command)>0)
					
					$node:=DOM Find XML element by ID:C1010($root; String:C10($id))
					
					If (OK=1)
						
						$node:=DOM Get first child XML element:C723($node; $t; $source)
						
						If (OK=1)
							
							$node:=DOM Get next sibling XML element:C724($node; $t; $target)
							
							If (OK=1)
								
								If ($language="fr")
									
									$name:=$target
									$value:=$source
									
								Else 
									
									$name:=$source
									$value:=$target
									
								End if 
								
								If ($name="_o_@")
									
									$name:=Delete string:C232($name; 1; 3)
									
								End if 
								
								$node:=DOM Create XML element:C865($macros; "macro"; \
									"name"; $name; \
									"in_menu"; False:C215; \
									"in_toolbar"; False:C215)
								$node:=DOM Create XML element:C865($node; "text")
								DOM SET XML ELEMENT VALUE:C868($node; $value)
								
							End if 
						End if 
					End if 
				End if 
			End if 
		Until (Not:C34($success))
		
		DOM CLOSE XML:C722($root)
		
		DOM EXPORT TO FILE:C862($macros; Get 4D folder:C485(Current resources folder:K5:16)+$language+" to "+Choose:C955($language="en"; "fr"; "en")+".xml")
		
		DOM CLOSE XML:C722($macros)
		
	End if 
End if 

// ----------------------------------------------------
// End