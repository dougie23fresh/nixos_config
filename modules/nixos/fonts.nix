{  pkgs, ... }:
{
  nixpkgs.config.joypixels.acceptLicense = true;
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;
  fonts.enableGhostscriptFonts = true;
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    open-fonts
    #istafonts
    ibm-plex
    fira
    fira-code
    fira-code-symbols
    fira-mono
    font-awesome
    roboto
    openmoji-color
    material-design-icons
    material-icons
    joypixels
    dejavu_fonts
    comfortaa
    comic-neue
    powerline
    inconsolata
    inconsolata-nerdfont
    ubuntu_font_family
    terminus_font
    lexend
    material-design-icons
  ];
  fonts.fontconfig.defaultFonts = {
      serif = ["Lexend"];
      sansSerif = ["Lexend"];
      monospace = ["Fira Code Regular"];
      # emoji = ["Noto Color Emoji"];
    };
}
