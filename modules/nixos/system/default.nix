{ inputs, outputs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./sound.nix
    ./time.nix
    ./location.nix
    ./locale.nix
    ./nixsettings.nix
  ];
}