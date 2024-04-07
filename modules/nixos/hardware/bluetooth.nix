#{  lib, config, pkgs, ... }:
{
  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";
  hardware.bluetooth.settings.General.Experimental = true;
  services.blueman.enable = true;

}
