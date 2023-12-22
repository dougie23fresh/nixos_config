{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.development.kate;
in
{
  options.dougieHome.development.kate = {
    enable = mkEnableOption "kate";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      kate
    ];
  };
}
