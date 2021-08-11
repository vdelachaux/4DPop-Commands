//%attributes = {}
//  // ----------------------------------------------------
//  // Project method: MONITOR_DELETED_METHODS
//  // Database: 4DPop Commands
//  // ID[7E5EE3F69B0E44A698CD3FAD645168A1]
//  // Created #15-10-2013 by Vincent de Lachaux
//  // ----------------------------------------------------
//  // Description
//  //
//  // ----------------------------------------------------
//  // Declarations
//C_TEXT($1)

//C_LONGINT($Lon_i;$Lon_parameters)
//C_TEXT($Txt_buffer;$Txt_entryPoint;$Txt_methodName)

//ARRAY TEXT($tTxt_paths;0)

//If (False)
//C_TEXT(MONITOR_DELETED_METHODS ;$1)
//End if 

//  // ----------------------------------------------------
//  // Initialisations
//$Lon_parameters:=Count parameters

//If ($Lon_parameters>=1)

//$Txt_entryPoint:=$1

//End if 

//  // ----------------------------------------------------
//Case of 

//  //___________________________________________________________
//: (Length($Txt_entryPoint)=0)

//$Txt_methodName:=Current method name

//Case of 

//  //……………………………………………………………………
//: (Method called on error=$Txt_methodName)

//  //Error handling manager

//  //……………………………………………………………………
//  //: (Method called on event=$Txt_methodName)

//  //Event manager - disable for a component method

//  //……………………………………………………………………
//Else 

//  //This method must be executed in a unique new process
//BRING TO FRONT(New process($Txt_methodName;12*1024;"$"+$Txt_methodName;"_run";*))

//  //……………………………………………………………………
//End case 

//  //___________________________________________________________
//: ($Txt_entryPoint="_run")

//  //First launch of this method executed in a new process
//MONITOR_DELETED_METHODS ("_declarations")
//MONITOR_DELETED_METHODS ("_init")

//C_LONGINT($Lon_i;$Lon_parameters)
//C_TEXT($Txt_buffer;$Txt_entryPoint;$Txt_methodName)

//ARRAY TEXT($tTxt_paths;0)

//METHOD GET PATHS(Path all objects;$tTxt_paths;*)

//ON ERR CALL("NoError")

//Repeat 

//DELAY PROCESS(Current process;50)

//If (Not(Process aborted))

//For ($Lon_i;1;Size of array($tTxt_paths);1)

//ERROR:=0

//METHOD GET CODE($tTxt_paths{$Lon_i};$Txt_buffer;*)

//If (ERROR=-9768)

//ALERT("Method: \""+$tTxt_paths{$Lon_i}+"\" was deleted.")

//End if 
//End for 

//METHOD GET PATHS(Path all objects;$tTxt_paths;*)

//End if 
//Until (Process aborted)

//ON ERR CALL("")

//MONITOR_DELETED_METHODS ("_deinit")

//  //___________________________________________________________
//: ($Txt_entryPoint="_declarations")

//  //___________________________________________________________
//: ($Txt_entryPoint="_init")

//  //___________________________________________________________
//: ($Txt_entryPoint="_deinit")

//RELEASE MENU(Get menu bar reference)

//  //___________________________________________________________
//Else 

//ASSERT(False;"Unknown entry point ("+$Txt_entryPoint+")")

//  //___________________________________________________________
//End case 