{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.dougieHost.wm.theme;
in
{
  options.dougieHost.wm.theme = {
    enable = mkEnableOption "theme";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      iconTheme.package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
      iconTheme.name = "Papirus-Dark";
      theme.package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
      theme.name = "Catppuccin-Mocha-Standard-Mauve-dark";
      cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
      cursorTheme.name = "Catppuccin-Mocha-Dark-Cursors";
      cursorTheme.size = 24;
      font.name = "Iosevka Comfy";
    };
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
    home.pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
