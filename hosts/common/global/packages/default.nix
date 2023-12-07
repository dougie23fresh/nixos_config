{ inputs, outputs, ... }: {
  imports = [
    # Packages
    ./xserver.nix
    ./xfce.nix
    ./hyprland.nix
  ] 
}