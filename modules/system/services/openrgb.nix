{  lib, config, pkgs, ... }:
{
  # openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "amd";
}
