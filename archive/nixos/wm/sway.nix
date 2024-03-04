{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.sway;
in
{
  options.dougieHost.wm.sway = {
    enable = mkEnableOption "sway";
  };

  config = mkIf cfg.enable {
    programs.sway.enable = true;
  };
}