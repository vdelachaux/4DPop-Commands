// ----------------------------------------------------
// Form method : Form1 - (4DPop Commands)
// ID[57C7E88CF9E9466E96788F91641F10CB]
// Created #4-10-2013 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_bottom; $Lon_event; $Lon_formEvent; $Lon_left; $Lon_right; $Lon_top; $Win_hdl)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		//Bring the current window to the front !
		//Without this code, the entries text will not be taken into account,
		//even if the cursor is blinking in the search box... {
		$Win_hdl:=Current form window:C827
		GET WINDOW RECT:C443($Lon_left; $Lon_top; $Lon_right; $Lon_bottom; $Win_hdl)
		SET WINDOW RECT:C444($Lon_left; $Lon_top; $Lon_right; $Lon_bottom; $Win_hdl)
		//}
		
		GET_COMMAND_LIST
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "Subform_main"))->:=-1  //init
		
		//______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		//______________________________________________________
	: ($Lon_formEvent=On Close Box:K2:21)
		
		CANCEL:C270
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		OBJECT GET COORDINATES:C663(*; "splitter"; $Lon_left; $Lon_top; $Lon_right; $Lon_bottom)
		//If (splitter>-30)
		If ($Lon_right>33)
			
			splitter:=splitter-1
			SET TIMER:C645(1)
			
		Else 
			
			OBJECT SET VISIBLE:C603(splitter; False:C215)
			
		End if 
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessary ("+String:C10($Lon_formEvent)+")")
		
		//______________________________________________________
End case 