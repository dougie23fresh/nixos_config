{ inputs, outputs, ... }: {
  imports = [
    # Programs
    ./backlight.nix
    ./chromium.nix
    ./git.nix
    ./htop.nix
    #./neovim.nix
    ./steam.nix
    ./thunar.nix
    ./zsh.nix
  ];
}