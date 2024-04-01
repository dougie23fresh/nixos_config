{  lib, config, pkgs, inputs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
  ];
}
