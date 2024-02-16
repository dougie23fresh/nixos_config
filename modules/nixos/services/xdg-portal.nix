{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.xdgportal;
in
{
  options.dougieHost.services.xdgportal = {
    enable = mkEnableOption "xdgportal ";
  };

  config = mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
    xdg.extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-kde
      xdg-desktop-portal-wlr
    ];
    xdg.configPackages = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal
    ];

  };
}

