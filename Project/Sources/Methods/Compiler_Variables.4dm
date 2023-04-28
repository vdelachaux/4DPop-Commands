//%attributes = {"invisible":true}
C_TEXT:C284(<>Txt_Url)
//C_TEXT(<>Txt_buffer)
C_TEXT:C284(<>Txt_request)

C_BLOB:C604(<>Blb_help)  //; <>Blb_evaluate)

//C_LONGINT(<>bCloseSearch)
C_LONGINT:C283(<>Lon_timerEvent; <>Lon_options)

C_BOOLEAN:C305(<>Boo_inited)

C_LONGINT:C283(splitter)

var pref : Object
pref:=pref || pop.Preferences.new("Commands")

// MARK: Default values
pref.default({\
syntaxoptions: MAXLONG:K35:2; \
syntaxlanguage: 2\
})
