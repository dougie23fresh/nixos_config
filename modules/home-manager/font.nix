{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.font;
in
{
  options.dougieHome.font = {
    enable = mkEnableOption "font";
  };

  config = mkIf cfg.enable {
    fonts.fonts = with pkgs; [
      nerdfont
      corefonts
      noto-fonts
      open-fonts
      #istafonts

    ];
  }
}
