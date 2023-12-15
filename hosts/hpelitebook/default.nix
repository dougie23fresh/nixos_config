{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules
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
  dougieHost.fwupd.enable = true;
  dougieHost.fstrim.enable = true;
  dougieHost.gvfs.enable = true;
  dougieHost.pipewire.enable = true;
  dougieHost.printing.enable = true;
  dougieHost.redshift.enable = true;
  dougieHost.syncthing.enable = true;
  dougieHost.tailscale.enable = true;
  dougieHost.tumbler.enable = true;
  dougieHost.yubikey.enable = true;

  #######
  # hardware
  #######
  dougieHost.hardware.yubikey.enable = true;
  dougieHost.hardware.brillo.enable = true;
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


  # user
  dougieHost.user.enable = true;
  dougieHost.user.userName = "melvin";




  system.stateVersion = "23.11";




}