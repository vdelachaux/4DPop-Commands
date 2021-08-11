C_LONGINT:C283($Lon_language)

$Lon_language:=Self:C308->

PREFERENCES("syntaxlanguage.set"; Self:C308)

ARRAY TEXT:C222($tTxt_languages; 0x0000)
APPEND TO ARRAY:C911($tTxt_languages; "fr")
APPEND TO ARRAY:C911($tTxt_languages; "en")
APPEND TO ARRAY:C911($tTxt_languages; "de")
APPEND TO ARRAY:C911($tTxt_languages; "es")
APPEND TO ARRAY:C911($tTxt_languages; "ja")
APPEND TO ARRAY:C911($tTxt_languages; "pt")

<>Txt_Url:=Replace string:C233(helpUrlTemplate; "{lang}"; $tTxt_languages{<>tTxt_Languages})