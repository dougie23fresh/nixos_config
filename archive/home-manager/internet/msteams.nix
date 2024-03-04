{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.internet.msteams;
in
{
  options.dougieHome.internet.msteams = {
    enable = mkEnableOption "msteams";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      modules/home-manager/internet/webex.nix
    ];
  };
}
