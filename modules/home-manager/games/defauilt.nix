{ inputs, outputs, ... }:

{
  imports = [
    ./lutris.nix
    ./pcsx2.nix
    ./prismlauncher.nix
    ./protontricks.nix
    ./steam.nix
    ./retroarch.nix
  ];
}
