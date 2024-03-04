{ inputs, outputs, ... }: 
{
  imports = [
    ./locale.nix
    ./time.nix
    ./users.nix

  ];
  fonts = {
    fonts = with pkgs; [
      material-design-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      fira-code
      fira-code-symbols
      fira-mono
      nerdfonts
      inter
      fantasque-sans-mono
      comfortaa
      JetBrainsMono
      ibm-plex
    ];
  }
}