//%attributes = {"invisible":true}

//init
C_BOOLEAN:C305(init; $1)

//preferences
C_TEXT:C284(PREFERENCES; $1)
C_POINTER:C301(PREFERENCES; ${2})

//setOption
C_LONGINT:C283(setOption; $1)

//Commands
C_POINTER:C301(Commands; $1)

//getSyntax
C_TEXT:C284(getSyntax; $0)
C_LONGINT:C283(getSyntax; $1)

//helpUrlTemplate
C_TEXT:C284(helpUrlTemplate; $0)

C_LONGINT:C283(form_open_page; $1)

C_TEXT:C284(env_Get_4DResourcesFolder; $0)

C_TEXT:C284(env_Get_InfoPlistValue; $0)
C_TEXT:C284(env_Get_InfoPlistValue; $1)

//C_TEXT(GET_COMMAND_LIST ;$0)

C_POINTER:C301(4DPop_COMMAND_LIST; $1)

C_TEXT:C284(BUILD_LOCALIZATION_MACROS; $1)