{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.office.dia;
in
{
  options.dougieHome.office.dia = {
    enable = mkEnableOption "dia";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      dia
    ];
  };
}
