{ lib, config, pkgs, inputs, ... }: 

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./dunst.nix
    ./pavucontrol.nix
    ./playerctl.nix
  ];
  #xdg.portal.enable = true;
  #xdg.mimeApps.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  home.packages = with pkgs; [
    neofetch 
    nerdfonts
    corefonts
    open-fonts
    noto-fonts
    noto-fonts-emoji
    wl-clipboard

  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_ENABLE_WAYLAND = 1;
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    #WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    LIBVA_DRIVER_NAME = "i965";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

}