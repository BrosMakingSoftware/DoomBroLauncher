use_joystick=true
joy8=menu_main



Controller Settings

Joystick usage is enabled for DirectInput, XInput and Raw-PlayStation-2-Adapter controllers.
The property used was use_joystick=true
This will enable the already mentioned Input controllers and loads the default settings for XInputs, in this case joysticks and triggers moves and their deadzones.

Preconfigured controls bindings for XInput devices (Xbox 360/One controller)

START button on controller now brings the Main Menu (the same menu displayed using ESC key on keyboard).
This binding for some reason is not visible at all on the Customize Controls menu, so it needs to be written on the properties file directly.
The property used was joy8=menu_main. To exit the Main Menu press B button.

Right Trigger is bind to Attack/Fire, it can be set on Customize Controls menu, but the key name is not displayed on the list of keys. It should be displayed as axis5minus.
The property used was axis5minus=+attack

Xbox 360/One key bindings

Menu Controls
START/MENU Button -> Main Menu

(LS = Left Stick, D-Pad = Directional Pad)
LS/D-Pad Up -> Move Up
LS/D-Pad Down -> Move Down
LS/D-Pad Left -> Move Left
LS/D-Pad Right -> Move Right

A button -> Select or Enter
B button -> Go Back or Cancel
X button -> Delete

In Game Controls

(LS = Left Stick)
LS Up -> Move Forward
LS Down -> Move Backguards
LS Left -> Left Strafing
LS Right -> Right Strafing
LS Button -> Turn 180

(RS = Right Stick)
RS Up -> Look Up
RS Down -> Look Down
RS Left -> Look Left
RS Right -> Look Right
RS Button -> Center Look

A Button -> Use
B Button -> Crouch
X Button -> (Unbinded)
Y Button -> Jump

(LB = Left Bumper, LT = Left Trigger, RB = Right Bumper, RT = Right Trigger)
LB -> Previous Weapon
LT -> (Unbinded)
RB -> Next Weapon
RT -> Fire/Attack

(D-Pad = Directional Pad)
D-Pad Up -> Display Map
D-Pad Down -> (Unbinded)
D-Pad Left -> Previous Weapon
D-Pad Right -> Next Weapon

BACK/VIEW Button -> Take Screenshots
START/MENU -> Main Menu
XBOX Button -> (Unbinded: Cannot be binded)


Game Settings
Always Run is enabled

Automap -> "Map Color Set" is set to "Traditional Doom"
Automap -> "Rotate Automap" is enabled
Automap -> "Enable Textured Display" is enabled
Automap -> "Show Item Counts" is enabled
Automap -> "Show Monster Counts" is enabled
Automap -> "Show Secrets Counts" is enabled

Screen Size is set to max. You can still see the Doomguy's face on the Automap
Display Resolution is set to 1920x1080p and full screen

https://support.xbox.com/en-US/xbox-one/accessories/xbox-one-wireless-controller

http://pcgamingwiki.com/wiki/Doom_(2016)#Controller_presets

https://gzdoom.drdteam.org/


https://zdoom.org/wiki/Command_line_parameters





REM Moving our current location to the script's location
cd %~dp0
REM Now let's move to our working folder
cd DoomBroLauncher

REM Now on our working folder, we call the engine with our wads as parameters
REM We are calling Doom Complete as our main game
gzdoom\gzdoom.exe -config config\gzdoom-Console.ini -savedir saves -shotdir screenshots -iwad wads\doom_complete.pk3
