{ config, pkgs, ... }:
{
    services.pcscd.enable = true;
    services.udev.packages = [
      pkgs.libu2f-host
      pkgs.yubikey-personalization
    ];
}