{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.earlyoom;
in
{
  options.dougieHost.services.earlyoom = {
    enable = mkEnableOption "earlyoom";
  };

  config = mkIf cfg.enable {
    # Enable the early OOM (Out Of Memory) killer service.
    earlyoom.enable = true;
    # When free memory falls below 15%, earlyoom acts to prevent system slowdown or freezing.
    earlyoom.freeMemThreshold = 5; 
  };
}

