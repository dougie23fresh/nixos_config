{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.image.gwenview;
in
{
  options.dougieHome.image.gwenview = {
    enable = mkEnableOption "gwenview";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libsForQt5.gwenview
    ];
  };
}
