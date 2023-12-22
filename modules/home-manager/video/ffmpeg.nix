{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.video.ffmpeg;
in
{
  options.dougieHome.video.ffmpeg = {
    enable = mkEnableOption "ffmpeg";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      ffmpeg
    ];
  };
}
