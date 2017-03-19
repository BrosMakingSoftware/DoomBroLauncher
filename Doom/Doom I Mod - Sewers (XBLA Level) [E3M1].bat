REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config\port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom Ultimate as our main game with SEWERS mod and start automatically on that level
REM More info here: http://classicdoom.com/xboxspec.htm
%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads\DOOMU.WAD -file wads\SEWERS.WAD -warp 3 1
