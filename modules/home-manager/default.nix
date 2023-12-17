{ inputs, outputs, ... }:

{
  imports = [
    ./user.nix
    ./home-manager.nix
    ./font.nix
    ./wm
  ];
}