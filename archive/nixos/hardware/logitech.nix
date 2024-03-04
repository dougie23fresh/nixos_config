{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.logitech;
in
{
  options.dougieHost.hardware.logitech = {
    enable = mkEnableOption "logitech";
  };

  config = mkIf cfg.enable {
    hardware.logitech.wireless.enable = true;
    hardware.logitech.wireless.enableGraphical = true;
    services.ratbagd.enable = true;
    environment.systemPackages = with pkgs;[
      logitech-udev-rules
      piper
      libratbag
    ];
  };
}