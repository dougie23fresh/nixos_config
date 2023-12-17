{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.virtualisation.flatpak;
in
{
  options.dougieHome.virtualisation.flatpak = {
    enable = mkEnableOption "flatpak";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.flatpak ];
    home.sessionVariables = {
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # lets flatpak work
    };
  };
}
