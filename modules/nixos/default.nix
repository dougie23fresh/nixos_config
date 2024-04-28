{
  # List your module files here

  # Uncategorized
  user = import ./user.nix;
  system = import ./system.nix;
  fonts = import ./fonts.nix;

  apps = import ./apps;
  base-apps = import ./base-apps;
  dev = import ./dev;
  display-manager = import ./display-manager;
  hardware = import ./hardware;
  services = import ./services;
  virtualisation = import ./virtualisation;
  window-manager = import ./window-manager;

}
