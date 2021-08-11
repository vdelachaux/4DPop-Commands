//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : init
// ID[07F272DCF921492B8C9D61850A458E6B]
// Created 24/11/11 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations
C_BOOLEAN:C305($1)

C_BOOLEAN:C305($Boo_init)
C_LONGINT:C283($Lon_i; $Lon_parameters; $Lon_x)
C_TEXT:C284($Dom_help; $Txt_4dResourcesFolder; $Txt_path; $Txt_XSL)

If (False:C215)
	C_BOOLEAN:C305(init; $1)
End if 

// ----------------------------------------------------
// Initialisations
$Lon_parameters:=Count parameters:C259

If (Asserted:C1132($Lon_parameters>=0; "Missing parameter"))
	
	Compiler_Variables
	
	If ($Lon_parameters>=1)
		
		$Boo_init:=$1
		
	End if 
	
	SET ASSERT ENABLED:C1131(Not:C34(Is compiled mode:C492))
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
If (Not:C34(<>Boo_inited) | $Boo_init)
	
	Compiler_Arrays
	
	PREFERENCES("syntaxoptions.get"; -><>Lon_options)
	
	//prepare the XSL Query {
	$Txt_XSL:="<?xml version=\"1.0\" encoding=\"utf-8\"?>"\
		+"<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" xmlns:dyn=\"http://exslt.org/dynamic\">"\
		+"<xsl:output method=\"xml\"/>"\
		+"<xsl:param name=\"xpath_in\"/>"\
		+"<xsl:template match=\"/\">"\
		+"<value>"\
		+"<xsl:value-of select=\"dyn:evaluate($xpath_in)\"/>"\
		+"</value>"\
		+"</xsl:template>"\
		+"</xsl:stylesheet>"
	
	CONVERT FROM TEXT:C1011($Txt_XSL; "UTF-8"; <>Blb_evaluate)
	//}
	
	//Default language
	ARRAY TEXT:C222($tTxt_languages; 0x0000)
	APPEND TO ARRAY:C911($tTxt_languages; "fr")
	APPEND TO ARRAY:C911($tTxt_languages; "en")
	APPEND TO ARRAY:C911($tTxt_languages; "de")
	APPEND TO ARRAY:C911($tTxt_languages; "es")
	APPEND TO ARRAY:C911($tTxt_languages; "ja")
	APPEND TO ARRAY:C911($tTxt_languages; "pt")
	
	//What's the language of the 4D runtime {
	ARRAY TEXT:C222($tTxt_Components; 0x0000)
	COMPONENT LIST:C1001($tTxt_Components)
	
	If (Asserted:C1132(Find in array:C230($tTxt_Components; "4DPop")>0; "The component 4DPop isn't installed or loaded"))
		
		//$Txt_4dResourcesFolder:=4DPop_applicationFolder(kResources)
		EXECUTE METHOD:C1007("4DPop_applicationFolder"; $Txt_4dResourcesFolder; kResources)
		
		//$Txt_4dLanguage:=4DPop_applicationLanguage
		EXECUTE METHOD:C1007("4DPop_applicationLanguage"; $tTxt_languages{0})
		
	Else 
		
		$tTxt_languages{0}:=Get database localization:C1009(User system localization:K5:23)
		
	End if 
	
	If (Find in array:C230($tTxt_languages; $tTxt_languages{0})<0)
		
		$tTxt_languages{0}:="en"  //default to english
		
	End if 
	
	//Get syntax help reference {
	$Txt_path:=$Txt_4dResourcesFolder\
		+$tTxt_languages{0}+".lproj"+Folder separator:K24:12\
		+"4DSyntax"+Uppercase:C13($tTxt_languages{0})+".xlf"
	
	If (Test path name:C476($Txt_path)#Is a document:K24:1)
		
		$tTxt_languages{0}:=$tTxt_languages{2}  //en
		$Txt_path:=$Txt_4dResourcesFolder\
			+$tTxt_languages{0}+".lproj"+Folder separator:K24:12\
			+"4DSyntax"+Uppercase:C13($tTxt_languages{0})+".xlf"
		
	End if 
	
	If (Test path name:C476($Txt_path)=Is a document:K24:1)
		
		$Dom_help:=DOM Parse XML source:C719($Txt_path)
		
		If (OK=1)
			
			DOM EXPORT TO VAR:C863($Dom_help; <>Blb_help)
			
		End if 
		
	Else 
		
		ALERT:C41("File not found: \""+$Txt_path+"\"")
		
	End if   //}
	
	//Language for the documentation {
	//Available languages array
	ARRAY TEXT:C222(<>tTxt_Languages; 6)
	
	For ($Lon_i; 1; 6; 1)
		
		<>tTxt_Languages{$Lon_i}:=Get localized string:C991("Lang_"+String:C10($Lon_i))
		
	End for 
	
	//Get the user preferences
	PREFERENCES("syntaxlanguage.get"; ->$Lon_x)
	
	If ($Lon_x<=0)\
		 | ($Lon_x>Size of array:C274(<>tTxt_Languages))
		
		$Lon_x:=Find in array:C230($tTxt_languages; $tTxt_languages{0})
		
	End if 
	
	<>tTxt_Languages:=$Lon_x
	
	//The localized url
	<>Txt_Url:=Replace string:C233(helpUrlTemplate; "{lang}"; $tTxt_languages{0})
	
	GET_COMMAND_LIST
	
	<>Boo_inited:=True:C214
	
End if 

// ----------------------------------------------------
// End