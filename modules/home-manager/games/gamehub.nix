{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.gamehub;
in
{
  options.dougieHome.games.gamehub = {
    enable = mkEnableOption "gamehub";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ gamehub ];
  };
}
