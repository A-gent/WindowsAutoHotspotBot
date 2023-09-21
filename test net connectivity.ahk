#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileDelete, netprobe.hotspots


GLOBAL FolderTitleRoot := "HotSpots"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!
GLOBAL HotspotActivityLog := "hotspot_state.log"



config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot

ConnectedToInternet()
; If ConnectedToInternet()
; {
; MsgBox Connected!
; }
; Else
; {
;     MsgBox Not Connected!
; }


ConnectedToInternet()
{
    ;;;  https://www.autohotkey.com/docs/v1/lib/URLDownloadToFile.htm
    UrlDownloadToFile, https://drive.google.com/file/d/1xTyQApFEKttY_EbL5grZWOkVcc7qgZHe/view?usp=sharing, %create_config_path%\netprobe.hotspots
    if ErrorLevel   ; i.e. it's not blank or zero.
    MsgBox, The File was unable to be downloaded and does not exist.
    else
    MsgBox, The file was downloaded, you're connect to the internet, verify the file's size to be sure?
    Return
}







;;;;

; WinWait, MyWindow,, 1
; if ErrorLevel   ; i.e. it's not blank or zero.
;     MsgBox, The window does not exist.
; else
;     MsgBox, The window exists.