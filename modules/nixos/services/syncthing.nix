{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.syncthing;
in
{
  options.dougieHost.services.syncthing = {
    enable = mkBoolOpt false "syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing.enable = true;
  };
}