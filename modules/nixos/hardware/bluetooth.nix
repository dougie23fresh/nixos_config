{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.bluetooth;
in
{
  options.dougieHost.hardware.bluetooth = {
    enable = mkDefault false "bluetooth";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}