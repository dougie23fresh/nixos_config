{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.eza;
in
{
  options.dougieHome.terminal.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf cfg.enable {
    programs.eza.enable = true;
    programs.eza.enableAliases = true;
  };
}
