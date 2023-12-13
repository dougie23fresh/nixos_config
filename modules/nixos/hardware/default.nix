{ inputs, outputs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./brillo.nix
    ./fingerprint.nix
    ./i2c.nix
    ./journald.nix
    ./laptoplid.nix
    ./logitech.nix
    ./openrgb.nix
    ./storage.nix

  ];
}