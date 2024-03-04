{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.office.onlyoffice;
in
{
  options.dougieHome.office.onlyoffice = {
    enable = mkEnableOption "onlyoffice";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      onlyoffice-bin
    ];
  };
}
