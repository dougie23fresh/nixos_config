{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # themes
    plano-theme
    zuki-themes
    stilo-themes
    amber-theme
    numix-gtk-theme
    catppuccin-gtk
    gnome-icon-theme
    vimix-icon-theme
    tela-icon-theme
    pop-icon-theme
    qogir-icon-theme
    numix-icon-theme
    pop-gtk-theme
    colloid-gtk-theme
    fluent-gtk-theme
    arc-theme
    venta
    qogir-theme
    nordic
  ];
}