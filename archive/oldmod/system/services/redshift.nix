{  lib, config, pkgs, ... }:
{
  # redshift
  services.redshift.enable = true;
  services.redshift.temperature.night = 3700;
}
