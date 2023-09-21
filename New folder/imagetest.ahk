#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenText, On
DetectHiddenWindows, On
#SingleInstance, Force


;   https://autohotkey.com/board/topic/7129-run-a-program-or-switch-to-an-already-running-instance/




;                         {[
;;           ELEVATE TO ADMIN UAC PROMPT BELOW
; If the script is not elevated, relaunch as administrator and kill current instance:
 
full_command_line := DllCall("GetCommandLine", "str")
 
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
;
;                          ]}




GLOBAL FolderTitleRoot := "HotSpots"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!
GLOBAL HotspotActivityLog := "hotspot_state.log"



config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot





IniRead, NetProbeImageRecogn, %config_path%, SWITCHES, NetProbeImageRecog
IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
IniRead, NetProbeTicks, %config_path%, CONFIG, HotspotTickrate
IniRead, PDAnetExe, %config_path%, CONFIG, pdaExe
IniRead, PDAnetPath, %config_path%, CONFIG, pdaPath
GLOBAL NetProbeImageRecog := NetProbeImageRecogn
GLOBAL QuickHotspot :=  QuickHotspotLaunch 
GLOBAL 2PASCleanup :=  2PAS_Cleanup 
GLOBAL HotspotPulse :=  HotspotPulsar
GLOBAL CleanerPulse :=  CleanerPulsar
GLOBAL PDAExe := PDAnetExe
GLOBAL PDAPath := PDAnetPath
IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
GLOBAL AutoNetProbe := AutoNetProbing
GLOBAL NetProbeTick := NetProbeTicks
GroupAdd, PdaNetPCexe, #32768 ; Add only Internet Explorer windows to this group.


;    Class := "ApplicationFrameWindow"
;    Title := "Microsoft To Do"
;    MsgBox(DllCall("FindWindowExW", "Ptr", 0, "Ptr", 0, "Str", Class, "Str", Title, "UPtr"), "FindWindowExW")




HOME::
        ; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
        ; Sleep, 7000
        If(NetProbeImageRecog="1")
        {
            ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
            ; ResultA2:=FindClick("ImageDisconnect.png", "silent n w2000")
            Sleep, 4000
            ResultA2:=FindClick("ImageDisconnect.png", "silent n w3000")
            If(ResultA2="1")
            {
                GLOBAL FoundDisconnectBtn := "1"
            }
            Else
            {
                GLOBAL FoundDisconnectBtn := "0"
            }
            ResultA3:=FindClick("ImageConnect.png", "silent n w3000")
            If(ResultA3="1")
              {
                GLOBAL FoundConnectBtn := "1"
              }
             Else
              {
                GLOBAL FoundConnectBtn := "0"
              }

            If(FoundConnectBtn="1")
            {
            Result0x:=FindClick("ImageConnect.png", "silent w3000")
            }
            If(FoundDisconnectBtn="1")
            {
            Result0x:=FindClick("ImageDisconnect.png", "silent w3000")
            GLOBAL DoReconnect := "1"
            }
            If(DoReconnect="1")
            {
                Sleep, 6000
                Result1x:=TrayIcon_Button(PDAExe, "L", false, 1)
                Sleep, 4000
                Result3x:=FindClick("ImageConnect.png", "silent w3000")
            }
        }
Return



END::
ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
Return

INS::
; Findclick()
; ControlClick,, ahk_exe PdaNetPC.exe,,,, NA x8 y5
; ControlClick, x35 y14, ahk_exe PdaNetPC.exe,,,, NA Pos
; ControlClick, x3 y4, ahk_class #32768,,,, NA Pos
; ControlClick,, ahk_exe PdaNetPC.exe,,,, NA x35 y14
; ControlClick, X7 Y7, ahk_group PdaNetPC.exe,,,,
; ControlClick, X7 Y7, ahk_group PdaNetPCexe,,,,
; ControlClick, X30 Y43, ahk_exe PdaNetPC.exe,,,,
; ControlClick,, ahk_group 0Xb907e2,,,, X7 Y7
; ControlClick,, ahk_id 0Xb907e2,,,, X7 Y7
; ControlSend,,{Down}, ahk_group PdaNetPCexe  ;;;; but this doesn't lol
ControlSend,,{Down}, ahk_exe PdaNetPC.exe  ;;;; worrrrkingggg
Sleep, 1500
ControlSend,, {Enter}, ahk_exe PdaNetPC.exe  ;;; this works somehow
; ControlSend,, {Enter}, ahk_exe PdaNetPC.exe
Return

GLOBAL PDANetHWID := "0xb907e2"

PgUp::
; FindClick("newFile", "n1 rA silent")
FindClick("newFile", "n1 rPDANetHWID silent")
Return

PgDn::
xhWnd := WinExist("ahk_exe PdaNetPC.exe")
MsgBox,, Title, %xhWnd%,
Return


PAUSE::
Reload
Return



Return
#Include, functionLibrary.toolkit