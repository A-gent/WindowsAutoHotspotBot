#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;;;;;;;   GLOBALS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GLOBAL DataFile_Engine := "engine.cfg"
GLOBAL DataFile_Setup := "startups.cfg"
ConfigFile_A := A_ScriptDir . "\" . DataFile_Engine
ConfigFile_B := A_ScriptDir . "\" . DataFile_Setup
GLOBAL BlankSetupFieldFolder := "please input a directory here"
GLOBAL BlankSetupFieldExe := "please put the corresponding exe here"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;   VERIFY CONFIG FILE INTEGRITY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
If FileExist(ConfigFile_A)
{
}
Else
{
FileAppend,  , %DataFile_Engine%
IniWrite, 1, %ConfigFile_A%, SWITCHES, RunWithAdmin
IniWrite, 0, %ConfigFile_A%, DEBUG, DebugMode
IniWrite, 0, %ConfigFile_A%, DEBUG, EnableErrorMessages
IniWrite, 0, %ConfigFile_A%, DEBUG, EnableBreakpointMessages
}
If FileExist(ConfigFile_B)
{
}
Else
{
FileAppend,  , %DataFile_Setup%
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x001
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x002
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x003
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x004
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x005
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x006
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x007
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x008
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x009
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_A%, CONTAINERS, AppDirectory0x010
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x001
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x002
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x003
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x004
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x005
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x006
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x007
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x008
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x009
IniWrite, %BlankSetupFieldExe%, %ConfigFile_A%, EXECUTABLES, AppExe0x010
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;   READ SETTINGS DATA FROM DISK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IniRead, UAC_Elevate, %ConfigFile_A%, SWITCHES, RunWithAdmin, 1
IniRead, DebuggingState, %ConfigFile_A%, DEBUG, DebugMode, 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;   BEGIN MAIN AUTOEXEC LOGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;END OF MAIN AUTOEXEC LOGIC;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









; [CONTAINERS]
; AppDirectory0x001=C:\Program Files (x86)\PdaNet for Android\
; AppDirectory0x002=C:\
; AppDirectory0x003=D:\Program Files (x86)\Football2000\
; AppDirectory0x004=
; AppDirectory0x005=
; AppDirectory0x006=
; AppDirectory0x007=
; AppDirectory0x008=
; AppDirectory0x009=
; AppDirectory0x010=

; [EXECUTABLES]
; AppExe0x001=PdaNetPC.exe
; AppExe0x002=AutoHotspotHandler.exe
; AppExe0x003=foobar2000.exe
; AppExe0x004=
; AppExe0x005=
; AppExe0x006=
; AppExe0x007=
; AppExe0x008=
; AppExe0x009=
; AppExe0x010=







; [SWITCHES]
; RunWithAdmin=1

; [DEBUG]
; DebugMode=
; ;; Master Switch to toggle all debugging
; EnableErrorMessages=
; ;; These are messages that print when a routine fails
; EnableFunctionMessages=
; ;; These are messages that print when a function or label is called or executed
; EnableBreakpointMessages=
; ;; These are messages that print when the engine has reached a certain point throughout autoexec phasing

; [DATA]