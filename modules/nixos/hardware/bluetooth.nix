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
    hardware.bluetooth.enable = true;
    hardware.bluetooth.package = pkgs.bluez;
    hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";
    #services.blueman.enable = true;
  };
}