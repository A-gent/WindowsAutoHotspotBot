#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent



GLOBAL FolderTitleRoot := "HotSpots"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!
GLOBAL HotspotActivityLog := "hotspot_state.log"



config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot

Menu, Tray, NoStandard
Menu, Tray, Add, Settings, SettingsBTN  ; Creates a new menu item.
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Exit, ExitBTN   ; Creates a new menu item.
return

SettingsBTN:
Run, %A_MyDocuments%\%FolderTitleRoot%\%ConfigFileTitle%
return

ExitBTN:
ExitApp