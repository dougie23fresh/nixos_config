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
    hardware.bluetooth.powerOnBoot = true;
    hardware.bluetooth.settings.General.Experimental = true;
    #hardware.bluetooth.package = pkgs.bluezFull;
    services.blueman.enable = true;
    environment.systemPackages = with pkgs; [
      blueman
    ];
  };
}