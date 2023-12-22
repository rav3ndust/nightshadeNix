# nightshadeNix config
#           - by rav3ndust
#  A customised setup with several different desktops: 
#        * cinnamon, GNOME, i3wm 
#####################################################################
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
#####################################################################
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
  ##############################################################
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.defaultSession = "cinnamon";
  ##############################################################
  # Enable the Cinnamon Desktop Environment.
  # Cinnamon and i3 can be selected from the login screen.
  # Uncomment the lines below to enable Cinnamon and lightdm.
  ##############################################################
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  ##############################################################
  # Enable the GNOME Desktop Environment.
  # GNOME and i3 can be selected from the GDM login screen.
  # Uncomment the lines below to enable GNOME and GDM.
  ##############################################################
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  ##############################################################
  # * * * * * * * * * * * * * * * * * * * * 
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
      conky
      dunst 
      xscreensaver 
      arandr
      #nm-applet
      blueman
      volumeicon
      polybar
      flameshot
      pasystray
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
      telegram-desktop
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
      alacritty
      gnome.gnome-weather
      gnome.gnome-disk-utility
      cinnamon.warpinator
      ark
      transmission
      wireshark
      rhythmbox
      xed-editor
      # Games
      openarena
      steam
      minetest
      gnome.aisleriot
      gnome.tali
      # retroarch/libretro cores:
      retroarch
      libretro.nestopia         # NES libretro core
      libretro.bsnes            # SNES libretro core
      libretro.mupen64plus      # N64 libretro core
      libretro.dolphin          # GCN libretro core
      libretro.mgba             # GBA libretro core
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  environment.systemPackages = with pkgs; [
     vim 
     alacritty
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
     firejail
     firehol
     killall
     xorg.xkill
     pulseaudio
     curl
     python
     lua
     openssl
     fish
     yt-dlp
     ###########################
     # GNOME extensions.
     # Leave commented out when not in use.
     ###########################
     gnomeExtensions.dash-to-dock
     gnomeExtensions.dash-to-panel
     gnomeExtensions.burn-my-windows
     gnomeExtensions.blur-my-shell
     gnomeExtensions.desktop-cube
     gnomeExtensions.tiling-assistant
     # include GNOME Tweak Tool.
     gnome.gnome-tweaks
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  
  # Enable Flatpak support.
  services.flatpak.enable = true;
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  system.stateVersion = "unstable"; # Did you read the comment?

}
