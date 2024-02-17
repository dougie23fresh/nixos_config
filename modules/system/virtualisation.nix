{  lib, config, pkgs, ... }:
{
  ########
  # virtualisation
  ########
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.lxd.enable = true;
  # add distrobox
  # add Docker
}