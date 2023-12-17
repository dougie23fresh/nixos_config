{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.btop;
in
{
  options.dougieHome.terminal.btop = {
    enable = mkEnableOption "btop";
  };

  config = mkIf cfg.enable {
    programs.btop.enable = true;
  }
}
