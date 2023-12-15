{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.fwupd;
in
{
  options.dougieHost.services.fwupd = {
    enable = mkDefault false "fwupd";
  };

  config = mkIf cfg.enable {
    services.fwupd.enable = true;
  };
}
