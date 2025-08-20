{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  hyprland,
  ...
}: {
  networking.firewall.enable = false;
  imports = [
    hyprland.nixosModules.default
    ./hardware.nix
    inputs.catppuccin.nixosModules.catppuccin
    outputs.nixosModules.hardware.bluetooth
    outputs.nixosModules.hardware.cpu-intel
    outputs.nixosModules.hardware.gpu-intel
    outputs.nixosModules.hardware.firmware
    outputs.nixosModules.hardware.keyboard-backlight
    outputs.nixosModules.hardware.logitech
    #outputs.nixosModules.hardware.scanner
    outputs.nixosModules.hardware.power-management
    outputs.nixosModules.hardware.sounds


    outputs.nixosModules.users
    outputs.nixosModules.system # refactor
    outputs.nixosModules.fonts # refactor


    #outputs.nixosModules.system.default_pkgs.nix # refactor
    #outputs.nixosModules.system.default_programs.nix # refactor
    #outputs.nixosModules.system.font.nix # refactor
    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    outputs.nixosModules.services.clipboard
    outputs.nixosModules.services.dbus
    outputs.nixosModules.services.device-manager
    outputs.nixosModules.services.fingerprint
    outputs.nixosModules.services.firmware-update
    outputs.nixosModules.services.flatpak
    outputs.nixosModules.services.hard-drive
    outputs.nixosModules.services.mdns
    outputs.nixosModules.services.openrgb
    outputs.nixosModules.services.openssh
    outputs.nixosModules.services.out-of-memory
    outputs.nixosModules.services.printing
    #outputs.nixosModules..system.services.redshift
    outputs.nixosModules.services.security
    outputs.nixosModules.services.smartd
    outputs.nixosModules.services.ssd
    outputs.nixosModules.services.syncthing
    outputs.nixosModules.services.tailscale
    outputs.nixosModules.services.tumbler
    outputs.nixosModules.services.udisk
    #outputs.nixosModules.services.yubikey
    # virtualisation
    #outputs.nixosModules..system.virtualisation.distrobox
    #outputs.nixosModules..system.virtualisation.docker
    #outputs.nixosModules..system.virtualisation.libvirtd
    #outputs.nixosModules..system.virtualisation.lxd
    #outputs.nixosModules..system.virtualisation.waydroid
    # window-manager\
    #outputs.nixosModules..system.display-manager.gdm
    outputs.nixosModules.display-manager.sddm

    outputs.nixosModules.window-manager.xserver
    outputs.nixosModules.window-manager.hyprland
    #outputs.nixosModules.window-manager.labwc
    #outputs.nixosModules..system.window-manager.plasma5
    #outputs.nixosModules..system.window-manager.plasma6
    #outputs.nixosModules.window-manager.xfce
    #outputs.nixosModules.window-manager.plasma6
    #outputs.nixosModules.window-manager.xdg
    #outputs.nixosModules.window-manager.wayfire
    #LXQt
    #Enlightenment
    #budgie
    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp
  ];

  #catppuccin.flavor = "macchiato";
  
  system.stateVersion = "23.11";
  hardware.sane.enable = true;
  users.users.melvin.extraGroups = [ "openrazer" ];
  environment.systemPackages = with pkgs; [
    libsForQt5.skanlite
    opera
    floorp
    tor-browser
    librewolf
    tangram
    openrazer-daemon
    polychromatic
    # dev
    git
    gcc
    makesbinutils
    nixfmt-rfc-style
    kitty
    lazygit
    lazydocker
    # multimedia
    mpv
    vlc
    ffmpeg-full
    lame
    qjackctl
    qpwgraph
    x32edit
    easyeffects
    wayfarer
    obs-studio
    obs-studio-plugins.obs-pipewire-audio-capture
    libeproxy
    audacity
    ffmpegthumbnailer
    gnome.gvfs
    imv
    # utilities
    ghostty
    htop
    btop
    neofetch
    nmap
    mosh
    yt-dlp
    zip
    unzip
    gnupg
    hddtemp
    smartmontools
    iotop
    lm_sensors
    tree
    lsof
    lshw
    vdhcoapp
    ulauncher
    wmctrl
    # Hyprland utilities
    waybar
    wl-clipboard
    grim
    slurp
    swappy
    wf-recorder
    wlroots
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-utils
    kdePackages.polkit-kde-agent-1
    qt6.qtbase
    qt6.qtwayland
    # Additional Hyprland utilities
    wofi
    dunst
    cliphist
    brightnessctl
    playerctl
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kate
    # Notification daemon
    libnotify
    # Additional terminal utilities from Omarchy
    fd
    eza
    fzf
    ripgrep
    zoxide
    bat
    jq
    xmlstarlet
    tldr
    plocate
    # man  # removed since manpages are disabled
    less
    whois
    bash-completion
    # Additional desktop utilities from Omarchy
    pamixer
    wiremix
    fcitx5
    fcitx5-gtk
    kdePackages.fcitx5-qt
    nautilus
    sushi
    # Additional Hyprland utilities from Omarchy
    # polkit_gnome  # removed to avoid duplicate agents; using KDE polkit agent
    libqalculate
    mako
    swaybg
    swayosd
    rofi-wayland
    qt6ct
    pavucontrol
    networkmanagerapplet
    # Shell history replacement
    atuin
    ddcutil
    curl
    #openssh
    glib-networking
    rclone

    # systemTools
    pciutils
    cifs-utils
    samba
    fuse
    fuse3

    # applications
    firefox
    brave
    google-chrome
    slack
    telegram-desktop
    element-desktop
    nextcloud-client
    trayscale
    alacritty
    maestral-gui
    qownnotes
    libation
    audible-cli
    chromium
    gnome-calculator
    gnome-keyring
    signal-desktop
    libreoffice
    kdePackages.kdenlive
    xournalpp
    localsend
    hyprpicker
    hyprshot
    wl-clip-persist
    hyprpaper
    hypridle
    hyprlock
    hyprsunset
    yazi
    starship
    rclone-browser

    # gaming
    steam-run
    moonlight-qt
    sunshine
    adwaita-icon-theme
    lutris
    playonlinux
    wineWowPackages.staging
    winetricks
    vulkan-tools

    #  gtkApps
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kio-admin
    kdePackages.kdenetwork-filesharing
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kimageformats
    kdePackages.ark
    kdePackages.konsole
    # Also include Thunar alongside Dolphin
    xfce.thunar
    xfce.tumbler
    gvfs
    # Theming packages
    tokyo-night-gtk
    papirus-icon-theme
    bibata-cursors
    adwaita-qt
    adwaita-qt6
    # Document viewer
    evince
    # Image viewer
    eog
    # Calculator
    gnome-calculator
    # Archive manager
    file-roller
    # Video player
    celluloid
    # Torrent client
    fragments
    # Ebook reader
    foliate
    # Background sounds
    blanket
    # Metadata cleaner
    metadata-cleaner
    # Translation app
    dialect
    # Drawing app
    drawing
  ];

  systemd.slices."nix-daemon".sliceConfig = ManagedOOMMemoryPressure = "kill";
  systemd.slices."nix-daemon".sliceConfig = ManagedOOMMemoryPressureLimit = "95%";
  systemd.services."nix-daemon".serviceConfig.Slice = "nix-daemon.slice";
  systemd.services."nix-daemon".serviceConfig.OOMScoreAdjust = 1000;

  systemd.user.services.kwalletd.description = "KWallet user daemon";
  systemd.user.services.kwalletd.after = [ "default.target" ];
  systemd.user.services.kwalletd.wantedBy = [ "default.target" ];
  systemd.user.services.kwalletd.serviceConfig.ExecStart = "${pkgs.kdePackages.kwallet}/bin/kwalletd6";
  systemd.user.services.kwalletd.serviceConfig.Restart = "on-failure";
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.i2c.enable = true;
  hardware.steam-hardware.enable = true;
  services.udev.packages = [ pkgs.brightnessctl ];
  # Optional: allow mounting WebDAV as a filesystem (in addition to GVFS WebDAV)
  davfs2.enable = true;
  # Secret Service provider for GVFS credentials (SFTP/SMB/WebDAV)
  gnome.gnome-keyring.enable = true;

  # Auto Tune
  services.bpftune.enable = true;
  programs.bcc.enable = true;

  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services = {
      login.kwallet.enable = true;
      gdm.kwallet.enable = true;
      gdm-password.kwallet.enable = true;
      hyprlock = { };
      # Unlock GNOME Keyring on login for GVFS credentials
      login.enableGnomeKeyring = true;
      gdm-password.enableGnomeKeyring = true;
    };
  };

  # No man pages
  documentation.man.enable = false;

  programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
      # Atuin environment variables
      ATUIN_SESSION = "";
      # Cursor theme for consistency across apps
      XCURSOR_THEME = "Bibata-Modern-Ice";
    };
  };

  # Prefer Hyprland XDG portal
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # Hyprland module provides its own portal; include only GTK here to avoid duplicate units
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
      };
    };
  };

  # Make Qt apps follow GNOME/GTK settings for closer match to GTK theme
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };


  services.udev.extraRules = ''
    # keyboard disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="062a", ATTR{idProduct}=="4101", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="3434", ATTR{idProduct}=="0430", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="04d9", ATTR{idProduct}=="a1cd", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="25a7", ATTR{idProduct}=="fa70", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="258a", ATTR{idProduct}=="0150", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1997", ATTR{idProduct}=="2466", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="05e3", ATTR{idProduct}=="0612", ATTR{power/autosuspend}="-1"
    # mouse disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c548", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c52b ", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c539 ", ATTR{power/autosuspend}="-1"
  '';
}
