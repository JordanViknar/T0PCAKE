# T0PCAKE : Extension for the Roblox SS Executor T0PK3K v5.0

T0PCAKE is an extension for T0PK3K meant to add new features to the executor, for an improved experience. And also quality of life, since liam is barely updating 5.0 anymore.

### What does this repository have ?

**This repository only contains the unobfuscated code used in T0PCAKE. For the assets required to make your own version of T0PCAKE, you should either download the MainModule from https://www.roblox.com/library/5844085889/TOPCAKE or look in Releases.**

## Features added by T0PCAKE

### Extended Script List

The Script List is the core of T0PCAKE. It contains a list of easily and quickly executable scripts and utilities. Many of those scripts are from myself, but there are also others included, such as PTG.

### CAKEPlayer

CAKEPlayer (previously Wowamp as visible in the code) is a very complete Music Player. It is capable of controlling musics from the Roblox Library, allows playing them either client-side or server-side for everyone to hear, it includes an easy-to-use playlist system and buttons for some extra fun effects.

Upon startup, you'll be presented with the choice of loading the default CAKEPlayer Playlist, the default T0PK3K Playlist, your own playlist, or no playlist.

### T0PK3K Patches

T0PCAKE also fixes some glitches introduced in recent versions of T0PK3K, such as the wrongly arranged tabs and the miscolored T. Future versions of T0PCAKE will also replace the deprecated Rerubi (T0PK3K is currently using it for script execution) with FiOne, its better successor.

### CakeAway (HTTP-Enabled Servers only) _(Source code partially unavailable)_

CakeAway allows for remote execution through the CakeAway Discord Bot.

Once this feature is ran on a compatible server, the CakeAway server will respond to the request and send back an ID to the CakeAway Launcher script, who is then supposed to inform the users about the ID through their compatible GUIs.

As such, an ID here defines a specific number attributed to a CakeAway connected server, and these range from 100 to 999 (always a 3 digit number).
This bot is only available in the T0PCAKE Discord server.

#### Available remote commands :
- ca:playerlist ID _(Gives a list of a server's currently connected players.)_
- ca:script ID SCRIPT _(Runs the inserted script on the selected server.)_
- ca:shutdown ID _(Shuts down the selected server.)_
- ca:music ID MUSICID _(Plays the music with MUSICID on the selected server. Doesn't loop.)_
- ca:kill ID USERNAME
- ca:respawn ID USERNAME
- ca:kick ID USERNAME

### Discord Sender (HTTP-Enabled Servers only) _(Source code unavailable)_

This function allows you to easily send Bug Reports, Suggestions and Script Requests through the power of Discord WebHooks to the T0PCAKE Discord server. 

Useful if you don't want to join the Discord, you're too lazy to send it there, or you easily forget stuff.

### CakeShare (HTTP-Enabled Servers only) _(Source code unavailable)_

This module allows you to share your current Roblox server with other T0PCAKE users, making your T0PCAKE experience more _(or less)_ enjoyable. 

Only one press of a button, and any whitelisted member of the T0PCAKE Discord is easily able to join you.

### R6 Button

This feature is exactly what it says it is. An easy-to-access button to turn your character into R6, allowing you to use a larger library of scripts.

The feature already exists in T0PK3K, but it is harder to access and clunkier to use.

## How do I (easily) run T0PCAKE ?

You'll need to have a Roblox account that is whitelisted in T0PK3K in your possession.

To use T0PCAKE, you'll have to open a T0PK3K session, and run the T0PCAKE require using the username of your whitelisted account. Enjoy !

**T0PCAKE require :**
```lua
require(5844085889)("USERNAME")
```
**T0PCAKE require with extra parameters :** _(Optional)_
```lua
require(5844085889)("USERNAME",true,true,ID,false,true) --T0PCAKE (USERNAME,ThemeSyncingEnabled,CAKEPlayerEnabled,PlaylistID,DoScrollbars,DoT0PK3KFixes)
```

_T0PCAKE is not meant to be ran on cracked T0PK3K sessions. If you are using an illegitimate copy of T0PK3K, do NOT report bugs or glitches. They WILL be ignored._
