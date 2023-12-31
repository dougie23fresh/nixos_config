{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.brillo;
in
{
  options.dougieHost.hardware.brillo = {
    enable = mkEnableOption "brillo";
  };

  config = mkIf cfg.enable {
    hardware.brillo.enable = true;
  };
}
# Backlight and Keyboard LED control tool.
