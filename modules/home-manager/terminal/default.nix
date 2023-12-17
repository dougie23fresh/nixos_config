{ inputs, outputs, ... }:

{
  imports = [
    ./system
    ./services
    ./hardware
    ./wm
    ./users.nix
  ];
}