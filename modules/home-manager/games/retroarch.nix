{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.retroarch;
in
{
  options.dougieHome.games.retroarch = {
    enable = mkEnableOption "retroarch";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      (retroarch.override {
        cores = with pkgs.libretro; [
          mgba
          desmume
          dolphin
          citra
          genesis-plus-gx
        ];
      });
    ];
  };
}
