{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.wm.xfce;
in
{
  options.dougieHost.wm.xfce = {
    enable = mkBoolOpt false "xfce";
  };

  config = mkIf cfg.enable {
    services.xserver.desktopManager.xfce.enable = true;
  };
}