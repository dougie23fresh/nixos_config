{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.dconf;
in
{
  options.dougieHost.hardware.dconf  = {
    enable = mkEnableOption "dconf";
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
    programs.mtr.enable = true;
  };
}