{ inputs, outputs, ... }:

{
  imports = [
    ./alacritty.nix
    ./btop.nix
    ./eza.nix
    ./kitty.nix
    ./neofetch.nix
    ./nnn.nix
    ./starship.nix
    ./zsh.nix
  ];
}