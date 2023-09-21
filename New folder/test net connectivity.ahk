#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
FileDelete, netprobe.hotspots


GLOBAL FolderTitleRoot := "HotSpots"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!
GLOBAL HotspotActivityLog := "hotspot_state.log"



config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot


; If ConnectedToInternet()
; {
; MsgBox Connected!
; }
; Else
; {
;     MsgBox Not Connected!
; }
IniRead, NetProbeImageRecogn, %config_path%, SWITCHES, NetProbeImageRecog
IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
IniRead, NetProbeTicks, %config_path%, CONFIG, HotspotTickrate
IniRead, PDAnetExe, %config_path%, PDAnet, pdaExe
IniRead, PDAnetPath, %config_path%, PDAnet, pdaPath
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


GLOBAL PDAformatted := PDAnetPath . "\" . PDAExe

GLOBAL NetProbeExecutionLevel := ""

MsgBox, , Title, %PDAformatted%,
; ConnectedToInternet()

SetTimer, TestTimer, 47000
Goto, TestTimer
Return


GLOBAL Image001 := "ImageDisconnect.png"
GLOBAL Image002 := "ImageConnect.png"



TestTimer:
; ConnectedToInternet()
; {
    ;;;  https://www.autohotkey.com/docs/v1/lib/URLDownloadToFile.htm
    FileDelete, netprobe.hotspots
    Sleep, 1000
    UrlDownloadToFile, https://drive.google.com/file/d/1xTyQApFEKttY_EbL5grZWOkVcc7qgZHe/view?usp=sharing, netprobe.hotspots
    if ErrorLevel   ; i.e. it's not blank or zero.
    {
    If(ShowDebugMessages="3")
    {
    MsgBox, The File was unable to be downloaded and does not exist.
    }
    GLOBAL NetProbeExecutionLevel := "1"
    }
    else
    {
        If(ShowDebugMessages="3")
        {
        MsgBox, The file was downloaded, you're connect to the internet, verify the file's basic integrity to be sure?
        }
        GLOBAL NetProbeExecutionLevel := "0"
    }
    Sleep, 3000
    If(NetProbeExecutionLevel="1")
    {
        ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
        SetTimer, ClickPDAtrayTrigger, -500

        If(NetProbeImageRecog="1")
        {
        ResultA2:=FindClick("ImageDisconnect.png", "silent n w2000")
        If(ResultA2="0")
        {
            ResultA3:=FindClick("ImageConnect.png", "silent w2000")
            If(ResultA2="0")
            {
            }
        }
        }
        ResultA4:=FindClick("ImageConnect.png", "silent w2000")
        If(ResultA2="0")
        {
            ResultA5:=FindClick("ImageDisconnect.png", "silent n w2000")
            If(ResultA2="0")
            {
            }
        }
    }
        Else
        {
        Sleep, 10200
        Send {Down}
        Sleep, 1000
        Send {Enter}
        Sleep, 6000
        ; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
        ; SetTimer, ClickPDAtrayTrigger, -500
        ; Sleep, 10200
        ; Send {Down}
        ; Sleep, 1000
        ; Send {Enter}
        }
        Sleep, 1500
            UrlDownloadToFile, https://drive.google.com/file/d/1xTyQApFEKttY_EbL5grZWOkVcc7qgZHe/view?usp=sharing, netprobe.hotspots
            if ErrorLevel   ; i.e. it's not blank or zero.
            {
            If(ShowDebugMessages="3")
            {
            MsgBox, The File was unable to be downloaded and does not exist.
            }
            GLOBAL NetProbeExecutionLevel := "2"
            ; FileDelete, netprobe.hotspots
            }
            else
            {
            If(ShowDebugMessages="3")
            {
            MsgBox, The file was downloaded, you're connect to the internet, verify the file's basic integrity to be sure?
            }
            GLOBAL NetProbeExecutionLevel := "0"
            }
    If(NetProbeExecutionLevel="2")
    {
     
        Process, Close, %PDAExe%
        Sleep, 2000
        Run, %PDAformatted%
        Sleep, 7100
        SetTimer, ClickPDAtrayTrigger, -500
        ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
        Sleep, 7000
        If(NetProbeImageRecog="1")
        {
        ResultA2:=FindClick("ImageDisconnect.png", "silent n w2000")
        If(ResultA2="0")
        {
            ResultA3:=FindClick("ImageConnect.png", "silent w2000")
            If(ResultA2="0")
            {
            }
        }
        ResultA4:=FindClick("ImageConnect.png", "silent w2000")
        If(ResultA2="0")
        {

            ResultA5:=FindClick("ImageDisconnect.png", "silent n w2000")
            If(ResultA2="0")

            {
            }
        }
        }
        Else
        {
        SetTimer, ClickPDAtrayTrigger, -500
        ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
        Sleep, 10200
        Send {Down}
        Sleep, 2900
        Send {Enter}
        }

                UrlDownloadToFile, https://drive.google.com/file/d/1xTyQApFEKttY_EbL5grZWOkVcc7qgZHe/view?usp=sharing, netprobe.hotspots
                if ErrorLevel   ; i.e. it's not blank or zero.
                {
                If(ShowDebugMessages="3")
                {
                MsgBox, The File was unable to be downloaded and does not exist.
                }
                GLOBAL NetProbeExecutionLevel := "3"
                }
                else
                {
                If(ShowDebugMessages="3")
                {
                MsgBox, The file was downloaded, you're connect to the internet, verify the file's basic integrity to be sure?
                }
                GLOBAL NetProbeExecutionLevel := "0"
                }
    }
    If(NetProbeExecutionLevel="3")
    {
                UrlDownloadToFile, https://drive.google.com/file/d/1xTyQApFEKttY_EbL5grZWOkVcc7qgZHe/view?usp=sharing, netprobe.hotspots
                if ErrorLevel   ; i.e. it's not blank or zero.
                {
                If(ShowDebugMessages="3")
                {
                MsgBox, The File was unable to be downloaded and does not exist. The system will now break the NetProbe to value -1 to reflect this exception.
                }
                GLOBAL NetProbeExecutionLevel := "4"
                IniWrite, -1, %config_path%, SWITCHES, AutoNetProbe
                IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
                GLOBAL AutoNetProbe := AutoNetProbing
                }
                else
                {
                If(ShowDebugMessages="3")
                {
                MsgBox, The file was downloaded, you're connect to the internet, verify the file's basic integrity to be sure?
                }
                GLOBAL NetProbeExecutionLevel := "0"
                }
    }
    If(NetProbeExecutionLevel="0")
    {
        IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
        If(AutoNetProbing="-1")
        {
            IniWrite, 1, %config_path%, SWITCHES, AutoNetProbe
                If(ShowDebugMessages="3")
                {
                    MsgBox,, Corrected Value, Auto-Corrected (if autonomous) A previously wrote value change which had been made to reflect negative value of NetProbe switch-Exception Error CheckHandler., 25
                }
        }
            IniRead, AutoNetProbing, %config_path%, SWITCHES, AutoNetProbe
            GLOBAL AutoNetProbe := AutoNetProbing
        FileDelete, netprobe.hotspots
        Return
    }
    Return
; }
Return



ClickPDAtrayTrigger:
    ; If(ShowDebugMessages="3")
    ; {
        ; MsgBox,, Trigger Fired, PDAnetTrigger timer thread called
    ; }
ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
; ResultA:=TrayIcon_Button(PDAExe, "L", false, 1)
Return



;;;;

; WinWait, MyWindow,, 1
; if ErrorLevel   ; i.e. it's not blank or zero.
;     MsgBox, The window does not exist.
; else
;     MsgBox, The window exists.

Return
#Include, functionLibrary.toolkit
