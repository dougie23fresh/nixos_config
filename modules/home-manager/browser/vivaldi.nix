{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.browser.vivaldi;
in
{
  options.dougieHome.termibrowsernal.vivaldi = {
    enable = mkEnableOption "vivaldi";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.vivaldi ];
  }
}
