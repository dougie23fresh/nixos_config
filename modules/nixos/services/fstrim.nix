{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.fstrim;
in
{
  options.dougieHost.services.fstrim = {
    enable = mkBoolOpt false "fstrim";
  };

  config = mkIf cfg.enable {
    services.fstrim.enable = true;
  };
}