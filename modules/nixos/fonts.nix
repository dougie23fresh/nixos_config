{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.fonts;
in
{
  options.dougieHost.fonts = {
    enable = mkEnableOption "fonts";
  };

  config = mkIf cfg.enable {
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
      #FantasqueSansMono
      #cascadia-code
      #source-code-pro
      #google-fonts

    ];
    #font.fontconfig = {
    #  hinting.autohint = true;
    #  defaultFonts = {
    #    emoji = [ "OpenMoji Color" ];
    #  };
    #};
    # https://github.com/tolgaerok/nixos-kde/blob/main/core/system/fonts/default.nix
  };
}
