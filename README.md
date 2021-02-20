# T0PCAKE : Extension for the Roblox SS Executor T0PK3K

T0PCAKE is an extension for T0PK3K meant to add new features to the executor.

### What is this repository for ?

This repository only contains the unobfuscated code used in T0PCAKE. For the assets required to make your own version of T0PCAKE, you should either download the MainModule from https://www.roblox.com/library/5844085889/TOPCAKE or look in Releases. 

## Features added by T0PCAKE

### Extended Script List

The Script List is the core of T0PCAKE.

### CAKEPlayer

CAKEPlayer (previously Wowamp as visible in the code) is a very complete Music Player. It is capable of controlling musics from the Roblox Library, allows playing them either client-side or server-side for everyone to hear, it includes a easy-to-use playlist system and buttons for some extra fun effects. Upon startup, you'll be presented with the choice of loading the default CAKEPlayer Playlist, the default T0PK3K Playlist, your own playlist, or no playlist.

### T0PK3K Patches

T0PCAKE also fixes some glitches introduced in recent versions of T0PK3K, such as the wrongly arranged tabs and the miscolored T. Future versions of T0PCAKE will also replace the deprecated Rerubi T0PK3K is using for script execution with FiOne, its better successor.

### CakeAway (HTTP-Enabled Servers only) _(Source code partially unavailable)_

CakeAway allows for remote execution through the CakeAway Discord Bot. For security reasons, this bot is only available in the T0PCAKE Discord server.

### Discord Sender (HTTP-Enabled Servers only) _(Source code unavailable)_

This function allows you to easily send Bug Reports, Suggestions and Script Requests through the power of Discord WebHooks to the T0PCAKE Discord server.

### CakeShare (HTTP-Enabled Servers only) _(Source code unavailable)_

Who eats cake alone ? Seriously.
Anyways, this module allows you to share your current Roblox server with other T0PCAKE users, making your T0PCAKE experience more enjoyable. Only one press of a button, and any whitelisted member of the T0PCAKE Discord is easily able to join you.

### R6 Button

This feature is exactly what it says it is. An easy-to-access button to turn your character into R6, allowing you to use a larger library of scripts.
The feature already exists in T0PK3K, but it is harder to access and clunkier to use.

## How do I run T0PCAKE ?

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
