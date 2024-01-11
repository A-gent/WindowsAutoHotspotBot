#NoEnv

;;;;https://www.autohotkey.com/boards/viewtopic.php?t=87367

Gui , Timer : Show , w165 h140 , Timer
;Gui , Timer : Show , w265 h230 , Timer
Gui , Timer:+AlwaysOnTop +ToolWindow 

Gui , Timer:Font , s10 , Trebuchet MS
Gui , Timer:Add , Edit , x0 y16 w55 h20 center ve3
Gui , Timer:Add , UpDown , x0 y16 w55 h20 -VScroll , 0
Gui , Timer:Add , Edit ,  x55 y16 w55 h20 center ve2
Gui , Timer:Add , UpDown , x55 y16 w55 h20 -VScroll , 0
Gui , Timer:Add , Edit ,  x110 y16 w55 h20 center ve1
Gui , Timer:Add , UpDown , x110 y16 w55 h20 -VScroll , 10

Gui , Timer:add, text , vTStart x1 y120 w58 ,             
Gui, Timer:Add, DropDownList, vtimer_options Choose1 altsubmit x60 y110 w110 gset_option_func, no option|open file|system beep|message box|hybernate/sleep|shutdown

Gui , Timer:Add , Button , gstart x0 y41 w80 h22 center , Re/Start
Gui , Timer:Add , Button , gresume x80 y41 w85 h22 center , P/Resume
Gui , Timer:add , Text , x0 y0 w40 center , Hrs
Gui , Timer:add , Text , x55 y0 w40 center , Min
Gui , Timer:add , Text , x110 y0 w40 center , Sec

Gui , Timer:Font , s26 cBlue , Segoe UI
Gui , Timer:add , text , x0 y62 w169 h38 center vdispt , C/D Timer
return

start:
   Pause , 0
   Gui , Submit , NoHide
   
   Gui , Timer:Font , s26 cBlue , Segoe UI
   GuiControl , Timer:Font , dispt
 If e3 is not number
	e3:=0
 If e2 is not number
	e2:=0
 If e1 is not number
	e1:=0
   secsLeft :=  e3*3600+e2*60+e1
   seconds := Format("{:02}" , floor(mod(secsLeft , 60)))	
   minutes := Format("{:02}" , mod(floor(secsLeft/60) , 60))
   hours  :=  floor(secsLeft/3600)
   
   hur := Format("{:02}" , floor(abs(secsleft)/3600))
   min := Format("{:02}" , floor(mod(abs(secsLeft/60),60)))
   sec := Format("{:02}" , floor(mod(abs(secsLeft), 60)))
   
   GuiControl , Timer:text , dispt , %hur%:%min%:%sec% 
   
   FormatTime , TimeString, , HH:mm:ss
   GuiControl , Timer:text , TStart , %TimeString%
   SetTimer , CDTimer , 1000
return

resume:
   Pause , Toggle , 1
   GuiControl , , e3 , %hours%
   GuiControl , , e2 , %minutes%
   GuiControl , , e1 , %seconds%
   GuiControl , , dispt , %hur%:%min%:%sec%
return

CDTimer:
;   Gui , Submit , NoHide
   secsLeft--
   hur := Format("{:02}" , floor(abs(secsleft)/3600))
   min := Format("{:02}" , floor(mod(abs(secsLeft/60),60)))
   sec := Format("{:02}" , floor(mod(abs(secsLeft), 60)))
   GuiControl , Timer:text , dispt, %hur%:%min%:%sec%
   IfEqual , secsLeft , 0
   {
      Gui , Timer:Font , s26 cRed ; Segoe UI
      GuiControl , Timer:Font , dispt  
      goto  opb%timer_options%
      return
   }
   Else	
      Return
   
set_option_func:
   Gui , Submit , NoHide
   goto  opa%timer_options%
opa1:
opb1:
return

opa2:
	FileSelectFile, SelectedFile, 3, , Open a file, Open After Countdown (*.*)
return
opb2:
	run, %SelectedFile%
return
   
opb3:
	 SoundBeep, 360, 3800
opa3:
return

opb4:
   msgbox , 262144 , Timer, Time's Up !
opa4:
return

opb5:
   run, rundll32.exe powrprof.dll`,SetSuspendState Sleep
opa5:
return

opb6:
   run, shutdown.exe /s
opa6:
return

TimerGuiClose:
ExitApp
