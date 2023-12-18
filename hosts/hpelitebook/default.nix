{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos
  ];
  ######
  # system
  ######

  # Bootloader
  dougieHost.system.boot.enable = true;
  # networking
  dougieHost.system.networking.enable = true;
  dougieHost.system.networking.hostName = "hpelitebook";
  # time
  dougieHost.system.time.enable = true;
  # location
  dougieHost.system.location.enable = true;
  # locale
  dougieHost.system.locale.enable = true;
  # sound
  dougieHost.system.sound.enable = true;
  # nix settings
  dougieHost.system.nixSettings.enable = true;
  

  #######
  # services
  #######

  # avahi
  dougieHost.services.avahi.enable = true;
  # battery
  dougieHost.services.battery.enable = true;
  dougieHost.services.dbus.enable = true;
  dougieHost.services.fwupd.enable = true;
  dougieHost.services.fstrim.enable = true;
  dougieHost.services.gvfs.enable = true;
  dougieHost.services.pipewire.enable = true;
  dougieHost.services.printing.enable = true;
  dougieHost.services.redshift.enable = true;
  dougieHost.services.syncthing.enable = true;
  dougieHost.services.tailscale.enable = true;
  dougieHost.services.tumbler.enable = true;
  dougieHost.services.yubikey.enable = true;

  #######
  # hardware
  #######
  dougieHost.hardware.bluetooth.enable = true;
  #dougieHost.hardware.brillo.enable = true;
  #dougieHost.hardware.fingerprint.enable = true;
  #dougieHost.hardware.i2c.enable = true;
  #dougieHost.hardware.journald.enable = true;
  dougieHost.hardware.laptoplid.enable = true;
  dougieHost.hardware.logitech.enable = true;
  #dougieHost.hardware.openrgb.enable = true;
  #dougieHost.hardware.storage.enable = true;

  # wm
  dougieHost.wm.gdm.enable = true;
  dougieHost.wm.xfce.enable = true;
  dougieHost.wm.wayland.enable = true;
  dougieHost.wm.hyprland.enable = true;
  dougieHost.wm.sway.enable = true;
  
  # fonts
  #dougieHost.fonts.enable = true;
  # user
  dougieHost.user.enable = true;
  dougieHost.user.userName = "melvin";
  dougieHost.user.userDescription = "Melvin";

  system.stateVersion = "23.11";

}