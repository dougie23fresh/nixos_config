{  pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        coreutils # The GNU Core Utilities
        inetutils # Collection of common network programs
        pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
        usbutils # Tools for working with USB devices, such as lsusb
        ssdfs-utils # SSDFS file system utilities
        killall
        dmidecode # A tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
        gnugrep # GNU implementation of the Unix grep command
        gnused # GNU sed, a batch stream editor

        disfetch # Yet another *nix distro fetching program, but less complex
        neofetch # A fast, highly customizable system info script
        ipfetch # Neofetch but for ip addresses
        lolcat # A rainbow version of cat
        cowsay # A program which generates ASCII pictures of a cow with a message
        onefetch # Git repository summary on your terminal
        starfetch # CLI star constellations displayer
        cpufetch # neofetch but for cpu's
        freshfetch # A fresh take on neofetch
        hwinfo # Hardware detection tool from openSUSE
        hardinfo # Display information about your hardware and operating system
        cdu_2 # disk space info

        btop # A monitor of resources
        bottom # A cross-platform graphical process/system monitor with a customizable interface
        lsof # A tool to list open files
        lshw # Provide detailed information on the hardware configuration of the machine
        tree # Command to produce a depth indented directory listing
        bat # A cat(1) clone with syntax highlighting and Git integration
        eza # A modern, maintained replacement for ls
        fd # A simple, fast and user-friendly alternative to find
        fzf # A command-line fuzzy finder written in Go
        git # Distributed version control system
        lazygit #Simple terminal UI for git commands
        htop # An interactive process viewer
        ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
        timer # A `sleep` with progress



    ];
}
