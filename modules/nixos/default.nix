{ inputs, outputs, ... }:

{
  imports = [
    ./system
    ./services
    ./hardware
    ./wm
    ./user.nix
  ];
}