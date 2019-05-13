REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd .DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config/port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom 2 as our main game with NERVE mod and start automatically on that level
REM Parameter "+map" usage with NERVE.WAD: https://forum.zdoom.org/viewtopic.php?f=4&t=35840
%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOM2.WAD -file wads/NERVE.WAD +map LEVEL01 %SKILL_DEFAULT%
