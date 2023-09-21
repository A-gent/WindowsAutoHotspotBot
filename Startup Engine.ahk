#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
;;;;;;;
;;;;;;;
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
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp01
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp02
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp03
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp04
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp05
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp06
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp07
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp08
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp09
IniWrite, 1, %ConfigFile_B%, SWITCHES, DisableApp10
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x001
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x002
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x003
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x004
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x005
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x006
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x007
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x008
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x009
IniWrite, %BlankSetupFieldFolder%, %ConfigFile_B%, CONTAINERS, AppDirectory0x010
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x001
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x002
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x003
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x004
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x005
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x006
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x007
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x008
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x009
IniWrite, %BlankSetupFieldExe%, %ConfigFile_B%, EXECUTABLES, AppExe0x010
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;   READ SETTINGS DATA FROM DISK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IniRead, UAC_Elevate, %ConfigFile_A%, SWITCHES, RunWithAdmin, 1
GLOBAL ElevatedRights := UAC_Elevate
IniRead, DebuggingState, %ConfigFile_A%, DEBUG, DebugMode, 0
GLOBAL DeveloperMode := DebuggingState
IniRead, ErrorMessages, %ConfigFile_A%, DEBUG, EnableErrorMessages, 0
GLOBAL DoErrorMessages := ErrorMessages
IniRead, BreakpointMessages, %ConfigFile_A%, DEBUG, EnableBreakpointMessages, 0
GLOBAL DoBreakpointMessages := BreakpointMessages


IniRead, doApp01, %ConfigFile_B%, SWITCHES, DisableApp01, 0
GLOBAL App001 := doApp01
IniRead, doApp02, %ConfigFile_B%, SWITCHES, DisableApp02, 0
GLOBAL App002 := doApp02
IniRead, doApp03, %ConfigFile_B%, SWITCHES, DisableApp03, 0
GLOBAL App003 := doApp03
IniRead, doApp04, %ConfigFile_B%, SWITCHES, DisableApp04, 0
GLOBAL App004 := doApp04
IniRead, doApp05, %ConfigFile_B%, SWITCHES, DisableApp05, 0
GLOBAL App005 := doApp05
IniRead, doApp06, %ConfigFile_B%, SWITCHES, DisableApp06, 0
GLOBAL App006 := doApp06
IniRead, doApp07, %ConfigFile_B%, SWITCHES, DisableApp07, 0
GLOBAL App007 := doApp07
IniRead, doApp08, %ConfigFile_B%, SWITCHES, DisableApp08, 0
GLOBAL App008 := doApp08
IniRead, doApp09, %ConfigFile_B%, SWITCHES, DisableApp09, 0
GLOBAL App009 := doApp09
IniRead, doApp10, %ConfigFile_B%, SWITCHES, DisableApp10, 0
GLOBAL App010 := doApp10


IniRead, AppDir01, %ConfigFile_B%, CONTAINERS, AppDirectory0x001, 0
GLOBAL App001_dir := AppDir01
IniRead, AppDir02, %ConfigFile_B%, CONTAINERS, AppDirectory0x002, 0
GLOBAL App002_dir := AppDir02
IniRead, AppDir03, %ConfigFile_B%, CONTAINERS, AppDirectory0x003, 0
GLOBAL App003_dir := AppDir03
IniRead, AppDir04, %ConfigFile_B%, CONTAINERS, AppDirectory0x004, 0
GLOBAL App004_dir := AppDir04
IniRead, AppDir05, %ConfigFile_B%, CONTAINERS, AppDirectory0x005, 0
GLOBAL App005_dir := AppDir05
IniRead, AppDir06, %ConfigFile_B%, CONTAINERS, AppDirectory0x006, 0
GLOBAL App006_dir := AppDir06
IniRead, AppDir07, %ConfigFile_B%, CONTAINERS, AppDirectory0x007, 0
GLOBAL App007_dir := AppDir07
IniRead, AppDir08, %ConfigFile_B%, CONTAINERS, AppDirectory0x008, 0
GLOBAL App008_dir := AppDir08
IniRead, AppDir09, %ConfigFile_B%, CONTAINERS, AppDirectory0x009, 0
GLOBAL App009_dir := AppDir09
IniRead, AppDir10, %ConfigFile_B%, CONTAINERS, AppDirectory0x010, 0
GLOBAL App010_dir := AppDir10

IniRead, AppExecute01, %ConfigFile_B%, EXECUTABLES, AppExe0x001, 0
GLOBAL App001_exe := AppExecute01
IniRead, AppExecute02, %ConfigFile_B%, EXECUTABLES, AppExe0x002, 0
GLOBAL App002_exe := AppExecute02
IniRead, AppExecute03, %ConfigFile_B%, EXECUTABLES, AppExe0x003, 0
GLOBAL App003_exe := AppExecute03
IniRead, AppExecute04, %ConfigFile_B%, EXECUTABLES, AppExe0x004, 0
GLOBAL App004_exe := AppExecute04
IniRead, AppExecute05, %ConfigFile_B%, EXECUTABLES, AppExe0x005, 0
GLOBAL App005_exe := AppExecute05
IniRead, AppExecute06, %ConfigFile_B%, EXECUTABLES, AppExe0x006, 0
GLOBAL App006_exe := AppExecute06
IniRead, AppExecute07, %ConfigFile_B%, EXECUTABLES, AppExe0x007, 0
GLOBAL App007_exe := AppExecute07
IniRead, AppExecute08, %ConfigFile_B%, EXECUTABLES, AppExe0x008, 0
GLOBAL App008_exe := AppExecute08
IniRead, AppExecute09, %ConfigFile_B%, EXECUTABLES, AppExe0x009, 0
GLOBAL App009_exe := AppExecute09
IniRead, AppExecute10, %ConfigFile_B%, EXECUTABLES, AppExe0x010, 0
GLOBAL App010_exe := AppExecute10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;   BEGIN MAIN AUTOEXEC LOGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
If(ElevatedRights="1")
{
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
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

If(App001="0")
{
    ; SetTimer, App1sub, 1000
    Run, %App001_dir%\%App001_exe%
}
If(App002="0")
{
    Run, %App002_dir%\%App002_exe%
}
If(App003="0")
{
    Run, %App003_dir%\%App003_exe%
}
If(App004="0")
{
    Run, %App004_dir%\%App004_exe%
}
If(App005="0")
{
    Run, %App005_dir%\%App005_exe%
}
If(App006="0")
{
    Run, %App006_dir%\%App006_exe%
}
If(App007="0")
{
    Run, %App007_dir%\%App007_exe%
}
If(App008="0")
{
    Run, %App008_dir%\%App008_exe%
}
If(App009="0")
{
    Run, %App009_dir%\%App009_exe%
}
If(App010="0")
{
    Run, %App010_dir%\%App010_exe%
}
Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;END OF MAIN AUTOEXEC LOGIC;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


App1sub:
Run, %App001_dir%\%App001_exe%
Return

App2sub:
Return

App3sub:
Return

App4sub:
Return

App5sub:
Return

App6sub:
Return

App7sub:
Return

App8sub:
Return

App9sub:
Return

App10sub:
Return




;;;;; SAMPLES
;;;;;
;;;;;
;;;;;
;;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;DEBUG ERROR MESSAGES COPY PASTE;;;;;;;;;;;;;;;;;;;;;;;;
If(DeveloperMode="1")
{
    If(DoErrorMessages="1")
    {
        MsgBox, , ERROR, ERROR TEXT, 13
    }
}

;;;;;;;;;;;;;;;;;;;;;DEBUG BREAKPOINT MESSAGES COPY PASTE;;;;;;;;;;;;;;;;;;;;;;
If(DeveloperMode="1")
{
    If(DoBreakpointMessages="1")
    {
        MsgBox, , ERROR, ERROR TEXT, 13
    }
}





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