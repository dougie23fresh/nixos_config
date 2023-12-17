
{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.starship;
in
{
  options.dougieHome.terminal.starship = {
    enable = mkEnableOption "starship";
  };

  config = mkIf cfg.enable {
    programs.starship.enable = true;
    programs.starship.enableZshIntegration = true;
  };
}
