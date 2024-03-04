{ inputs, outputs, ... }:

{
  imports = [
    ./xfce.nix
    ./gdm.nix
    ./wayland.nix
    ./sway.nix
    ./hyprland.nix
  ];
}