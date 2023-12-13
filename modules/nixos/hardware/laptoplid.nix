{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.laptoplid;
in
{
  options.dougieHost.hardware.laptoplid = {
    enable = mkBoolOpt false "laptoplid";
  };

  config = mkIf cfg.enable {
    services.logind.lidSwitch = "suspend";
    services.logind.lidSwitchExternalPower = "lock";
  };
}