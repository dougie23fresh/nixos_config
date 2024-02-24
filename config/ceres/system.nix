{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ../../modules/system/default.nix
      ../../modules/system/amd-cpu.nix
      ../../modules/system/nvidia-gpu.nix
  
    ];
  services.udev.extraRules = ''
      # keyboard disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="062a", ATTR{idProduct}=="4101", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="3434", ATTR{idProduct}=="0430", ATTR{power/autosuspend}="-1"
    # mouse disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c548", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c52b ", ATTR{power/autosuspend}="-1"
  '';
  system.stateVersion = "23.05";
}