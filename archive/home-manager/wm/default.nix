{ inputs, outputs, ... }:

{
  imports = [
    #./xfce/xfce.nix
    ./hyprland/hyprland.nix
  ];
}