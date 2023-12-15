{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.dbus;
in
{
  options.dougieHost.services.dbus = {
    enable = mkEnableOption "dbus";
  };

  config = mkIf cfg.enable {
    services.dbus.enable = true;
  };
}

