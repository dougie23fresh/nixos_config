{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.dougieHost.system.multithreading;
in
{
  options.dougieHost.system.multithreading = {
    enable = mkEnableOption "multi-threading";
  };

  config = mkIf cfg.enable {
   security.allowSimultaneousMultithreading = true;
  };
}