{ inputs, outputs, ... }:

{
  imports = [
    ./system
    ./services
    ./hardware
    ./wm
    ./app
    ./users.nix
    ./fonts.nix
    ./tools.nix
  ];
}