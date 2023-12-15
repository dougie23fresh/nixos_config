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
      layout = "us";
      xkbVariant = "";
      xkbOptions = "caps:escape";
    };
  };
}