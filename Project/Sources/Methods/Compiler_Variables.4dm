//%attributes = {"invisible":true}
var <>Txt_Url : Text
var <>Txt_request : Text
var <>Blb_help : Blob
var <>Lon_timerEvent; <>Lon_options : Integer
var <>Boo_inited : Boolean

var splitter : Integer

var pref : cs:C1710.pop.Preferences
pref:=pref || Try(cs:C1710.pop.Preferences.new("Commands"))

If (pref#Null:C1517)
	
	// MARK: Default values
	pref.default({\
		syntaxoptions: MAXLONG:K35:2; \
		syntaxlanguage: 2\
		})
	
End if 