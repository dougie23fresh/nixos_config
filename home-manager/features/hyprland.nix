{ lib, config, pkgs, inputs, ... }: 
{

  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    #extraConfig = import ./hyprland-config.nix {};
    xwayland.enable = true;
  };
  
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.hyprland ];
  };

  home.packages = with pkgs; [
    neofetch 
  ];

}