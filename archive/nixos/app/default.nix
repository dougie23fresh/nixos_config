{ inputs, outputs, ... }:

{
  imports = [
    ./chromium.nix
    ./dconf.nix
    ./nix-program-settings.nix
    ./partition-manager.nix
    ./steam.nix
    ./utils.nix
  ];
}