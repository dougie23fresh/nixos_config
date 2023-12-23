{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.music.rhythmbox;
in
{
  options.dougieHome.music.rhythmbox = {
    enable = mkEnableOption "rhythmbox";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      rhythmbox
    ];
  };
}
