{ config, lib, pkgs, ... }:
{
    home.packages = with pkgs; [
    ranger
    ripdrag
    highlight
    (pkgs.writeScriptBin "cbx" myCbxScript)
  ];
  xdg.mimeApps.associations.added = {
    "inode/directory" = "ranger.desktop";
  };
# https://github.com/librephoenix/nixos-config/blob/main/user/app/ranger/ranger.nix
}