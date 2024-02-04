{ inputs, outputs, ... }:

{
  imports = [
    ./utils.nix
    ./chromium.nix
    ./dconf.nix
    ./nix-program-settings.nix
    ./steam.nix
    ./partition-manager.nix
  ];
}