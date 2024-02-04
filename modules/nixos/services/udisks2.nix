{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.udisks2;
in
{
  options.dougieHost.services.udisks2 = {
    enable = mkEnableOption "udisks2 ";
  };

  config = mkIf cfg.enable {
    # Automatically detect and manage storage devices connected to your  system
    services = {
      udisks2 = {
        enable = true;
      };

      devmon = {
        enable = true;
      };
    };
  };
}

