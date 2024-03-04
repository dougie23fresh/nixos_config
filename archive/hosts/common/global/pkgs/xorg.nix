{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
  ];
}