{  lib, config, pkgs, inputs, ... }:
{
  # gdm
  services.displayManager.sddm.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  #services.xserver.displayManager.sddm.wayland.enable = true;
}
