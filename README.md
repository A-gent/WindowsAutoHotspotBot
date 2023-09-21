# WindowsAutoHotspotBot
AHK-based front-end handler for powershell backend enforcement of an Automated Windows Hotspot Projection (will force the Hotspot to engage if at all possible for it to be engaged (if you are connected to the internet))


INSTALL:

1.) Copy the HotSpots folder to your local documents folder.

2.) Copy the "start_hotspot.ps1", "start_hotspot_verify.ps1", and "AutoHotspotHandler.exe" (unless you want to compile a fresh one using 'autohotspot_handler.ahk'. If you're compiling a fresh exe, make sure to have the modules folder in the same directory as the script file before you compile, and edit the FileInstall line at the start of the script.) files to your root C:\ drive.

3.) Run "AutoHotspotHandler.exe" and after a short delay, it will turn on your Windows Hotspot and as long as the handler continues to run, it will ensure that the Windows Hotspot stays on.
