{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.protontricks;
in
{
  options.dougieHome.games.protontricks = {
    enable = mkEnableOption "protontricks";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      vkd3d
      vkd3d-proton
      protontricks
    ];
  };
}
