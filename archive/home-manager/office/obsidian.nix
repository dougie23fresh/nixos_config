{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.office.obsidian;
in
{
  options.dougieHome.office.obsidian = {
    enable = mkEnableOption "obsidian";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      obsidian
    ];
  };
}
