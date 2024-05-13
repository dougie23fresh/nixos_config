{
  wm = import ./wm.nix;
  hyprland = import ./hyprland.nix;
  fuzzel = import ./fuzzel.nix;
  waybar = import ./waybar.nix;
  qt = import ./qt.nix;
  gtk = import ./gtk.nix;
  applets = import ./applets.nix;
  labwc = import ./labwc.nix;
  #xdg = import ./xdg.nix;
}
