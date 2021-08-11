// ----------------------------------------------------
// Form method : PARAMETER - (4DPop Commands)
// ID[EB63C6145D73473FB30ED1DB773BC3A4]
// Created #4-10-2013 by Vincent de Lachaux
// ----------------------------------------------------
// Declarations
C_LONGINT:C283($Lon_formEvent)

// ----------------------------------------------------
// Initialisations
$Lon_formEvent:=Form event code:C388

// ----------------------------------------------------

Case of 
		//______________________________________________________
	: ($Lon_formEvent=On Load:K2:1)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "drag.cb"))->:=Num:C11(<>Lon_options ?? 1)
		(OBJECT Get pointer:C1124(Object named:K67:5; "both.cb"))->:=Num:C11(<>Lon_options ?? 2)
		(OBJECT Get pointer:C1124(Object named:K67:5; "window.cb"))->:=Num:C11(<>Lon_options ?? 3)
		(OBJECT Get pointer:C1124(Object named:K67:5; "position.cb"))->:=Num:C11(<>Lon_options ?? 4)
		(OBJECT Get pointer:C1124(Object named:K67:5; "number.cb"))->:=Num:C11(<>Lon_options ?? 5)
		(OBJECT Get pointer:C1124(Object named:K67:5; "syntax.cb"))->:=Num:C11(<>Lon_options ?? 6)
		OBJECT SET ENABLED:C1123(*; "drag.cb"; <>Lon_options ?? 6)
		OBJECT SET ENABLED:C1123(*; "position.cb"; (<>Lon_options ?? 6) & (<>Lon_options ?? 1))
		
		//SET TIMER(-1)
		
		//______________________________________________________
	: ($Lon_formEvent=On Unload:K2:2)
		
		//______________________________________________________
	: ($Lon_formEvent=On Bound Variable Change:K2:52)
		
		FORM GOTO PAGE:C247((OBJECT Get pointer:C1124(Object subform container:K67:4))->; *)
		
		//______________________________________________________
	: ($Lon_formEvent=On Timer:K2:25)
		SET TIMER:C645(0)
		
		//______________________________________________________
	Else 
		
		ASSERT:C1129(False:C215; "Form event activated unnecessary ("+String:C10($Lon_formEvent)+")")
		
		//______________________________________________________
End case 