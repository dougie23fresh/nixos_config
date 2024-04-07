#{  lib, config, pkgs, ... }:
{

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    # libratbag
    piper
    logitech-udev-rules # Linux devices manager for the Logitech Unifying Receiver
    libratbag # Configuration library for gaming mice
  ];
}
