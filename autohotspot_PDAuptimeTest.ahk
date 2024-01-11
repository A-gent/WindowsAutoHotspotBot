#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


IniRead, CurrentPDAuptime, autohotspot_handler.cfg, PDAnet, pdaUptime,
CurrPDAuptime := CurrentPDAuptime


Test:=StrSplit(CurrentPDAuptime, ":", "", -1)
ss:=StrSplit(CurrPDAuptime,":") ;Create an Array in "s" parsing on spaces


; StrSplit(CurrentPDAuptime, ":", ":", -1)

myVar:= ss.1 ;Access the first item in the Array
myVar2:= ss.2 ;Access the first item in the Array
myVar3:= ss.3 ;Access the first item in the Array


MsgBox, , Title, `n`n %CurrentPDAuptime% `n`n,

; MsgBox, , Title, `n`n%Test% `n%Test2% `n%Test3% `n`n`n`n,
; MsgBox, , Title, `n`n%Array1% `n%Array2% `n%Array3% `n`n`n`n,
; MsgBox, , Title, `n`n %CurrentPDAuptime[1]% `n %CurrentPDAuptime[2]% `n %CurrentPDAuptime[3]% `n`n`n`n,
MsgBox, , Title, `n`n %myVar% `n %myVar2% `n %myVar3% `n`n`n`n,