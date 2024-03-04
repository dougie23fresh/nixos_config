{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHomejj.font;
in
{
  options.dougieHomejj.font = {
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
  };
}
