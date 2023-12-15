{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.gdm;
in
{
  options.dougieHost.wm.gdm = {
    enable = mkDefault false "gdm";
  };

  config = mkIf cfg.enable {
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.gdm.wayland = true;
  };
}