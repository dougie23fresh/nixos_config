{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.android;
in
{
  options.dougieHome.development.android = {
    enable = mkEnableOption "android";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Android
      android-tools
      android-udev-rules
    ];
  }
}
