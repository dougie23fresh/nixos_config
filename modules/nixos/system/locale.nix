{ options, config, pkgs, lib, ... }:

with lib;
with lib.plusultra;
let cfg = config.plusultra.system.locale;
in
{
  options.plusultra.system.locale = with types; {
    enable = mkBoolOpt false "Whether or not to manage locale settings.";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";

    console = { keyMap = mkForce "us"; };
  };
}

{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.plusultra; let
  cfg = config.plusultra.system.fonts;
in {
  options.plusultra.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    fonts = mkOpt (listOf package) [] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = with pkgs; [font-manager];

    fonts.packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-emoji
        (nerdfonts.override {fonts = ["Hack"];})
      ]
      ++ cfg.fonts;
  };
}