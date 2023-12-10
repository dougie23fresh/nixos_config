{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    obsidian
    dia
    onlyoffice-bin
  ];
}