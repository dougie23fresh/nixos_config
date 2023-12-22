{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.video.v4l;
in
{
  options.dougieHome.video.v4l = {
    enable = mkEnableOption "v4l";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      v4l-utils
    ];
  };
}
