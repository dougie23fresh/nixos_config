{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.journald;
in
{
  options.dougieHost.hardware.journald = {
    enable = mkEnableOption "journald";
  };

  config = mkIf cfg.enable {
    services.journald.extraConfig = "SystemMaxUse=250M\nSystemMaxFiles=10";
    services.journald.rateLimitBurst = 800;
    services.journald.rateLimitInterval = "5s";
  };
}