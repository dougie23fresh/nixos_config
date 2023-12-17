{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.games.pcsx2;
in
{
  options.dougieHome.games.pcsx2 = {
    enable = mkEnableOption "pcsx2";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ pcsx2 ];
  }
}
