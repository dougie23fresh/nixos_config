{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # app runtime
    appimage-run
    flatpak
  ];
}