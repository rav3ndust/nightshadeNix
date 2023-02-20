# nightshadeNix
My personal configuration file for my nixOS instances.

Also includes custom config files for other programs and some other scripts that I'm developing as I continue to further my obsession with Nix.

This repo ultimately will recreate my "__NightshadeNix__" setup on every machine it's deployed to. It's mostly here, of course, for my use on my machines first and foremost, but I welcome anyone who has cool ideas to suggest them in an [issue](https://github.com/rav3ndust/nixConfig/issues) or [pull request](https://github.com/rav3ndust/nixConfig/pulls)!

There are a few different environments I am building with the **nightshadeNix** configuration. 

Here are the main ones I use every single day, and they are setup to be easy to switch between in the session manager.

## nightshadeNix - GNOME

![image](https://user-images.githubusercontent.com/35274771/219997226-98b5ec17-179f-47b6-afb4-7d31ca02ea43.png)
###### A beautiful, comfortable, modern environment for every user.

GNOME is quite extensible, despite plenty in the GNU/Linux community saying otherwise. It's simple on Nix-based systems, as well, since you can easily install extensions of your choice by including packages from the `nixos.gnomeExtensions` family in your `configuration.nix` file.

Conversely, you could also install them the `nix-env` way. For example, if you wanted the *Burn My Windows* extension, you'd execute this command: 

`nix-env -iA nixos.gnomeExtensions.burn-my-windows`

**nightshadeNix** uses these GNOME extensions: 

- AppIndicator: [gnomeExtensions.appindicator](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.appindicator)
- ArcMenu: [gnomeExtensions.arcmenu](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=arcmenu)
- Blur My Shell: [gnomeExtensions.blur-my-shell](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.blur-my-shell)
- Burn My Windows: [gnomeExtensions.burn-my-windows](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.burn-my-windows)
- Dash to Dock: [gnomeExtensions.dash-to-dock](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=dash-to-dock)
- Dash to Panel: [gnomeExtensions.dash-to-panel](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=dash-to-panel)

## nightshadeNix - i3

![image](https://user-images.githubusercontent.com/35274771/220030006-b0999e0c-ded6-4def-9ed1-489c1d04707c.png)
###### An elegant, minimal tiling window manager for the power-user.

For those who would like a more minimal and automateed environment for their computing, there is **i3**! It automatically tiles your windows for you, so you don't have to worry about window management - just handling your work! 

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
