{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };
  programs.hyprland = {
    enable = true;
    xwayland = {
      hidpi = true;
      enable = true;
    };
    #  enableNvidiaPatches = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };
  security.pam.services.swaylock = {};
  
  environment.systemPackages = with pkgs; [
    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    swaynotificationcenter
    wlogout # logout menu
    wl-clipboard # copying and pasting
    wlr-randr
    hyprpicker  # color picker

    ydotool
    hyprland-share-picker
    hyprland-protocols
    xdg-desktop-portal-hyprland
    hyprpaper
    wofi
    rofi
    playerctl
    brightnessctl
    swww
    grim
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6

    wf-recorder # creen recording
    grim # taking screenshots
    slurp # selecting a region to screenshot
    # TODO replace by `flameshot gui --raw | wl-copy`

    mako # the notification daemon, the same as dunst

    yad # a fork of zenity, for creating dialogs

    # audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor

  ];

  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };
    #"MOZ_WEBRENDER" = "1";

    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/
    #"LIBVA_DRIVER_NAME" = "nvidia";
    #"XDG_SESSION_TYPE" = "wayland";
    #"GBM_BACKEND" = "nvidia-drm";
    #"__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    #"WLR_NO_HARDWARE_CURSORS" = "1";
    #"WLR_EGL_NO_MODIFIRES" = "1";

    #firefox = {
    #  enable = true;
    #  enableGnomeExtensions = false;
    #  package = pkgs.firefox-wayland; # firefox with wayland support
    #};
}