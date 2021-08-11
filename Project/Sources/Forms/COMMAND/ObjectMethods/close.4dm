CLEAR VARIABLE:C89(<>tTxt_commands{0})
CLEAR VARIABLE:C89(<>Txt_request)

GOTO OBJECT:C206(<>Txt_request)

OBJECT SET VISIBLE:C603(*; "close"; False:C215)

(OBJECT Get pointer:C1124(Object subform container:K67:4))->:=8858
SET TIMER:C645(-1)

