{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.openssh;
in
{
  options.dougieHost.services.openssh = {
    enable = mkEnableOption "openssh";
  };

  config = mkIf cfg.enable {
    services.openssh.enable = true;
    #package = pkgs.gnome3.gvfs;
  };
}
