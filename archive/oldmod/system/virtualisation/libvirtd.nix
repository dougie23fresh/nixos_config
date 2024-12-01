{  lib, config, pkgs, ... }:
{
  ########
  # virtualisation
  ########
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    libvirt # A toolkit to interact with the virtualization capabilities of recent versions of Linux and other OSes
  ];
}
