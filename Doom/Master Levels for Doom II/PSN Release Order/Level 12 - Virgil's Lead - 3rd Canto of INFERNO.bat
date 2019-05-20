REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd ../../.DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config/port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM Master Levels for Doom II
REM Map: MAP03
REM Title: Virgil's Lead: 3rd Canto of INFERNO
%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOM2.WAD -file wads/master_levels/VIRGIL.WAD +map MAP03 %SKILL_DEFAULT%
