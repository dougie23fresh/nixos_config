#{  lib, config, pkgs, inputs, ... }:
{
  # gdm
  #services.xserver.displayManager.sddm.enable = true;
  services.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
