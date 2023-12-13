{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.yubikey;
in
{
  options.dougieHost.services.yubikey = {
    enable = mkBoolOpt false "yubikey";
  };

  config = mkIf cfg.enable {
    services.pcscd.enable = true;
    services.udev.packages = [
      pkgs.libu2f-host
      pkgs.yubikey-personalization
    ];

  };
}