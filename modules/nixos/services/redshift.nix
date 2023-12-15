{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.redshift;
in
{
  options.dougieHost.services.redshift = {
    enable = mkDefault false "redshift";
  };

  config = mkIf cfg.enable {
    services.redshift.enable = true;
    services.redshift.temperature.night = 3700;
  };
}