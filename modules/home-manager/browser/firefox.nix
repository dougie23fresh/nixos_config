{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.browser.firefox;
in
{
  options.dougieHome.browser.firefox = {
    enable = mkEnableOption "firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox.enable = true;
  };
}
