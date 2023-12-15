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
    #programs.hyprlandportalPackage = pkgs.xdg-desktop-portal-hyprland;

  };
}