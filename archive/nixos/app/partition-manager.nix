{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.partition-manager;
in
{
  options.dougieHost.app.partition-manager = {
    enable = mkEnableOption "partition-manager";
  };

  config = mkIf cfg.enable {
    programs = {
      partition-manager = {
        enable = true;
      };
    };
  };
}
