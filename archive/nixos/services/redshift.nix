{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.redshift;
in
{
  options.dougieHost.services.redshift = {
    enable = mkEnableOption "redshift";
  };

  config = mkIf cfg.enable {
    services.redshift.enable = true;
    services.redshift.temperature.night = 3700;
  };
}