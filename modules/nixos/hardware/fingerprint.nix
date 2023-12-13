{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.fingerprint;
in
{
  options.dougieHost.hardware.fingerprint = {
    enable = mkBoolOpt false "fprintd";
  };

  config = mkIf cfg.enable {
    services.fprintd.enable = true;
  };
}