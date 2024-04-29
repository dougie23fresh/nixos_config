{ inputs, outputs, pkgs, ... }:
{

  home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Compact-Mauve-dark";
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

}
