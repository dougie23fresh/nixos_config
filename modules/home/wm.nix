{ inputs, outputs, ... }:
{

  imports = [
    ./wm_hyperland.nix
    ./wm_hyperland_config.nix
    ./wm_hyperland_waybar.nix
    ./wm.nix
  ];
  home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Compact-Mauve-dark";
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  programs.git.enable = true;
  programs.git.userName = userSettings.name;
  programs.git.userEmail = userSettings.email;
  home.packages = [ pkgs.git ];
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
      name = "Catppuccin-Macchiato-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
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
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
    };
  };

  xdg = {
    portal = {
      enable = true;
      config.common.default = "hyprland";
      extraPortals = with pkgs; [
        #xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
        #libsForQt5.xdg-desktop-portal-kde
      ];
    };
  };
}