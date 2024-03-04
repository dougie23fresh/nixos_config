{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.appimage;
in
{
  options.dougieHome.games.appimage = {
    enable = mkEnableOption "appimage";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      appimage-run
    ];
  };
}
