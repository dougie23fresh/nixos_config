{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # font
    terminus-nerdfont
    fontconfig
    freetype
    dejavu_fonts
    gentium
    yanone-kaffeesatz
    emojione
    #fwupd
    firmware-manager
  ];
}