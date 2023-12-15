{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.system.location;
in
{
  options.dougieHost.system.location = {
    enable = mkDefault false "location";
  };

  config = mkIf cfg.enable {
    location.provider = "manual";
    location.latitude = 26.006409;
    location.longitude = -90.229664;
  };
}