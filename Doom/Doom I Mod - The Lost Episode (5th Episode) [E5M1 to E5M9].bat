REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config\port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom Ultimate with the lostepis mod, find it as the 5th episode "The Evil Unleashed"
REM More info here: https://www.doomworld.com/idgames/levels/doom/Ports/j-l/lostepis
%PORT_EXECUTABLE% %GZDOOM_PARAMETERS% -iwad wads\DOOMU.WAD -file wads\lostepis.wad -warp 5 1
