{ lib, config, pkgs, inputs, ... }: 

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./pavucontrol.nix
    ./playerctl.nix
  ];
  #xdg.portal.enable = true;
  #xdg.mimeApps.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  home.packages = with pkgs; [
    neofetch 
    
    wl-clipboard

  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };

}