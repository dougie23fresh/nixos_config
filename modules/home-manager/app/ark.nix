{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.ark;
in
{
  options.dougieHost.app.ark = {
    enable = mkEnableOption "ark";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.ark ];
  };
}