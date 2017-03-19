REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config\port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom Ultimate as our main game with e1m8b mod and start automatically on that level
REM Besides Doom Ultimate, it can be run using Doom 1 Shareware
REM More info here: https://twitter.com/romero/status/688054778790834176
%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads\DOOMU.WAD -file wads\e1m8b.wad -warp 1 8
