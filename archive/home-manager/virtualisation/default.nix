{ inputs, outputs, ... }:

{
  imports = [
    ./flatpak.nix
    ./bottles.nix
    ./wine.nix
  ];
}