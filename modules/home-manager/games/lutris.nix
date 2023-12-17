{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.lutris;
in
{
  options.dougieHome.games.lutris = {
    enable = mkEnableOption "lutris";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris
      openssl
      gnome.zenity
    ];
  }
}
