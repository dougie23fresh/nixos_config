# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hpeliteboox"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;
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

  # Games setting
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "steam" ]);
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  # services.gnome-keyring.enable = true;
  # packages.picom.enable = true;

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
  powerManagement.enable = true;
  #powerManagement.powertop.enable = true;
  # Firmware updater
  services.fwupd.enable = true;
  # userspace virtual filesystem
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  # Thumbnail support for images
  services.tumbler.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.tailscale.enable = true;
  services.syncthing.enable = true;
  #services.syncthing.systemService = true;
  #services.clipman.enable = true;
  services.tlp.enable = true;
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    CPU_MIN_PERF_ON_AC = 0;
    CPU_MAX_PERF_ON_AC = 100;
    CPU_MIN_PERF_ON_BAT = 0;
    CPU_MAX_PERF_ON_BAT = 20;
  };
  # Battery power management
  services.upower.enable = true;

  services.hardware.bolt.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.redshift.enable = true;
  services.redshift.provider = "manual";
  services.redshift.latitude = "26.006409";
  services.redshift.longitude = "-90.229664";
  services.redshift.temperature.night = 1500;
  # yubikey
  services.pcscd.enable = true;
  services.udev.packages = [
    pkgs.libu2f-host
    pkgs.yubikey-personalization
  ];
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    thunar-media-tags-plugin
  ];
  programs.neovim.enable = true;
  programs.neovim.withPython3 = true;
  programs.zsh.enable = true;

  # programs.neovim.configure


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.melvin = {
    isNormalUser = true;
    description = "melvin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    # web
    vivaldi
    vivaldi-ffmpeg-codecs
    microsoft-edge
    chromium
    # work
    citrix_workspace
    webex
    freerdp
    # network
    tailscale
    tailscale-systray
    # app runtime
    appimage-run
    flatpak
    # video
    ffmpeg
    mpv
    vlc
    # pic
    gthumb
    libsForQt5.gwenview
    # themes
    plano-theme
    zuki-themes
    stilo-themes
    amber-theme
    numix-gtk-theme
    catppuccin-gtk
    gnome-icon-theme
    vimix-icon-theme
    tela-icon-theme
    pop-icon-theme
    qogir-icon-theme
    numix-icon-theme
    pop-gtk-theme
    colloid-gtk-theme
    fluent-gtk-theme
    arc-theme
    venta
    qogir-theme
    nordic
    # comand line
    w3m
    neofetch
    fontconfig
    freetype
    wget
    htop
    # other
    libverto
    luarocks
    obsidian
    redshift
    xclip
    brightnessctl
    dia
    nix-output-monitor
    okular
    libnotify
    mate.mate-calc
    # font
    terminus-nerdfont
    fontconfig
    freetype
    dejavu_fonts
    gentium
    yanone-kaffeesatz
    emojione
    #fwupd
    firmware-manager
    # term
    wezterm
    # music
    rhythmbox
    # xfce
    xfce.xfce4-clipman-plugin
    xfce.xfce4-dict
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-weather-plugin
    xfce.xfce4-notes-plugin
    xfce.xfce4-verve-plugin
    xfce.xfce4-screensaver
    xfce.xfce4-screenshooter
    xfce.xfdashboard
    ulauncher
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    # games
    lutris
    steam
    steam-run
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        winetricks
      ];
    })
    # code
    kate
    gcc
    git
    vscode
    vscode-extensions.ms-python.python
    vscode-extensions.ms-python.vscode-pylance
    vscode-extensions.dracula-theme.theme-dracula
    vscode-extensions.nonylene.dark-molokai-theme
    vscode-extensions.jdinhlife.gruvbox
    vscode-extensions.catppuccin.catppuccin-vsc
    (python3.withPackages(ps: with ps; [
       urllib3
       pandas
       pip
       requests
       flake8
       pylint
       pyflakes
       rich
       python-box
       xmltodict
    ]))
    #yubikey
    opensc
    pcsctools
    libu2f-host
    yubikey-personalization
  ];
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex
    fira-code
    fira-code-symbols
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This  determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this  at the release version of the first install of this system.
  # Before changing this  read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  ## Backups & Upgrades
  # Backup system config
  # system.copySystemConfiguration = true;
  # System Upgrades
  #system.autoUpgrade.enable = true;
  #system.autoUpgrade.allowReboot = true;

  ## Garbage Collection
  # Automatic Garbage Collection
  #nix.gc = {
  #              automatic = true;
  #              dates = "weekly";
  #              options = "--delete-older-than 3d";
  #        };
}
