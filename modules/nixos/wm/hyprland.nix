{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.hyprland;
in
{
  options.dougieHost.wm.hyprland = {
    enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    #programs.hyprlandportalPackage = pkgs.xdg-desktop-portal-hyprland;

  };
}