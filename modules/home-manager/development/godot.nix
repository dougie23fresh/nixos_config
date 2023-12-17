{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.godot;
in
{
  options.dougieHome.development.godot = {
    enable = mkEnableOption "godot";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      godot_4
    ];
  }
}
