# DEVELOPMENT AND DOCUMENTATION STILL IN PROGRESS...





# DoomBroLauncher
A preconfigured launcher for Doom classic games, fully compatible with Xbox controllers for Windows PCs using GZDoom Source Port.

Our goal is to propose an organized way to execute Doom Classic games using GZDoom Source Engine. Taking advantage of its [command line parameters](https://zdoom.org/wiki/Command_line_parameters) we can set custom saves, screenshots and configuration paths in order to make it more portable and easy to update. Also, as part of a HTPC experience on Windows, we preconfigured a settings file to fully work with XInput devices, including Xbox 360, Xbox One controllers or other devices that simulate them.

First release is focused for Windows systems, a Linux version is planned for the future.

## Motivation
The original idea came when a friend asked me for a good source port to run his old Doom games, he needed something easy to execute, so I created this launcher for him using scripts to call GZDoom, a source port that provides a very good compatibility with games and mods and can enhance the graphics without compromising the original look and feel experience.

So I ended up with a set of batch scripts and folders in certain order so they can be portable and easy to execute. Each Doom game will be represented by their own batch script created based on a template, so the user just need to double click the batch of the game to launch it. Since GZDoom puts the saves, configurations and screenshots files on its root folder (in order to be portable), it can be a problem for people that cannot recognize these files when they try to update the GZDoom software, they can override configurations or delete saves if they are not careful. So to reduce that risk there are different folders: A folder for configurations, a folder for saves, a folder for screenshots and a folder for port binaries. The batch scripts knows the location of these folders thanks to some special [command line parameters](https://zdoom.org/wiki/Command_line_parameters). So, if you want to update GZDoom binaries, you just need to delete the contents of the `DoomBroLauncher/port` folder, and the and unzip the new ones on it.

I've been working with [Kodi and EmulationStation](https://github.com/BrosMakingSoftware/Kodi-Launches-EmulationStation-Addon) configuring my own HTPC Windows machine and I noticed that the batch-scripts approach of having one script for each game fits very nice with the way how EmulationStation lists and executes roms. Originally to execute Doom games from EmulationStation you need to configure it to filter wads and build an execution line where you call the source port with the wad as parameter, the confusion starts when the wad you want to run is actually a mod (PWAD) so you need a way to define its respective IWAD, which means definitely another way to run the games, so relying this responsibility to batch scripts is the most portable and easy to maintain idea. This is similar to the solution provided for [Retropie](https://github.com/retropie/retropie-setup/wiki/Doom) but less complex. Also since this works with EmulationStation, it was a good idea to preconfigure a settings file to work with XInput devices (Xbox controllers), so we can navigate in Kodi and EmulationStation and play Doom games with a controller from the couch.

This launcher was tested with Windows 10 and gzdoom version 2.3.2.

## What makes this launcher different than others of the same kind?
- Completely open source, hosted on [GitHub](https://github.com/BrosMakingSoftware/DoomBroLauncher) and published under GPL v3 license
- A preconfigured settings file is provided which enables Xbox controllers with an [intuitive layout](https://github.com/BrosMakingSoftware/DoomBroLauncher#xbox-360-and-xbox-one-key-bindings) and a display resolution of 1920x1080 (Full HD) in full screen, also including some tweaks on the [map display](https://github.com/BrosMakingSoftware/DoomBroLauncher#game-settings) (all of them detailed below in this documentation)
- The usage of Xbox controllers is optional, the game can still be played with keyboard and mouse
- Each Doom game is called by individual batch scripts that have a descriptive name and you don't need to enter additional prompts, just run the scripts by double clicking them or calling them from a command line
- Batch scripts are the native and fastest way to start a program and they are easy to maintain. Other launchers use another scripting languages which means you need an external runtime that not all users may have installed, or they use compiled executables which are harder to edit than a simple `.bat` file. At the end this is just a launcher, let's keep it simple
- New batch scripts with more Doom games or mods are [easy to add](https://github.com/BrosMakingSoftware/DoomBroLauncher#create-more-batch-scripts-to-run-new-doom-games-or-mods). They reuse common variables defined in a single file which means that any change is reflected on all scripts (for example addition of new parameters)
- Only open source code or programs are used by this project, including the source-port
- Easy to integrate with EmulationStation: Boxarts, metadata and [documentation](https://github.com/BrosMakingSoftware/DoomBroLauncher#integration-with-emulationstation) is provided below


## Usage
Use this launcher to start Doom Classic games and don't worry about complicated source ports configurations, just copy your games on the wads path and you are ready to play them by running the batch file with the name of your game.

**Notes:**  
This project is a launcher, so the installation of a source port is required (in this case GZDoom), installation instructions are easy and provided below. Games (or `.wad` files) are not provided here, you need to provide them. If you don't own the games, you can buy [Doom Classic Complete](http://store.steampowered.com/sub/18397) on Steam.


![Addon-Selected-Information.jpg](/script.kodi.launches.steam/resources/addon-screenshots/Addon-Selected-Information.jpg)


## Installation

#### Prerequisites
This release of the launcher is focused for Windows. You must know if your Windows system is 32 bits or 64 bits, to know that check instructions [here](https://support.microsoft.com/en-us/help/827218/how-to-determine-whether-a-computer-is-running-a-32-bit-version-or-64-bit-version-of-the-windows-operating-system), you will need this later.

#### Steps
1. Download the launcher:   
   To download the launcher files, go to https://github.com/BrosMakingSoftware/DoomBroLauncher/releases and download the latest zip file available.

2. Unzip the launcher:   
   Unzip the DoomBroLauncher zip to a folder on your system. You would see that the contents of this zip includes a folder called `Doom`, remember where this folder is since you will use it later. Inside this folder you will find a folder called `DoomBroLauncher` and a set of batch-scripts as in the following image:

   ![zip_content.png](/Resources/images/zip_content.png)

3. Download GZDoom:    
   To download GZDoom, go to https://zdoom.org/downloads and select the version that matches your Windows system (32 bits or 64 bits), this is important since the program will not start on the wrong system version.
   Open the zip file and copy its contents to the `Doom/DoomBroLauncher/port` folder

4. Now it's time to copy your Doom games:    
   Find your `.wad` files from your copies of Doom (depending of your game, it can be in one place or another), and copy them to the `Doom/DoomBroLauncher/wads` folder. If you have a version of [WadSmoosh](https://forum.zdoom.org/viewtopic.php?f=19&t=52757)'s `doom_complete.pk3`, you can put it on the same folder too. This pack is actually highly recommended to enjoy all the id Software releases at once including the Master Levels.

   The existing scripts will expect the following `.wad` names:
   <table style="width:100%">
    <tr>
      <th>Game / Mod</th>
      <th>`.wad` name</th>
    </tr>
    <tr>
      <td>Doom Complete (WadSmoosh pack)</td>
      <td>doom_complete.pk3</td>
    </tr>
    <tr>
      <td>Doom 1 - Shareware</td>
      <td>DOOM1.WAD</td>
    </tr>
    <tr>
      <td>Doom 1 - The Ultimate Doom</td>
      <td>DOOMU.WAD</td>
    </tr>
    <tr>
      <td>Doom 2 - Hell on Earth</td>
      <td>DOOM2.WAD</td>
    </tr>
    <tr>
      <td>Final Doom (1st Episode) - TNT Evilution</td>
      <td>TNT.WAD</td>
    </tr>
    <tr>
      <td>Final Doom (2nd Episode) - Plutonia Experiment</td>
      <td>PLUTONIA.WAD</td>
    </tr>
    <tr>
      <td>Mod for Doom 1 - Sewers (Xbox Level) [E3M1]</td>
      <td>SEWERS.WAD</td>
    </tr>
    <tr>
      <td>Mod for Doom 1 - Tech Gone Bad (John Romero) [E1M8]</td>
      <td>e1m8b.wad</td>
    </tr>
    <tr>
      <td>Mod for Doom 1 - The Lost Episode (5th Episode) [E5M1 to E5M9]</td>
      <td>lostepis.wad</td>
    </tr>
    <tr>
      <td>Mod for Doom 2 - Betray (Xbox Level) [MAP01]</td>
      <td>BETRAY.WAD</td>
    </tr>
    <tr>
      <td>Mod for Doom 2 - No Rest for the Living (XBLA 2nd Episode) [LEVEL01 to LEVEL09]</td>
      <td>NERVE.WAD</td>
    </tr>
  </table>

5. You are ready to go to the `Doom` folder to select and start the scripts that correspond to the games you copied from the previous step.


## Details of preconfigured settings

### Game Settings
- **Always Run** is enabled
- **Automap** &rarr; `Map Color Set` is set to _Traditional Doom_
- **Automap** &rarr; `Rotate Automap` is enabled
- **Automap** &rarr; `Enable Textured Display` is enabled
- **Automap** &rarr; `Show Item Counts` is enabled
- **Automap** &rarr; `Show Monster Counts` is enabled
- **Automap** &rarr; `Show Secrets Counts` is enabled
- **Screen Size** is set to max (`Ctrl -` or `Ctrl +` on keyboard can change this)
- **Display Resolution** is set to `1920x1080p` and full screen

### Controller Settings

Joystick usage is enabled for DirectInput, XInput and Raw-PlayStation-2-Adapter controllers.
The property used was `use_joystick=true`.
This will enable the already mentioned Input controllers and loads the default settings for XInputs, in this case joysticks and triggers moves and their deadzones.

#### Preconfigured controls bindings for XInput devices (Xbox 360 or Xbox One controllers)

**START** button on controller now brings the _Main Menu_ (the same menu displayed using **ESC** key on keyboard).
This binding for some reason is not visible at all on the _Customize Controls_ menu, so it needed to be written on the properties file directly.
The property used was `joy8=menu_main`. To exit the _Main Menu_ press `B` button.

**Right Trigger** is bind to `Attack/Fire`, it can be set on _Customize Controls_ menu, but the key name is not displayed on the list of keys. It should be displayed as `axis5minus`.
The property used was `axis5minus=+attack`.

#### Xbox 360 and Xbox One key bindings

##### Menu Controls
`START/MENU` Button &rarr; Main Menu <br/>

(`LS` = Left Stick, `D-Pad` = Directional Pad) <br/>
`LS / D-Pad Up` &rarr; Move Up <br/>
`LS / D-Pad Down` &rarr; Move Down <br/>
`LS / D-Pad Left` &rarr; Move Left <br/>
`LS / D-Pad Right` &rarr; Move Right <br/>

`A` button &rarr; Select or Enter <br/>
`B` button &rarr; Go Back or Cancel <br/>
`X` button &rarr; Delete <br/>

##### In Game Controls

(`LS` = Left Stick) <br/>
`LS Up` &rarr; Move Forward <br/>
`LS Down` &rarr; Move Backguards <br/>
`LS Left` &rarr; Left Strafing <br/>
`LS Right` &rarr; Right Strafing <br/>
`LS Button` &rarr; Turn 180 <br/>

(`RS` = Right Stick) <br/>
`RS Up` &rarr; Look Up <br/>
`RS Down` &rarr; Look Down <br/>
`RS Left` &rarr; Look Left <br/>
`RS Right` &rarr; Look Right <br/>
`RS Button` &rarr; Center Look <br/>

`A` Button &rarr; Use <br/>
`B` Button &rarr; Crouch <br/>
`X` Button &rarr; (Unbinded) <br/>
`Y` Button &rarr; Jump <br/>

(`LB` = Left Bumper, `LT` = Left Trigger, `RB` = Right Bumper, `RT` = Right Trigger) <br/>
`LB` &rarr; Previous Weapon <br/>
`LT` &rarr; (Unbinded) <br/>
`RB` &rarr; Next Weapon <br/>
`RT` &rarr; Fire/Attack <br/>

(`D-Pad` = Directional Pad) <br/>
`D-Pad Up` &rarr; Display Map <br/>
`D-Pad Down` &rarr; (Unbinded) <br/>
`D-Pad Left` &rarr; Previous Weapon <br/>
`D-Pad Right` &rarr; Next Weapon <br/>

`BACK/VIEW` Button &rarr; Take Screenshots <br/>
`START/MENU` Button &rarr; Main Menu <br/>
`XBOX/GUIDE` Button &rarr; (Unbinded: Cannot be binded)

## Optional Advanced Configuration

In this section we are going to explain how you can customize DoomBroLauncher based on your needs.

### Create more batch-scripts to run new Doom games or mods

DoomBroLauncher provides batch-scripts to run some Doom games, but not all of them, we try to cover the official id Software releases for now.

We know that everyday a new Doom mod is released, so we wanted DoomBroLauncher to be open to customization to anyone that wants to run a mod that is not covered with the initial batch-scripts, so here are the steps to create a new batch-script for new mods.

#### Create a script for an IWAD (complete games)
As example, we are going to add a script for [The Ultimate Doom](http://doom.wikia.com/wiki/The_Ultimate_Doom):
1. Copy your IWAD file into `Doom/DoomBroLauncher/wads` folder, for example `DOOMU.WAD`

2. Navigate to `Doom/DoomBroLauncher/config` folder

3. Copy the file called `IWAD-Template.bat` and paste it in `Doom` folder

4. Rename the bat file using a descriptive name, for example `Doom 1 (The Ultimate Doom).bat`, do not remove its `.bat` extension

5. Open the bat file with any text editor

6. Check its last line and notice the name `YOUR-IWAD.WAD`, you need to replace that with the actual name of your IWAD, for example `DOOMU.WAD`

7. Save the bat file and you are ready to run your game

The final result should look like this:

#### Create a script for a PWAD (a mod for a game)
As example, we are going to add a script for [The Lost Episode, "Evil Unleashed"](http://doom.wikia.com/wiki/Doom:_The_Lost_Episode):
1. Copy your PWAD file into `Doom/DoomBroLauncher/wads` folder, for example `lostepis.wad`

2. Navigate to `Doom/DoomBroLauncher/config` folder

3. Copy the file called `PWAD-Template.bat` and paste it in `Doom` folder

4. Rename the bat file using a descriptive name, for example `The Lost Episode (Evil Unleashed).bat`, do not remove its `.bat` extension

5. Open the bat file with any text editor

6. Check its last line and notice the name `YOUR-IWAD.WAD`, you need to replace that with the actual name of the IWAD needed by the mod, in this case `DOOMU.WAD` and the name `YOUR-PWAD.WAD` needs to be replaced by the name of the mod, in this case `lostepis.wad`

7. Save the bat file and you are ready to run your game

The final result should look like this:

### Integration with EmulationStation

This guide is for people which is familiar with EmulationStation configuration, for more details about it, check http://emulationstation.org/gettingstarted.html#config
For this guide, I'm going to use my personal Windows HTPC configuration with its original paths, you don't need to use the same paths or names, they are used here as an example.

The first thing to do, is to define a path where the Doom games would be stored, for this case I'm going to store them on `C:\Console\Emulation\roms\pc`, next to my other roms folders.
You can put Doom either on `pc` or `port` folders, but personally I prefer them on `pc` since EmulationStation lists the game using the MS-DOS themes. On this folder you will need to install DoomBroLauncher, follow the installation steps specified at the beginning of this document.

Once DoomBroLauncher is installed, as well as your Doom wads, you need to add the _PC_ system on your EmulationStation settings, for that go to your `.emulationstation` folder and open the file called `es_systems.cfg` and add the following code at the end of the file, but before the closure of the `</systemList>` element:

```XML
<system>
  <name>pc</name>
  <fullname>PC</fullname>
  <path>C:\Console\Emulation\roms\pc</path>
  <extension>.bat</extension>
  <command>%ROM%</command>
  <platform>pc</platform>
  <theme>pc</theme>
</system>
```
This code basically tells EmulationStation to go the PC path, scan and display the `.bat` files, and when you select one, it would be executed as a command on console, most of the time you will see commands to call for example RetroArch or other emulators, but in this case we are delegating this logic to the DoomBroLauncher scripts, so we just want it to be executed.

At this point you are able to play your Doom games, but there is one detail that EmulationStation can't handle, and it is the scrape of images and metadata for each game, the checksum of the rom (in this case the `.bat` files) will not help to find the game on the DB, but the DB doesn't actually have good information about these games, at least for their PC version, and some information is wrong like the dates. So as part of DoomBroLauncher we are adding the metadata and pictures needed to display your Doom games the best way possible.

Once again go to your `.emulationstation` folder, enter to the folders `gamelists\pc` (if this folder doesn't exist, create it), and open the file `gamelist.xml`
