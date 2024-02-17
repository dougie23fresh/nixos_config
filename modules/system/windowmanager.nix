{  lib, config, pkgs, inputs, ... }:
{
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
    #xdg-desktop-portal-hyprland
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
}