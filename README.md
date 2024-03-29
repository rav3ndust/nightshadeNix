# nightshadeNix
"Nightshade" configuration files and scripts for my nixOS instances.

Also includes custom config files for other programs and some other scripts that I'm developing as I continue to further my obsession with Nix.

This repo ultimately will recreate my "__NightshadeNix__" setup on every machine it's deployed to. It's mostly here, of course, for my use on my machines first and foremost, but I welcome anyone who has cool ideas to suggest them in an [issue](https://github.com/rav3ndust/nixConfig/issues) or [pull request](https://github.com/rav3ndust/nixConfig/pulls)!

There are a few different environments I am building with the **nightshadeNix** configuration. 

Here are the main ones I use every single day, and they are setup to be easy to switch between in the session manager.

## nightshadeNix - Cinnamon

![image](https://user-images.githubusercontent.com/35274771/220191163-4a258c93-9c4c-4ead-a624-d4ab275dd3b9.png)
###### A traditional and beautiful workflow that you already know how to use.

Cinnamon has always been one of, if not my favorite, full desktop environment. It is beautiful, it is modern, it is feature-rich, and it gives you the power to make your desktop your own, while remaining simple and elegant. 

Theme it up to your heart's content with tons of bells and whistles and further aesthetic goodies, or leave it as-is and get to work. However you choose to use it, Cinnamon is meant to adapt to you, not the other way around. Due to its traditional workflow, it also has a minimal amount to learn about - you already know how to use it.

## nightshadeNix - GNOME

![image](https://github.com/rav3ndust/nightshadeNix/assets/35274771/e545f590-fe31-4093-9321-1de0689fca5c)
###### A beautiful, comfortable, modern environment for every user.

GNOME is quite extensible. It's simple on Nix-based systems, as well, since you can easily install extensions of your choice by including packages from the `nixos.gnomeExtensions` family in your `configuration.nix` file.

Conversely, you could also install them the `nix-env` way. For example, if you wanted the *Burn My Windows* extension, you'd execute this command: 

`nix-env -iA nixos.gnomeExtensions.burn-my-windows`

**nightshadeNix** uses these GNOME extensions: 

- AppIndicator: *For displaying background application icons in the systray. Applications such as Steam, Element, and Telegram make use of systray icons.* [gnomeExtensions.appindicator](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.appindicator)
- Blur My Shell: *Provides a customisable blurring effect in your top bar and in the Activities Overview.* [gnomeExtensions.blur-my-shell](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.blur-my-shell)
- Burn My Windows: *Fun aesthetic effects and animations when windows are opened and closed.* [gnomeExtensions.burn-my-windows](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.burn-my-windows)
- Dash to Dock: *Brings your Dock in from the Activities Overview. You can set it to autohide when windows overlap with it, or even set it in panel mode.* [gnomeExtensions.dash-to-dock](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=dash-to-dock)
- Desktop Cube: *Fun and useless 3D animations to bring back the good old days.* [gnomeExtensions.desktop-cube](https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=desktop-cube)
- Tiling Assistant: *Adds quarter-tiling to GNOME, and assists in snapping other windows into place.* [gnomeExtensions.tiling-assistant](https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=tiling-assistant)
- Weather o'Clock: *Adds the current temperature of a selected locale beside your clock in the topbar.* [gnomeExtensions.weather-oclock](https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=weather-oclock)
  
## nightshadeNix - i3

![image](https://user-images.githubusercontent.com/35274771/220030006-b0999e0c-ded6-4def-9ed1-489c1d04707c.png)
###### An elegant, minimal tiling window manager for the power-user.

For those who would like a more minimal and automated environment for their computing, there is **i3**! It automatically tiles your windows for you, so you don't have to worry about window management - just handling your work! 

It runs smooth and stable, and uses very little of your precious system resources. It looks sharp and it's packed with some of these features:

- Custom status bar with clickable events and appindicator support, using **polybar**.
- Screenshot handling using **flameshot**.
- GUI networking with **nm-applet**.
- Adjust your volume with **volumeicon**, regardless of your audio server.
- Adjust your wallpaper easily with **nitrogen**.
- Handle your display arrangement with **arandr** for multiple-display setups.
- We use **xscreensaver** for screensaving and autolocking.
- A stylized **dunst** for handling notifications.
- **Alacritty** set as the default terminal.
