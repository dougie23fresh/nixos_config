{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.virtualisation.bottles;
in
{
  options.dougieHome.virtualisation.bottles = {
    enable = mkEnableOption "bottles";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bottles
    ];
  };
}

