#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On


; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe
; Process, Close, Powershell.exe

GLOBAL FolderTitleRoot := "Angel"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!



config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot

IniRead, ShowDebugMessages1, %config_path%, DEBUG, ShowBreakpoints, 0


If(FileExist(A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle))
{
    If(ShowDebugMessages1="1")
    {
    MsgBox, , (1) Exists!, cfg at documents Exists!,
    }
    ; Return
}
Else
{
    If(ShowDebugMessages1="1")
    {
    MsgBox, , (1) DOES NOT Exist!, cfg at documents error! Rebuilding!,
    }
    FileCreateDir, %create_config_path%
    Sleep, 1000
    FileAppend,  , %config_path%
    IniWrite, 0, %config_path%, SWITCHES, 2PassCleanup
    Sleep, 500
    FileAppend, "; Perform a Second Process Close Event on the tail end of every cleanup pass.", %config_path%
    Sleep, 700
    IniWrite, 0, %config_path%, SWITCHES, HotspotTickrate
    Sleep, 500
    FileAppend, "; Perform a Second Process Close Event on the tail end of every cleanup pass.", %config_path%
    Sleep, 700
    IniWrite, 0, %config_path%, SWITCHES, CleanupTickrate
    Sleep, 500
    FileAppend, "; Perform a Second Process Close Event on the tail end of every cleanup pass.", %config_path%
    Sleep, 700
    IniWrite, 0, %config_path%, DEBUG, ShowBreakpoints
    Sleep, 500
    FileAppend, "; Shows breakpoint messages.", %config_path%
    

        ; If(FileExist(A_MyDocuments . ConfigFileTitle))
        If(FileExist(A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle))
        {
        If(ShowDebugMessages1="1")
        {
        MsgBox, , (2) Exists!, cfg at documents Exists!,
        }
        }
        Else
        {
        If(ShowDebugMessages1="1")
        {
        MsgBox, , (2) DOES NOT Exist!, cfg at documents error! Rebuild failed! Check permissions or logic!,
        }
        ; Return
        }

}
IniRead, 2PAS_Cleanup, %config_path%, SWITCHES, 2PassCleanup, 0
IniRead, ShowDebugMessages2, %config_path%, DEBUG, ShowBreakpoints, 0
GLOBAL 2PASCleanup :=  2PAS_Cleanup 
If(ShowDebugMessages1=ShowDebugMessages2)
{
    GLOBAL ShowDebugMessages := ShowDebugMessages1
}
Else
{
    GLOBAL ShowDebugMessages := ShowDebugMessages2
}

ThrowString0x001 := 0
If(ShowDebugMessages="1")
{
MsgBox,, value notifiers, `n| 2pass cleanup = %2PASCleanup% `n| ShowDebugMessages = %ShowDebugMessages%, 25
}











ThrowString0x001++ ;;Increase first run string to first nominal level
if ProcessExist("powershell.exe")
{
        If(ShowDebugMessages="1")
        {
        MsgBox,, Powershell Cleaner Heartbeat, powershell cleaner heartbeat running..
        }
        If(ThrowString0x001="1")
        {
        If(ShowDebugMessages="1")
        {
        MsgBox First Run String was in its first value, logic execution continued.
        }
        ThrowString0x001++
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        Process, Close, Powershell.exe
        ; Return
        }
    Process, Close, Powershell.exe
    If(2PASCleanup="1")
    {
    Process, Close, Powershell.exe
    Return
    }
}
If(ShowDebugMessages="1")
{
MsgBox,, Title, ThrowString0x001 was at: %ThrowString0x001% at end of execution, 25
}





ExitApp






ProcessExist(PIDorName:="")
{
    Process Exist, %PIDorName%
    return ErrorLevel
}