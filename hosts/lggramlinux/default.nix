# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/global
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lggramlinux"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "steam" ]);
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.hardware.bolt.enable = true;
  # Lid settings
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.melvin = {
    isNormalUser = true;
    description = "melvin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };
  environment.systemPackages = with pkgs; [
    # web
    firefox
    (vivaldi.override{
      proprietaryCodecs = true;
      enableWidevine = true;
    })
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
    alacritty
    #yubikey
    opensc
    pcsctools
    libu2f-host
    yubikey-personalization
  ];
  fonts.packages = with pkgs; [
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
