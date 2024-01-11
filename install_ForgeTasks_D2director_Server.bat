SET "DirectorDir=C:\Users\agent\Documents\Visual Studio 2013\Projects\dem_2.09_update\launchers\Director\Dota2"
SET "MyDirT=D:\_BAT"
SET BorGamin=C:\Program Files (x86)\Borderless Gaming\BorderlessGaming.exe
SET "ThisDir=%~dp0

:: schtasks /create /tn "DIRECTOR_Dota2" /tr "%MyDirT%\bnet_handle_call_suppress.lnk" /sc once /sd 01/01/1901 /st 00:00 /RU AGENT\Agent /RL HIGHEST

schtasks /create /tn "DIRECTOR_ProcessLassoNag2" /tr "%ThisDir%\HandleProcessLassoNag.exe" /sc once /sd 01/01/1901 /st 00:00 /RU jaredmain\jared & piers /RL HIGHEST
:: schtasks /create /tn "DIRECTOR_ProcessLassoNag" /tr "%ThisDir%\HandleProcessLassoNag.exe" /sc once /st 23:55 /RU BUILTIN\Administrators /RL Highest 


exit