{ inputs, outputs, ... }: {
  imports = [
    # Packages
    ./browser.nix
    ./fonts.nix
    ./games.nix
    ./lib.nix
    ./music.nix
    ./network.nix
    ./office.nix
    ./picture.nix
    ./programing.nix
    ./runtime.nix
    ./terminal.nix
    ./themes.nix
    ./utils.nix
    ./video.nix
    ./work.nix
    ./xfce.nix
    ./xorg.nix
    ./yubikey.nix

  ];
}