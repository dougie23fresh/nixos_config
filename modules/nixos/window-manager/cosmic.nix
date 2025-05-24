{  pkgs, pkgs-unstable, ... }:
{
  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;
}
