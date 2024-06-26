{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.wayland;
in
{
  options.dougieHost.wm.wayland = {
    enable = mkEnableOption "wayland";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      xkb.options = "caps:escape";
      
    };
    environment.sessionVariables = { 
      GTK_USE_PORTAL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
    xdg = {
      icons.enable = true;
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          #xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
          #libsForQt5.xdg-desktop-portal-kde
        ];
      };
    };
  };
}