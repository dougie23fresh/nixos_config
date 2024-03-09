{  lib, config, pkgs, ... }:
{
  ########
  # hardware
  ########
  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";
  hardware.bluetooth.settings.General.Experimental = true;
  services.blueman.enable = true;
  # brillo - Backlight and Keyboard LED control tool.
  hardware.brillo.enable = true;
  # i2c - i2c devices Qsupport
  hardware.i2c.enable = true;
  # logitech
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  # pulseaudio
  hardware.pulseaudio.enable = false;
  # RedistributableFirmware
  hardware.enableRedistributableFirmware = true;
  # sane
  hardware.sane = {
    enable = true;
    #extraBackends = with pkgs; [ hplipWithPlugin sane-airscan ];
    extraBackends = with pkgs; [
      sane-airscan
      epkowa
    ];
    disabledDefaultBackends = ["escl"];
  };
}
