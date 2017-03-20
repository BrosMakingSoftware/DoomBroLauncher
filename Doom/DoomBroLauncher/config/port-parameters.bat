REM Setting common parameters for gzdoom
SET PORT_EXECUTABLE=port\gzdoom.exe
SET PORT_PARAMETERS=-config config\gzdoom-controller-fullscreen.ini -savedir saves -shotdir screenshots

REM Skill 2 is the normal level, or "Hurt Me Plenty" in Doom
REM Value is based on https://zdoom.org/wiki/GameSkill
SET SKILL_DEFAULT=-skill 2
