//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : PREFERENCES
// Created 21/05/07 by Vincent de Lachaux
// ----------------------------------------------------
C_TEXT:C284($1)
C_POINTER:C301(${2})

C_BOOLEAN:C305($Boo_set)
C_LONGINT:C283($Lon_buffer; $Lon_parameters)
C_TEXT:C284($Dom_node; $Dom_preferences; $kTxt_tool; $Txt_entryPoint; $Txt_path; $Txt_xml; $Txt_Xpath)

If (False:C215)
	C_TEXT:C284(PREFERENCES; $1)
	C_POINTER:C301(PREFERENCES; ${2})
End if 

$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=1))
	
	$kTxt_tool:="Commands"
	$Txt_entryPoint:=$1
	
	$Boo_set:=($Txt_entryPoint="@.set")
	$Txt_entryPoint:=Replace string:C233($Txt_entryPoint; Choose:C955($Boo_set; ".set"; ".get"); "")
	$Txt_Xpath:="preference/"+$kTxt_Tool+"/"+$Txt_entryPoint
	
Else 
	
	ABORT:C156
	
End if 

ARRAY TEXT:C222($tTxt_Components; 0x0000)
COMPONENT LIST:C1001($tTxt_Components)

If (Asserted:C1132(Find in array:C230($tTxt_Components; "4DPop")>0; "The component 4DPop isn't installed or loaded"))
	
	EXECUTE METHOD:C1007("4DPop_preferenceLoad"; $Txt_xml; $kTxt_tool)
	
	$Dom_preferences:=DOM Parse XML variable:C720($Txt_xml)
	
Else 
	
	ABORT:C156
	
End if 

If (OK=1)
	
	$Dom_node:=DOM Find XML element:C864($Dom_preferences; $Txt_Xpath)
	
	Case of 
			
			//______________________________________________________
		: ($Txt_entryPoint="syntaxlanguage")\
			 & (Asserted:C1132($Lon_parameters>=2; "Missing parameter"))
			
			
			If ($Boo_set)
				
				If (OK=0)
					
					$Dom_node:=DOM Create XML element:C865($Dom_preferences; $Txt_Xpath; "value"; $2->)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node; "value"; $2->)
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "value"; $Lon_buffer)
					
				End if 
				
				If (OK=1)
					
					$2->:=$Lon_buffer
					
				Else 
					
					$2->:=-1
					
				End if 
			End if 
			
			//______________________________________________________
		: ($Txt_entryPoint="syntaxoptions")\
			 & (Asserted:C1132($Lon_parameters>=2; "Missing parameter"))
			
			
			If ($Boo_set)
				
				If (OK=0)
					
					$Dom_node:=DOM Create XML element:C865($Dom_preferences; $Txt_Xpath; "value"; $2->)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node; "value"; $2->)
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "value"; $2->)
					
				End if 
				
				If (OK=0)
					
					$2->:=MAXLONG:K35:2  //all are On
					
				End if 
			End if 
			
			//______________________________________________________
		: ($Txt_entryPoint="syntaxwebsite")\
			 & (Asserted:C1132($Lon_parameters>=2; "Missing parameter"))
			
			
			If ($Boo_set)
				
				If (OK=0)
					
					$Dom_node:=DOM Create XML element:C865($Dom_preferences; $Txt_Xpath; "url"; $2->)
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node; "url"; $2->)
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "url"; $2->)
					
				End if 
				
				If (OK=0)
					
					$2->:="http://www.4d.fr/documentation/4DdocV11/"
					
				End if 
			End if 
			
			//______________________________________________________
		: ($Txt_entryPoint="syntaxwindow")\
			 & (Asserted:C1132($Lon_parameters>=5; "Missing parameter"))
			
			
			If ($Boo_set)
				
				If (OK=0)
					
					$Dom_node:=DOM Create XML element:C865($Dom_preferences; $Txt_Xpath; "left"; String:C10($2->); "top"; String:C10($3->); "right"; String:C10($4->); "bottom"; String:C10($5->))
					
				Else 
					
					DOM SET XML ATTRIBUTE:C866($Dom_node; "left"; String:C10($2->); "top"; String:C10($3->); "right"; String:C10($4->); "bottom"; String:C10($5->))
					
				End if 
				
			Else 
				
				If (OK=1)
					
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "left"; $2->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "top"; $3->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "right"; $4->)
					DOM GET XML ATTRIBUTE BY NAME:C728($Dom_node; "bottom"; $5->)
					
				End if 
				
				If (OK=0)
					
					$2->:=-1
					$3->:=-1
					$4->:=-1
					$5->:=-1
					
				End if 
			End if 
			
			//______________________________________________________
	End case 
	
	If ($Boo_set)
		
		If (Find in array:C230($tTxt_Components; "4DPop")>0)
			
			EXECUTE METHOD:C1007("4DPop_preferenceStore"; *; $kTxt_tool; $Dom_preferences)
			
		Else 
			
			DOM EXPORT TO FILE:C862($Dom_preferences; $Txt_path)
			
		End if 
	End if 
	
	DOM CLOSE XML:C722($Dom_preferences)
	
End if 