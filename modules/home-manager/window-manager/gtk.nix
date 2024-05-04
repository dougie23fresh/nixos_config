{ pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "Ubuntu";
      size = 12;
      package = pkgs.ubuntu_font_family;
    };

    theme = {
      name = "Catppuccin-Macchiato-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ ];
        variant = "macchiato";
      };
    };
    cursorTheme = {
      #name = "Catppuccin-Macchiato-Mauve-Cursors";
      #package = pkgs.catppuccin-cursors.macchiatoMauve;
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Snow";
      #name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
      size = 36;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };

  };
}
