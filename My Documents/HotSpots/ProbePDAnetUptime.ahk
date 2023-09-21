#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
DetectHiddenText, On
DetectHiddenWindows, On


GLOBAL FolderTitleRoot := "HotSpots"
GLOBAL ConfigFileTitle := "autohotspot_handler.cfg" ;; remove the X on the end!
GLOBAL HotspotActivityLog := "hotspot_state.log"


config_path := A_MyDocuments . "\" . FolderTitleRoot . "\" . ConfigFileTitle
create_config_path := A_MyDocuments . "\" . FolderTitleRoot





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
GroupAdd, PdaNetPCexe, #32768 ; Add only Internet Explorer windows to this group.
PDAhWid := WinExist("ahk_exe PdaNetPC.exe")

	IniWrite, %PDAhWid%, %config_path%, PDAnet, pdaHWnd

IniRead, PDAhWnd_facade, %config_path%, PDAnet, PDAhWnd, data_unwritable
GLOBAL PDAhWnd := PDAhWnd_facade
Sleep 1000
;;;;------------------Start Function Logic for Uptime Checker----------------BEGIN FUNCTION SEA BELOW-----------


clipboard := ""   ; Empty the clipboard.
Sleep, 1000
start := hwndCreationTime(PDAhWnd)
; start := hwndCreationTime("0Xb907e2")
; start := hwndCreationTime(PDAhWnd_facade)
; start := hwndCreationTime("0Xb907e2")
; start := hwndCreationTime(A_ScriptHwnd)

end := GetSystemTimeAsFileTime()

; MsgBox % "Process has ran for: " (end - start) // 10 // 1000 " ms" ; timestamp is in 100-nanosec intervals
; clipboard:="Process has ran for: " (end - start) // 10 // 1000 " ms" ; timestamp is in 100-nanosec intervals
clipboard:="" (end - start) // 10 // 1000 "" ; timestamp is in 100-nanosec intervals
; ClipSaved := ClipboardAll
MsgBox,, Title, %clipboard%,
IniWrite, %Clipboard%, %config_path%, PDAnet, pdaUptimeMS
; IniWrite, %ClipSaved%, %config_path%, PDAnet, pdaUptimeMS
IniRead, CurrentPDAUptimeMiS, %config_path%, PDAnet, pdaUptimeMS
GLOBAL CurrentPDAUptimeMS := CurrentPDAUptimeMiS
Sleep, 3500
clipboard := ""   ; Empty the clipboard.

; res := milli2hms(%CurrentPDAUptimeMS%, h, m, s)
res := TimeFormatHMS(CurrentPDAUptimeMS)
; TimeResReturn := TimeFormatHMS(CurrentPDAUptimeMS)
IniWrite, %res%, %config_path%, PDAnet, pdaUptime
IniRead, pdaProcessUptime, %config_path%, PDAnet, pdaUptime,

MsgBox,, PDAnet Process Uptime, Value: %pdaProcessUptime%,
; Return


hwndCreationTime(hwnd) {
	processId := GetWindowThreadProcessId(hwnd)

	try
	{
		hProcess := OpenProcess(processId)
		hwndCreationTime := GetCreationTime(hProcess)
		CloseHandle(hProcess)
	}
	catch e
		showError(e)

	return hwndCreationTime
}

GetWindowThreadProcessId(hwnd) {
	VarSetCapacity(PROCESS_ID, 4, 0)
	DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "Ptr", &PROCESS_ID)

	return NumGet(PROCESS_ID, "UInt")
}

OpenProcess(processId) {
	static PROCESS_QUERY_LIMITED_INFORMATION := 0x1000

	if !(hProcess := DllCall("OpenProcess", "UInt", PROCESS_QUERY_LIMITED_INFORMATION, "Int", False, "UInt", processId))
		error("OpenProcess")

	return hProcess
}

GetCreationTime(hProcess) {
	VarSetCapacity(CREATION_TIME, 8, 0)
	VarSetCapacity(IGNORE_ME, 8, 0)

	if !DllCall("GetProcessTimes", "Ptr", hProcess, "Ptr", &CREATION_TIME, "Ptr", &IGNORE_ME, "Ptr", &IGNORE_ME, "Ptr", &IGNORE_ME)
		error("GetProcessTimes")

	return FileTimeQuadPart(CREATION_TIME)
}

FileTimeQuadPart(ByRef FILETIME) {
	dwLowDateTime := NumGet(FILETIME, 0, "UInt")
	dwHighDateTime := NumGet(FILETIME, 4, "UInt")

	VarSetCapacity(ULARGE_INTEGER, 8, 0)
	NumPut(dwLowDateTime, ULARGE_INTEGER, 0, "UInt")
	NumPut(dwHighDateTime, ULARGE_INTEGER, 4, "UInt")

	return NumGet(ULARGE_INTEGER, 0, "UInt64")
}

CloseHandle(hProcess) {
	if !DllCall("CloseHandle", "Ptr", hProcess)
		error("CloseHandle")
}

GetSystemTimeAsFileTime() {
	VarSetCapacity(SYSTEM_FILETIME, 8, 0)
	DllCall("GetSystemTimeAsFileTime", "Ptr", &SYSTEM_FILETIME)

	return FileTimeQuadPart(SYSTEM_FILETIME)
}

error(msg) {
	throw Exception(Format("DllCall(""{}"") failed.`nA_LastError: {}", msg, A_LastError), -2)
}

showError(e) {
	MsgBox % Format("
	(LTrim
		Exception on line {}.

		{}
	)", e.Line, e.Message)

	; Exit ; thread
	ExitApp ; delete this
}





; milli2hms(milli, ByRef hours=0, ByRef mins=0, ByRef secs=0, secPercision=0)
; {
;   SetFormat, FLOAT, 0.%secPercision%
;   milli /= 1000.0
;   secs := mod(milli, 60)
;   SetFormat, FLOAT, 0.0
;   milli //= 60
;   mins := mod(milli, 60)
;   hours := milli //60
;   return hours . ":" . mins . ":" . secs
; }


TimeFormatHMS(milli, secPercision=0)
{
SetFormat, FLOAT, 0.%secPercision%
milli /= 1000.0
secs := mod(milli, 60)
SetFormat, FLOAT, 0.0
milli //= 60
mins := mod(milli, 60)
hours := milli //60
return hours . ":" . mins . ":" . secs
}