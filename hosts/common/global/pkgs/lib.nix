{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libverto
    libnotify
  ];
}