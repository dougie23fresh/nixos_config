{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.i2c;
in
{
  options.dougieHost.hardware.i2c = {
    enable = mkBoolOpt false "i2c";
  };

  config = mkIf cfg.enable {
    hardware.i2c.enable = true;
  };
}