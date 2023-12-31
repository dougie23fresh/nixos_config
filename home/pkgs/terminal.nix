{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    w3m
    neofetch
    fontconfig
    freetype
    wget
    htop
    usbutils
    pciutils
    iputils
    inetutils
    fetchutils
    coreutils
    dmidecode
    util-linux
    wezterm
    nano
    kitty
    alacritty
  ];
}