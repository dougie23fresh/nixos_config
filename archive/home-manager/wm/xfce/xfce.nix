{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.wm.xfce;
in
{
  options.dougieHome.wm.xfce = {
    enable = mkEnableOption "xfce";
  };

  config = mkIf cfg.enable {

  }
}
