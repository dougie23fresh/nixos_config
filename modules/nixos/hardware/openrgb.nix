{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.openrgb;
in
{
  options.dougieHost.hardware.openrgb = {
    enable = mkEnableOption "openrgb";
  };

  config = mkIf cfg.enable {
    services.hardware.openrgb.enable = true;
    services.hardware.openrgb.motherboard = "amd";
  };
}