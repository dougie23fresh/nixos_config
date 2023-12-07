{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../modules/system.nix
      ../../modules/i3.nix

      ./hardware-configuration.nix
      ../common/global
    ];

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  # Networking
  networking.hostName = "ceres"; # Define your hostname.
  networking.networkmanager.enable = true;

  system.stateVersion = "23.05";
}