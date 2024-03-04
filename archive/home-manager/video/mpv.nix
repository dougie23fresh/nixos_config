{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.video.mpv;
in
{
  options.dougieHome.video.mpv = {
    enable = mkEnableOption "mpv";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      mpv
    ];
  };
}
