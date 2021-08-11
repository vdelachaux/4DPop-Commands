// ----------------------------------------------------
// Form method : COMMAND - (4DPop Commands)
// ID[E48A62EC19CD4D1384161C572BC498CD]
// Created #4-10-2013 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_BOOLEAN:C305($Boo_macro)
C_LONGINT:C283($Lon_formEvent; $Lon_state; $Lon_time; $Lon_timerEvent; $Lon_x)
C_TEXT:C284($Txt_buffer; $Txt_current; $Txt_name; $Txt_target)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		OBJECT SET VISIBLE:C603(<>tLon_Results; <>Lon_options ?? 5)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "version"))->\
			:=env_Get_InfoPlistValue("CFBundleLongVersionString")
		
		//Puts the last search, if any, in the search box
		(OBJECT Get pointer:C1124(Object named:K67:5; "box"))->:=<>tTxt_commands{0}
		
		//Be sure focus is nowhere
		GOTO OBJECT:C206(*; "")
		
		//______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		<>tTxt_commands{0}:=(OBJECT Get pointer:C1124(Object named:K67:5; "box"))->
		
		//______________________________________________________
	: ($Lon_formEvent=On Bound Variable Change:K2:52)
		
		If ((OBJECT Get pointer:C1124(Object subform container:K67:4))->#0)
			
			SET TIMER:C645(-1)  //Something to do
			
		End if 
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$Lon_timerEvent:=(OBJECT Get pointer:C1124(Object subform container:K67:4))->
		(OBJECT Get pointer:C1124(Object subform container:K67:4))->:=0
		
		$Txt_current:=<>tTxt_commands{0}
		
		Case of 
				
				//______________________________________________________
			: ($Lon_timerEvent=-1)  //Init
				
				//Get the open mode: macro or 4DPop
				//the behavior will not be the same
				PROCESS PROPERTIES:C336(Current process:C322; $Txt_name; $Lon_state; $Lon_time)
				$Boo_macro:=($Txt_name="macro_call")
				
				If (Length:C16($Txt_current)>0)
					
					$Txt_target:=Choose:C955($Boo_macro; "results"; "box")
					
				Else 
					
					If ($Boo_macro)
						
						$Txt_target:="box"
						
					Else 
						
						$Txt_target:=Choose:C955(LISTBOX Get number of rows:C915(*; "results")>0; "results"; "box")
						
					End if 
				End if 
				
				GOTO OBJECT:C206(*; $Txt_target)
				
				If ($Txt_target="box")
					
					//HIGHLIGHT TEXT(*;"box";1;MAXTEXTLENBEFOREV11)
					LISTBOX SELECT ROW:C912(*; "results"; 0; lk remove from selection:K53:3)
					
				Else 
					
					LISTBOX SELECT ROW:C912(*; "results"; 1; lk replace selection:K53:1)
					
				End if 
				
				$Lon_timerEvent:=0
				
				//----------------------------------------
			Else 
				
				OBJECT SET VISIBLE:C603(<>tLon_Results; <>Lon_options ?? 5)
				
				CLEAR VARIABLE:C89((OBJECT Get pointer:C1124(Object named:K67:5; "editionBuffering"))->)
				
				$Lon_timerEvent:=0
				
				//______________________________________________________
		End case 
		
		$Txt_buffer:=(OBJECT Get pointer:C1124(Object named:K67:5; "editionBuffering"))->
		
		If (<>tTxt_commands{0}#$Txt_buffer)\
			 | (Length:C16($Txt_current)=0)
			
			CLEAR VARIABLE:C89(<>tTxt_Results)
			CLEAR VARIABLE:C89(<>tLon_Results)
			
			If (Length:C16($Txt_current)>0)
				
				$Txt_target:=Replace string:C233(Replace string:C233(" "+$Txt_current+" "; "  "; " "); " "; "@")
				
				Repeat 
					
					$Lon_x:=Find in array:C230(<>tTxt_commands; $Txt_target; $Lon_x+1)
					
					If ($Lon_x>0)
						
						If (Character code:C91(<>tTxt_commands{$Lon_x})#At sign:K15:46)
							
							APPEND TO ARRAY:C911(<>tTxt_Results; <>tTxt_commands{$Lon_x})
							APPEND TO ARRAY:C911(<>tLon_Results; <>tLon_Command_IDs{$Lon_x})
							
						End if 
					End if 
				Until ($Lon_x=-1)
				
				SORT ARRAY:C229(<>tTxt_Results; <>tLon_Results)
				
			End if 
			
			<>Txt_request:=$Txt_current
			(OBJECT Get pointer:C1124(Object named:K67:5; "editionBuffering"))->:=$Txt_current
			
		End if 
		
		OBJECT SET VISIBLE:C603(*; "close"; Length:C16($Txt_current)>0)
		
		//Is there something more to do ?
		If ($Lon_timerEvent#0)
			
			(OBJECT Get pointer:C1124(Object subform container:K67:4))->:=$Lon_timerEvent
			
			SET TIMER:C645(-1)
			
		End if 
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessary ("+String:C10($Lon_formEvent)+")")
		
		//______________________________________________________
End case 