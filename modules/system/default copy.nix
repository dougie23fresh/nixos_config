{  lib, config, pkgs, ... }:
{
  imports = [
    ./system
    ./services
    ./hardware
    ./wm
    ./app
    ./users.nix
    ./fonts.nix
    ./tools.nix
  ];
  ########
  # font
  ########
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.enableGhostscriptFonts = true;
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    open-fonts
    #istafonts
    ibm-plex
    fira
    fira-code
    fira-code-symbols
    fira-mono
    font-awesome
    roboto
    openmoji-color
    material-design-icons
    material-icons
    joypixels
    dejavu_fonts
    comfortaa
    comic-neue
    powerline
    inconsolata
    inconsolata-nerdfont
    ubuntu_font_family
    terminus_font
  ];
  ########
  # hardware
  ########
  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";
  hardware.bluetooth.settings.General.Experimental = true;
  services.blueman.enable = true;
  # brillo - Backlight and Keyboard LED control tool.
  hardware.brillo.enable = true;
  # i2c - i2c devices support
  hardware.i2c.enable = true;
  # logitech
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  # opengl
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  # pulseaudio
  hardware.pulseaudio.enable = false;
  # sane
  hardware.sane = {
    enable = true;
    #extraBackends = with pkgs; [ hplipWithPlugin sane-airscan ];
    extraBackends = with pkgs; [ 
      sane-airscan
      epkowa
    ];
    disabledDefaultBackends = ["escl"];
  };

  ########
  # services
  ########
  # avahi
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # Battery
  services.system76-scheduler.settings.cfsProfiles.enable = true; # Better scheduling for CPU cycles - thanks System76
  services.tlp.enable = true; # Enable TLP (better than gnomes internal power manager)
  services.tlp.settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
  services.power-profiles-daemon.enable = false; # Disable GNOMEs power management
  powerManagement.powertop.enable = true; # Enable powertop
  services.thermald.enable = true; # Enable thermald (only necessary if on Intel CPUs)
  # dbus
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
    dconf
    gcr
    udisks2
  ];
  # earlyoom #Enable the early OOM (Out Of Memory) killer service.
  services.earlyoom.enable = true;
  services.earlyoom.freeMemThreshold = 5; # When free memory falls below 15%, earlyoom acts to prevent system slowdown or freezing.
  # fingerprint
  services.fprintd.enable = true;
  # flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # fstrim
  services.fstrim.enable = true;
  # fwupd
  services.fwupd.enable = true;
  # gvfs
  services.gvfs.enable = true;
  # ipp-usb
  services.ipp-usb.enable = true;
  # journal
  services.journald.extraConfig = "SystemMaxUse=250M\nSystemMaxFiles=10";
  services.journald.rateLimitBurst = 800;
  services.journald.rateLimitInterval = "5s";
  # logind - laptop lid
  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "lock";
  # openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "amd";
  # openssh
  services.openssh.enable = true;
  # pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  # smartd 
  services.smartd.enable = true;
  # printing
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [ 
    brgenml1cupswrapper      # Generic drivers for more Brother printers
    brgenml1lpr              # Generic drivers for more Brother printers
    brlaser                  # Drivers for some Brother printers
    cnijfilter2              # Generic cannon
    gutenprint               # Drivers for many different printers from many different vendors
    gutenprintBin            # Additional, binary-only drivers for some printers
    hplip                    # Drivers for HP printers
    hplipWithPlugin          # Drivers for HP printers, with the proprietary plugin. Use in terminal  NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup'

  ];
  # ratbagd - configuring gaming mice.
  services.ratbagd.enable = true;
  # redshift
  services.redshift.enable = true;
  services.redshift.temperature.night = 3700;
  # security
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  #security.pam.services.login.enableGnomeKeyring = true;
  #services.gnome.gnome-keyring.enable = true;
  # syncthing
  services.syncthing.enable = true;
  # tailscale
  services.tailscale.enable = true;
  # tumbler
  services.tumbler.enable = true;
  # udev
  services.udev.enable = true;
  # udisk2
  services.udisks2.enable = true;
  services.devmon.enable = true;
  # yubikey
  services.pcscd.enable = true;
  services.udev.packages = [
    pkgs.libu2f-host
    pkgs.yubikey-personalization
  ];
  ########
  # System
  ########
  # Boot
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };
  boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # boot.kernelPackages = pkgs.linuxPackages_lqx
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [
    "exfat"
    "ntfs"
    "btrfs"
    "cifs"
    "ext"
    "nfs"
    "vfat"
  ];
  # console
  console.keyMap = "us";
  # locale
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
  # location
  location.provider = "manual";
  location.latitude = 26.006409;
  location.longitude = -90.229664;
  # Multithreading
  security.allowSimultaneousMultithreading = true;
  # networking
  networking.hostName = cfg.hostName;
  networking.networkmanager.enable = true;
  # appendNameservers = [ "1.1.1.1" "8.8.8.8" ];
  # Prevent fragmentation and reassembly, which can improve network performanceconnectionConfig = {"ethernet.mtu" = 1462;"wifi.mtu" = 1462;};
  networking.timeServers = [
    "0.nixos.pool.ntp.org"
    "1.nixos.pool.ntp.org"
    "2.nixos.pool.ntp.org"
    "3.nixos.pool.ntp.org"
    "time.google.com"
    "time2.google.com"
    "time3.google.com"
    "time4.google.com"
  ];
  # nixSettings
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  # sound
  sound.enable = true;
  security.rtkit.enable = true;
  # security
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';
  # time
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;

  ########
  # users
  ########
  users.users.${cfg.userName} = {
    isNormalUser = true;
    description = "${cfg.userDescription}";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    shell = pkg.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
  
  ########
  # WindowManager
  ########
  # environment
  environment.sessionVariables = { 
    #GTK_USE_PORTAL = "1";
    #MOZ_ENABLE_WAYLAND = "1";
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
  # gdm
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  # sddm
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.autoNumlock = true;
  #services.xserver.displayManager.sddm.wayland.enable = true;
  #services.xserver.displayManager.sddm.theme = "tokyo-night-sddm";
  # hyprland 
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  # xdg
  xdg.icons.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    libsForQt5.xdg-desktop-portal-kde
  ];
  # xfce
  services.xserver.desktopManager.xfce.enable = true;
  # xserver
  services.xserver.enable = true;  
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
  services.xserver.xkb.options = "caps:escape";
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.libinput.enable = true;
  
  ########
  # virtualisation
  ########
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.lxd.enable = true;
  # add distrobox
  # add Docker
  ########
  # programs
  ########
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    "mlmoighangjfhiookjppplipefbbnaoo" # half-bold
  ];
  programs.chromium.defaultSearchProviderEnabled = true;
  programs.chromium.defaultSearchProviderSearchURL = "{google:baseURL}search?q=%s&{google:originalQueryForSuggestion}{google:prefetchSource}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}";
  programs.chromium.defaultSearchProviderSuggestURL = "{google:baseURL}search?output=chrome&q={searchTerms}";
  programs.chromium.extraOpts = {
    "BrowserSignin" = 0;
    "SyncDisabled" = true;
    "PasswordManagerEnabled" = false;
    "SpellcheckEnabled" = true;
    "SpellcheckLanguage" = [ "en-US" ];
  };
  programs.dconf.enable = true;
  programs.dconf.enable = true;
  programs.system-config-printer.enable = true;
  programs.fuse.userAllowOther = true;
  programs.partition-manager.enable = true;
  programs.adb.enable = true;
  programs.nix-ld.enable = true;
  programs.gamemode.enable = true;
  programs.zsh.enable = true;

  #programs.seahorse.enable = true;
  # programs.java.enable = false;
  ########
  # pkg
  ########
 environment.systemPackages = with pkgs; [
    trashy
    tldr
    pamixer
    playerctl
    home-manager
  ];
  environment.systemPackages = with pkgs; [
    #(python311.withPackages my-python-packages)
    #python311Packages.ipython
    # scripts
    (pkgs.writeScriptBin "sct2" ''
    #!/bin/sh
    killall wlsunset &> /dev/null;
    if [ $# -e 1 ]; then
      temphigh=$(( $1 +1 ))
      templow =$1
      wlsunset -t $templow -T $temphigh &> /dev/null &
    else
      killall wlsunset &> /dev/null;
    fi
    '')
    # system
    appimage-run # appimage
    home-manager # A Nix-based user environment configurator
    libnotify # A library that sends desktop notifications to a notification daemon
    gamemode # Optimise Linux system performance on demand
    openrgb-with-all-plugins # Open source RGB lighting control
    cups-filters # Backends, filters, and other software that was once part of the core CUPS distribution 
    libvirt # A toolkit to interact with the virtualization capabilities of recent versions of Linux and other OSes
    polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
    #libverto # Asynchronous event loop abstraction library
    #libnotify # Minimalistic libnotify wrapper
    imagemagick	# A software suite to create, edit, compose, or convert bitmap images
    fontconfig # A library for font customization and configuration
    miraclecast # Connect external monitors via Wi-Fi
    freetype # A font rendering engine
    logitech-udev-rules # Linux devices manager for the Logitech Unifying Receiver
    libratbag # Configuration library for gaming mice

    # CLI 
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    curl # A command line tool for transferring files with URL syntax
    git # Distributed version control system
    cmatrix # Simulates the falling characters theme from The Matrix movie
    lolcat # A rainbow version of cat
    neofetch # A fast, highly customizable system info script
    htop # An interactive process viewer for Linux, with vim-style keybindings
    btop # A monitor of resources
    killall # kill app
    lm_sensors # Tools for reading hardware sensors
    usbutils # Tools for working with USB devices, such as lsusb
    pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
    iputils # A set of small useful utilities for Linux networking
    inetutils # Collection of common network programs
    fetchutils # A collection of small shell utilities to fetch system information
    coreutils # The GNU Core Utilities
    dmidecode # A tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
    util-linux # A set of system utilities for Linux
    nano # A small, user-friendly console text editor
    dogdns # Modern Unix `dig`
    httpie # Terminal HTTP client
    iperf3 # Terminal network benchmarking
    mtr # Modern Unix `traceroute`
    netdiscover # Modern Unix `arp`
    speedtest-go # Terminal speedtest
    fzf # A command-line fuzzy finder written in Go
    unzip # An extraction utility for archives compressed in .zip format
    unrar # An extraction utility for archives compressed in .rar format
    p7zip # A new p7zip fork with additional codecs and improvements (forked from https://sourceforge.net/projects/p7zip/)
    file # A program that shows the type of files
    jq # A lightweight and flexible command-line JSON processor
    clac # Interactive stack-based calculator
    go-sct # Color temperature setting library and CLI that operates in a similar way to f.lux and Redshift
    ntp # An implementation of the Network Time Protocol
    acpi # Show battery status and other ACPI information
    eza # A modern, maintained replacement for ls
    gcc # GNU Compiler Collection,
    cmake # Cross-platform, open-source build system generator
    openssl # A cryptographic library that implements the SSL and TLS protocols
    cifs-utils # Tools for managing Linux CIFS client filesystems
    nfs-utils # Linux user-space NFS utilities
    samba # The standard Windows interoperability suite of programs for Linux and Unix
    dig # Domain name server
    v4l-utils # V4L utils and libv4l, provide common image formats regardless of the v4l device
    ydotool # Generic Linux command-line automation tool
    toybox # Lightweight implementation of some Unix command line utilities
    w3m #A text-mode web browser
    pulsemixer # Cli and curses mixer for pulseaudio
    blueberry # Bluetooth configuration tool
    nvme-cli # NVM-Express user space tooling for Linux
    smartmontools # Tools for monitoring the health of hard drives
    tailscale # The node agent for Tailscale, a mesh VPN built on WireGuard

    # Terminal
    wezterm # GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust
    kitty # A modern, hackable, featureful, OpenGL based terminal emulator
    alacritty # A cross-platform, GPU-accelerated terminal emulator

    steam # A digital distribution platform
    blueman # GTK-based Bluetooth Manager
    piper # GTK frontend for ratbagd mouse config daemon
    gsmartcontrol # Hard disk drive health inspection tool
    pavucontrol # PulseAudio Volume Control
    # libsForQt5.qt5.qtgraphicaleffects
  ];
    #] ++ lib.optionals (desktop != null) [

}