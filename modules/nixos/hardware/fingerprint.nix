{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.fingerprint;
in
{
  options.dougieHost.hardware.fingerprint = {
    enable = mkDefault false "fprintd";
    #mkEnableOption (lib.mdDoc "the 1Password GUI application");
  };

  config = mkIf cfg.enable {
    services.fprintd.enable = true;
  };
}