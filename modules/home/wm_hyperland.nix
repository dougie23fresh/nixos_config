{ inputs, outputs, pkgs, ... }:
{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;

  services.udiskie.enable = true;
  services.udiskie.tray = "always";
  #programs.ags.enable = true;
  
  services.playerctld.enable = true;
  #home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  #home.file.".config/hypr/palm-tree-night.jpg".source = ../../../../wallpaper/palm-tree-night.jpg;
  #home.file.".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;
  home.packages = with pkgs; [
    seatd
    jaq
    xorg.xprop
    xwaylandvideobridge
    playerctl # Command-line utility and library for controlling media players that implement MPRIS
    killall
    polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
    libva-utils # A collection of utilities and examples for VA-API
    gsettings-desktop-schemas
    wlr-randr # An xrandr clone for wlroots compositors
    wtype # xdotool type for wayland
    wl-clipboard
    wl-screenrec
    cliphist
    wlogout
    hyprland-protocols
    hyprpicker # wlroots-compatible Wayland color picker that does not su
    swayidle # Idle management daemon for Wayland
    gtklock # GTK-based lockscreen for Wayland
    swaybg # Wallpaper tool for Wayland compositors
    fnott # notification daemon 
    fuzzel # Wayland-native application launcher
    wev # Wayland event viewer
    grim  # Grab images from a Wayland compositor
    slurp # Select a region in a Wayland compositor
    grimblast
    swappy
    libsForQt5.qt5.qtwayland # A cross-platform application framework for C++
    qt6.qtwayland # A cross-platform application framework for C++
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    bc # GNU software calculator

    #xdg-desktop-portal-hyprland
    wlsunset # Day/night gamma adjustments for Wayland
    pavucontrol # PulseAudio Volume Control
    pamixer # Pulseaudio command line mixer
    #swaylock
    swaylock-fancy
    swaylock-effects
    brightnessctl
    grimblast
    hyprpaper
    wofi
    rofi
    wvkbd
    #cinnamon.nemo
    cinnamon.nemo-with-extensions
    cinnamon.nemo-emblems
    cinnamon.nemo-fileroller
    cinnamon.folder-color-switcher
    dconf
    gtk-engine-murrine
    gnome.gnome-themes-extra
    gtk3
    gtk4
    clipman
    networkmanager_dmenu
    nwg-look
    themechanger
    catppuccin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    qt6Packages.qt6ct

    bitwarden
    bitwarden-cli
    keyutils
    networkmanagerapplet
    ranger
    yewtube
    dosfstools
    libnotify
  ];
}