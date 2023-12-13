{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.system.time;
in
{
  options.dougieHost.system.time = {
    enable = mkBoolOpt false "time";
  };

  config = mkIf cfg.enable {
    time.timeZone = "America/New_York";
    time.hardwareClockInLocalTime = true;
  };
}