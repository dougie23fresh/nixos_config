
{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.neofetch;
in
{
  options.dougieHome.terminal.neofetch = {
    enable = mkEnableOption "neofetch";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      neofetch
    ];
  }
}
