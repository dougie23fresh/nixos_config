{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.image.gthumb;
in
{
  options.dougieHome.image.gthumb = {
    enable = mkEnableOption "gthumb";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gthumb
    ];
  };
}
