{  lib, config, pkgs, inputs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
  ];
  environment.variables = {
    IXOS_OZONE_WL="1";
    #LIBVA_DRIVER_NAME="nvidia";
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND="wayland,x11";
    QT_QPA_PLATFORM="wayland;xcb";
    SDL_VIDEODRIVER="wayland";
    CLUTTER_BACKEND="wayland";
    #GBM_BACKEND = "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
