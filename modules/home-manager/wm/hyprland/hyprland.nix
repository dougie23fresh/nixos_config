{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.wm.hyprland;
in
{
  options.dougieHome.wm.hyprland = {
    enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {
    imports = [
      ./hyprland_settings.nix
    ];
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland = { enable = true; };
    wayland.windowManager.hyprland.systemdIntegration = true;
    home.packages = with pkgs; [
      killall
      polkit_gnome # A dbus session bus service that is used to bring up authentication dialogs
      libva-utils # A collection of utilities and examples for VA-API
      gsettings-desktop-schemas
      wlr-randr # An xrandr clone for wlroots compositors
      wtype # xdotool type for wayland
      wl-clipboard
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
      libsForQt5.qt5.qtwayland # A cross-platform application framework for C++
      qt6.qtwayland # A cross-platform application framework for C++
      xdg-utils
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      wlsunset # Day/night gamma adjustments for Wayland
      pavucontrol # PulseAudio Volume Control
      pamixer # Pulseaudio command line mixer
      wofi
      rofi
    ];
    #wayland.windowManager.hyprland.settings = { };
    #wayland.windowManager.hyprland.extraConfig = '' '';
    #imports = [
    #  ../../app/terminal/alacritty.nix
    #];
    #wayland.windowManager.hyprland.plugins = [];
    #gtk.cursorTheme = {
    #  package = pkgs.quintom-cursor-theme;
    #  name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    #  size = 36;
    #};
  }
}
