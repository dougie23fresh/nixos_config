{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.bluetooth;
in
{
  options.dougieHost.hardware.bluetooth = {
    enable = mkEnableOption "bluetooth";
  };

  config = mkIf cfg.enable {
    hardware.logitech.wireless.enable = true;
    hardware.logitech.wireless.enableGraphical = true;
    environment.systemPackages = with pkgs;[
      logitech-udev-rules
    ];
  };
}