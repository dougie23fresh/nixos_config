{  lib, config, pkgs, inputs, ... }:
{
  # gdm
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
}
