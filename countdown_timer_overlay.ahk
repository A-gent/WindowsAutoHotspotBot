;On-screen display (OSD)

CustomColor = 99AA55  ; Can be any RGB color (it will be made transparent below).

Gui +LastFound +AlwaysOnTop +Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.

Gui, Color, %CustomColor%

Gui, Font, s32  ; Set a large font size (32-point).

;~ Gui, Add, Text, vMyText cBlue, -00:00:00 ; XX & YY serve to auto-size the window.

Gui, Add, Text, w300 vMyTime cBlue, -00:00:00 ; XX & YY serve to auto-size the window.

WinSet, TransColor, %CustomColor% 150 ; Make all pixels of this color transparent and make the text itself translucent (150):


Inputbox, vCountdown, CountDown time, Please enter the time in Minutes ; inputbox to specify the amount of time to countdown

gosub, CountDownTime 

SetTimer, UpdateOSD, 200 ; Causes a subroutine to be launched automatically and repeatedly at a specified time interval.

Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.

Gui, Show, x0 y80 NoActivate, Timer ; NoActivate avoids deactivating the currently active window.



Return  ; // End of Auto-Execute Section





CountDownTime:		; to add the countdown time to A_Now 
arrivo = 		; set arrivo to A_Now
arrivo += %vCountdown%, minutes	; add the user inputted countdown time
return

UpdateOSD:

mysec := arrivo                 

EnvSub, mysec, %A_Now%, seconds

;~ GuiControl,, MyText, %A_Hour%:%A_Min%:%A_Sec%
GuiControl,, MyTime, % FormatSeconds( MySec )

Return 


FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{

    time = 19000101  ; *Midnight* of an arbitrary date.

    time += %NumberOfSeconds%, seconds

    FormatTime, mmss, %time%, mm:ss

    hours := NumberOfSeconds // 3600 ; This method is used to support more than 24 hours worth of sections.

    hours := hours < 10 ? "0" . hours : hours

    return hours ":" mmss  
}


esc::
GuiClose:
Exitapp

