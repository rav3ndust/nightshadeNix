/* nightshadeNix config
           - by rav3ndust
  packages we use and setups for:
    - cinnamon
    - gnome
    - i3 window manager */ 
#################################################################################
# Edit this configuration file to define what should be installed on            #
# your system.  Help is available in the configuration.nix(5) man page          #
# and in the NixOS manual (accessible by running ‘nixos-help’).                 #
#################################################################################
#                - - - DID YOU KNOW? - - -                                      #
#                                                                               #
# * When you're done editing this file, make sure to run:                       #
# `nixos-rebuild switch` to create a new generation with this file in effect!   #
#                                                                               #
# * You can also name generations before creating them. Use this command        #
# (as an example) when creating a new generation:                               #
#                                                                               #
#     `sudo NIXOS_LABEL="generation1-$(date)" nixos-rebuild switch`             #
##################################################################################
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-e11bee2c-3330-4e1c-ab01-1811686d5830".device = "/dev/disk/by-uuid/e11bee2c-3330-4e1c-ab01-1811686d5830";
  boot.initrd.luks.devices."luks-e11bee2c-3330-4e1c-ab01-1811686d5830".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nix-core"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";
  ##############################################################
  # Enable the KDE Plasma Desktop Environment.
  # Plasma and i3 can be selected from the SDDM login screen.
  # Uncomment the lines below to enable Plasma and SDDM.
  ##############################################################
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  ##############################################################
  # Enable the GNOME Desktop Environment.
  # GNOME and i3 can be selected from the GDM login screen.
  # Uncomment the lines below to enable GNOME and GDM.
  ##############################################################
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  ##############################################################
  # Enable the i3 window manager.
  services.xserver.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    extraPackages = with pkgs; [
    #######################################################
    /* A few config file notes: 
           - i3 config is at ~/.config/i3/config
           - polybar config is at ~/.config/polybar/config
           - dunst config is at ~/.config/dunst/dunstrc */
    #######################################################
      i3status 
      i3lock-fancy 
      rofi 
      dmenu 
      nitrogen 
      alacritty 
      conky
      dunst 
      xscreensaver 
      arandr
      #nm-applet
      volumeicon
      polybar
      flameshot
      xfce.thunar
      ];
  };
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rav3ndust = {
    isNormalUser = true;
    description = "Raven Blackfeather";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
      thunderbird
      chromium
      element-desktop
      brave
      tdesktop
      sublime4
      sublime-merge
      flameshot
      tor-browser-bundle-bin
      electrum
      gpa
      agenda
      obs-studio
      skypeforlinux
      google-chrome
      markets
      sunvox
      gnome.gnome-disk-utility
      ark
      transmission
      mpv
      wireshark
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  environment.systemPackages = with pkgs; [
     vim 
     wget
     zip
     unzip
     notify-desktop
     git
     cmus
     tor
     torsocks
     htop
     neofetch
     cmatrix
     firehol
     killall
     xorg.xkill
     firejail
     #########################################
     # GNOME extensions.                     #
     # Leave commented out when not in use.  #
     #########################################
     #gnomeExtensions.dash-to-dock           # dock outside of Activities view.
     #gnomeExtensions.dash-to-panel          # windows-style panel
     #gnomeExtensions.burn-my-windows        # aesthetics for windows opening/closing
     #gnomeExtensions.blur-my-shell          # GNOME Shell blurring
     #gnomeExtensions.appindicator           # AppIndicators on the GNOME panel
     #gnomeExtensions.arcmenu                # windows-style "start" menu for apps
     # include GNOME Tweak Tool.
     #gnome.gnome-tweaks                     # Tweak various GNOME Shell components.
     #########################################
     # Vim plugins.                          #
     # Used for language supports in vim.    #
     #########################################
     vimPlugins.vim-nix                     # support for Nix language
     vimPlugins.vim-solidity                # support for Solidity language
     vimPlugins.vim-elixir                  # support for Elixir language
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  #########################################
  # List services that you want to enable:
  # Uncomment services to enable them.
  #########################################
  # Enable Flatpak:
  # services.flatpak.enable = true;
  #########################################
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
