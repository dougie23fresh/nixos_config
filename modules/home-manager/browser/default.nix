{ inputs, outputs, ... }:

{
  imports = [
    ./brave.nix
    ./chromium.nix
    ./firefox.nix
    ./librewolf.nix
    ./vivaldi.nix.nix
  ];
}