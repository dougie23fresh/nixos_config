{
    environment.systemPackages = with pkgs; [
        coreutils # The GNU Core Utilities
        inetutils # Collection of common network programs
        pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
        usbutils # Tools for working with USB devices, such as lsusb
        ssdfs-utils # SSDFS file system utilities
        killall
        dmidecode # A tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
        btop
        bottom
        lsof
        tree
        bat
        git
        lazygit
        htop
        cdu_2 # disk space info
        freshfetch

        onefetch
        hardinfo

    ];
}
