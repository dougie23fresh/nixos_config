{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.hardware.bluetooth;
in
{
  options.dougieHome.hardware.bluetooth = {
    enable = mkEnableOption "bluetooth";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      blueman
    ];
    services.blueman-applet.enable = true;
  };
}
