{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.gvfs;
in
{
  options.dougieHost.services.gvfs = {
    enable = mkEnableOption "gvfs";
  };

  config = mkIf cfg.enable {
    services.gvfs.enable = true;
    #package = pkgs.gnome3.gvfs;
  };
}
