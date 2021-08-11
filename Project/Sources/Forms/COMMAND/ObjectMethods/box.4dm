C_LONGINT:C283($Lon_Event)

$Lon_Event:=Form event code:C388

Case of 
		
		//______________________________________________________
	: ($Lon_Event=On Load:K2:1)
		
		//______________________________________________________
	: ($Lon_Event=On Getting Focus:K2:7)
		
		OBJECT SET VISIBLE:C603(*; "close"; Length:C16(Self:C308->)>0)
		
		//______________________________________________________
	: ($Lon_Event=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*; "close"; Length:C16(Self:C308->)>0)
		
		If (Find in array:C230(<>Lstb_results; True:C214)<0)
			
			GOTO OBJECT:C206(*; "results")
			LISTBOX SELECT ROW:C912(*; "results"; 1; lk replace selection:K53:1)
			
		End if 
		
		//______________________________________________________
	: ($Lon_Event=On Before Keystroke:K2:6)
		
		//management of down arrow key
		If (Character code:C91(Keystroke:C390)=Down arrow key:K12:19)
			
			FILTER KEYSTROKE:C389("")
			
			GOTO OBJECT:C206(*; "results")
			
			If (<>tTxt_Results=0)
				
				LISTBOX SELECT ROW:C912(*; "results"; 1; lk replace selection:K53:1)
				
			End if 
		End if 
		
		//______________________________________________________
	: ($Lon_Event=On After Edit:K2:43)
		
		<>tTxt_commands{0}:=Get edited text:C655
		OBJECT SET VISIBLE:C603(*; "close"; Length:C16(<>tTxt_commands{0})>0)
		
		(OBJECT Get pointer:C1124(Object subform container:K67:4))->:=8858  //Will start the timer
		SET TIMER:C645(-1)
		
		//______________________________________________________
End case 