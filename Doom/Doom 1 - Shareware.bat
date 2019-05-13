REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd .DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config/port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom 1 Shareware as our main game
REM More info here https://doomworld.com/pageofdoom/shareware.html
%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOM1.WAD
