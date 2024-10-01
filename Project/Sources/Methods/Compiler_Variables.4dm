//%attributes = {"invisible":true}
_O_C_TEXT:C284(<>Txt_Url)
_O_C_TEXT:C284(<>Txt_request)
_O_C_BLOB:C604(<>Blb_help)
_O_C_LONGINT:C283(<>Lon_timerEvent; <>Lon_options)
_O_C_BOOLEAN:C305(<>Boo_inited)

_O_C_LONGINT:C283(splitter)

var pref : cs:C1710.pop.Preferences
pref:=pref || Try(cs:C1710.pop.Preferences.new("Commands"))

If (pref#Null:C1517)
	
	// MARK: Default values
	pref.default({\
		syntaxoptions: MAXLONG:K35:2; \
		syntaxlanguage: 2\
		})
	
End if 


