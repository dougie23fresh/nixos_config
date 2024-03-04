{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.home-manager;
in
{
  options.dougieHome.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager.enable = true;
  };
}
