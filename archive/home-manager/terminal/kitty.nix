{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.kitty;
in
{
  options.dougieHome.terminal.kitty = {
    enable = mkEnableOption "kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty.enable = true;
    programs.kitty.settings = {
      background_opacity = lib.mkForce "0.65";
    };
    home.packages = with pkgs; [
      kitty
    ];
  };
}
