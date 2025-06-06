{  pkgs, pkgs-unstable, ... }:
{
  services.desktopManager.plasma6.enable = true;
  programs.dconf.enable = true;
  #services.displayManager.defaultSession = "plasma";
  #services.xserver.displayManager.defaultSession = "plasma";
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  environment.systemPackages = with pkgs; [
    pkgs.kdePackages.kdbusaddons
    pkgs.kdePackages.qt6ct
    pkgs.kdePackages.qtstyleplugin-kvantum
    pkgs.kdePackages.kdeplasma-addons
    pkgs-unstable.kdePackages.krdp
  ];
  xdg.portal.enable = true; 
  xdg.portal.extraPortals = [ 
    #pkgs.xdg-desktop-portal-kde
    pkgs.kdePackages.xdg-desktop-portal-kde
  ];
  #environment.variables = {
  #  IXOS_OZONE_WL="1";
    #LIBVA_DRIVER_NAME="nvidia";
  #  XDG_SESSION_TYPE = "wayland";
  #  GDK_BACKEND="wayland,x11";
  #  QT_QPA_PLATFORM="wayland;xcb";
  # SDL_VIDEODRIVER="wayland";
  #  CLUTTER_BACKEND="wayland";
  #  #GBM_BACKEND = "nvidia-drm";
  #  #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #};
}
