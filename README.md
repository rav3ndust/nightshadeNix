# nixConfig
My personal configuration file for my nixOS instances.

## The Setup

There are a few different setups with the **nightshadeNix** configuration. 

Here are the main ones I use every single day.

### nightshadeNix - GNOME

![image](https://user-images.githubusercontent.com/35274771/219997226-98b5ec17-179f-47b6-afb4-7d31ca02ea43.png)

GNOME is quite extensible, despite plenty in the GNU/Linux community saying otherwise. It's simple on Nix-based systems, as well, since you can easily install extensions of your choice by including packages from the `nixos.gnomeExtensions` family.

**nightshadeNix** uses these GNOME extensions: 

- AppIndicator: [gnomeExtensions.appindicator](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.appindicator)
- ArcMenu: [gnomeExtensions.arcmenu](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=arcmenu)
- Blur My Shell: [gnomeExtensions.blur-my-shell](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.blur-my-shell)
- Burn My Windows: [gnomeExtensions.burn-my-windows](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=gnomeExtensions.burn-my-windows)
- Dash to Dock: [gnomeExtensions.dash-to-dock](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=dash-to-dock)
- Dash to Panel: [gnomeExtensions.dash-to-panel](https://search.nixos.org/packages?channel=22.11&from=0&size=50&sort=relevance&type=packages&query=dash-to-panel)
