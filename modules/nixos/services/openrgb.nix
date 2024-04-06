{  lib, config, pkgs, ... }:
{
  # openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "amd";

  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins # Open source RGB lighting control
  ];
}
