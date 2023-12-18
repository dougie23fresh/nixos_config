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
    fonts.packages = with pkgs; [
      nerdfonts
      corefonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      open-fonts
      #istafonts
      ibm-plex
      fira-code
      fira-code-symbols
      font-awesome
      #cascadia-code
      #source-code-pro
      #google-fonts

    ];
  };
}
