{ inputs, outputs, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./location.nix
    ./multithreading.nix
    ./networking.nix
    ./nixsettings.nix
    ./sound.nix
    ./time.nix
  ];
}