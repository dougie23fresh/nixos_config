{ inputs, outputs, ... }:

{
  imports = [
    ./user.nix
    ./home-manager.nix
    ./wm
    ./browser
    ./terminal
    ./remote
  ];
}