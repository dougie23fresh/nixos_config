{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.image.feh;
in
{
  options.dougieHome.image.feh = {
    enable = mkEnableOption "feh";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      feh
    ];
  };
}
