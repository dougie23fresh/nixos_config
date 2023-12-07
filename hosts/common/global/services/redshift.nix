{ config, pkgs, ... }:
{
    services.redshift.enable = true;
    services.redshift.temperature.night = 3700;
}