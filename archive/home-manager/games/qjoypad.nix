{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.qjoypad;
in
{
  options.dougieHome.games.qjoypad = {
    enable = mkEnableOption "qjoypad";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ qjoypad ];
  };
}
