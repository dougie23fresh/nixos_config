{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.video.vlc;
in
{
  options.dougieHome.video.vlc = {
    enable = mkEnableOption "vlc";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      vlc
    ];
  };
}
