{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.nnn;
in
{
  options.dougieHome.terminal.nnn = {
    enable = mkEnableOption "nnn";
  };

  config = mkIf cfg.enable {
    programs.nnn.enable = true;
  };
}
