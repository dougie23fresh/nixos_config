{  lib, config, pkgs, inputs, ... }:
{
  ########
  # pkg
  ########
  #environment.systemPackages = with pkgs; [
  #  trashy
  #  tldr
  ##  pamixer
  #  playerctl
  #  home-manager
  #];
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
    bat   # A cat(1) clone with syntax highlighting and Git integration
    binutils # Tools for manipulating binaries (linker, assembler, etc.) (wrapper script)
    dua # A tool to conveniently learn about the disk usage of directories
    duf # Disk Usage/Free Utility
    fd # A simple, fast and user-friendly alternative to find
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    traceroute # Tracks the route taken by packets over an IP network
    tree # Command to produce a depth indented directory listing
    yq-go # Portable command-line YAML processor

    # Terminal
    wezterm # GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust
    kitty # A modern, hackable, featureful, OpenGL based terminal emulator
    alacritty # A cross-platform, GPU-accelerated terminal emulator
    gamemode
    steam # A digital distribution platform
    steam-run # A digital distribution platform
    blueman # GTK-based Bluetooth Manager
    piper # GTK frontend for ratbagd mouse config daemon
    gsmartcontrol # Hard disk drive health inspection tool
    pavucontrol # PulseAudio Volume Control
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
    inputs.nixos-conf-editor.packages.${pkgs.system}.nixos-conf-editor


    # libsForQt5.qt5.qtgraphicaleffects
  ];
    #] ++ lib.optionals (desktop != null) [
}