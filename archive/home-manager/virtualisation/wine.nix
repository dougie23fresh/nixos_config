{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.winetricks;
in
{
  options.dougieHome.games.winetricks = {
    enable = mkEnableOption "winetricks";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      #winePackages.waylandFull
      wineWowPackages.waylandFull
      wine-wayland
      winetricks
      mono
      mono4
      mono5
    ];
  };
}
