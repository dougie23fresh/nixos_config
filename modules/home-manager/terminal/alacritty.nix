{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.terminal.alacritty;
in
{
  options.dougieHome.terminal.alacritty = {
    enable = mkEnableOption "alacritty";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      alacritty
    ];
    programs.alacritty.enable = true;
    programs.alacritty.settings = {
      window.opacity = lib.mkForce 0.65;
    };
  }
}
