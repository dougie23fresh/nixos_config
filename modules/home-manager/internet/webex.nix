{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.internet.webex;
in
{
  options.dougieHome.internet.webex = {
    enable = mkEnableOption "webex";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      webex
    ];
  };
}
