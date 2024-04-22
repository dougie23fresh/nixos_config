{

  audio = import ./audio;
  browser = import ./browser;
  networking = import ./networking;

  home.packages = with pkgs; [
    # Command Line
    disfetch # Yet another *nix distro fetching program, but less complex
    neofetch # A fast, highly customizable system info script
    ipfetch # Neofetch but for ip addresses
    lolcat # A rainbow version of cat
    cowsay # A program which generates ASCII pictures of a cow with a message
    onefetch # Git repository summary on your terminal
    starfetch # CLI star constellations displayer
    cpufetch # neofetch but for cpu's
    cava # Console-based Audio Visualizer for Alsa
    gnugrep # GNU implementation of the Unix grep command
    gnused # GNU sed, a batch stream editor
    killall
    libnotify # A library that sends desktop notifications to a notification daemon
    #toybox # Lightweight implementation of some Unix command line utilities
    timer # A `sleep` with progress
    bat # A cat(1) clone with syntax highlighting and Git integration
    eza # A modern, maintained replacement for ls
    fd # A simple, fast and user-friendly alternative to find
    bottom # A cross-platform graphical process/system monitor with a customizable interface
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    rsync # Fast incremental file transfer utility
    tmux # Terminal multiplexer
    htop # An interactive process viewer
    hwinfo # Hardware detection tool from openSUSE
    unzip # An extraction utility for archives compressed in .zip format
    brightnessctl # This program allows you read and control device brightness
    w3m # A text-mode web browser
    fzf # A command-line fuzzy finder written in Go
    pandoc # Conversion between documentation formats
    pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
    todo  # todo app for acoustic people (wrriten by me :3)
    catimg # preview images in terminal
    ffmpeg-full # premiere pro for acoustic people
    glow # markdown previewer
    yt-dlp # download from yt and other websites
    gping     # ping, but with cool graph
    dogdns     # dns client

}


