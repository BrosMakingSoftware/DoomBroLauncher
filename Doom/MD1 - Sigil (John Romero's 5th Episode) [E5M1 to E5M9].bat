@echo off
REM ---------- Script Template ----------
REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd .DoomBroLauncher
REM With this script we set the common parameters for the engine in a variable
call config/port-parameters.bat
REM ---------- End of Script Template ----------


REM Now on our working folder, we call the port with our wads and common parameters
REM We are calling Doom Ultimate as our main game with Sigil
REM Besides Doom Ultimate, it can be run using Doom I
REM More info here: https://www.romerogames.ie/si6il

REM Order of execution is:
REM 1. Purchased Sigil
REM 2. Purchased Compatible Sigil
REM 3. Free Sigil
REM 4. Free Compatible Sigil

IF EXIST "wads/SIGIL_SHREDS.wad" (
    echo "Found purchased version of Sigil (SIGIL_SHREDS.wad)"
    %PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOMU.WAD -file wads/SIGIL.wad wads/SIGIL_SHREDS.wad

) ELSE (

	IF EXIST "wads/SIGIL_SHREDS_COMPAT.wad" (
    echo "Found purchased compatible version of Sigil (SIGIL_SHREDS_COMPAT.wad)"
    %PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOMU.WAD -file wads/SIGIL_COMPAT.wad wads/SIGIL_SHREDS_COMPAT.wad

	) ELSE (
		IF EXIST "wads/SIGIL.wad" (
    	echo "Found free version of Sigil (SIGIL.wad)"
    	%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOMU.WAD -file wads/SIGIL.wad

		) ELSE (
			IF EXIST "wads/SIGIL_COMPAT.wad" (
	    	echo "Found free compatible version of Sigil (SIGIL_COMPAT.wad)"
	    	%PORT_EXECUTABLE% %PORT_PARAMETERS% -iwad wads/DOOMU.WAD -file wads/SIGIL_COMPAT.wad

			) ELSE (
				echo "None of the versions of Sigil were found."
				timeout 20
			)
		)
	)
)
