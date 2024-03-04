{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #yubikey
    opensc
    pcsctools
    libu2f-host
    yubikey-personalization
  ];
}