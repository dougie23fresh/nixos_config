{  lib, config, pkgs, ... }:
{
  ########
  # virtualisation
  ########
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

}
