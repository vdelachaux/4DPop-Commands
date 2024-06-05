//%attributes = {"invisible":true}
C_TEXT:C284(<>Txt_Url)
C_TEXT:C284(<>Txt_request)
C_BLOB:C604(<>Blb_help)
C_LONGINT:C283(<>Lon_timerEvent; <>Lon_options)
C_BOOLEAN:C305(<>Boo_inited)

C_LONGINT:C283(splitter)

var pref : cs:C1710.pop.Preferences
pref:=pref || Try(pop.Preferences.new("Commands"))

If (pref#Null:C1517)
	
	// MARK: Default values
	pref.default({\
		syntaxoptions: MAXLONG:K35:2; \
		syntaxlanguage: 2\
		})
	
End if 


