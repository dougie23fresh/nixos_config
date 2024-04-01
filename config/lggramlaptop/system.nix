{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    #../../modules/nixos
    #../../modules/system/default.nix
    ../../modules/system/hardware-cpu/intel.nix
    ../../modules/system/hardware-gpu/intel.nix
    ../../modules/system/hardware/bluetooth.nix
    ../../modules/system/hardware/firmware.nix
    ../../modules/system/hardware/keyboard-backlight.nix
    ../../modules/system/hardware/logitech.nix
    #../../modules/system/hardware/sscanner.nix
    ../../modules/system/hardware/sound.nix
    ../../modules/system/hardware/power-management.nix

    ../../modules/system/systems.nix # refactor
    ../../modules/system/users.nix
    #../../modules/system/laptop.nix # refactor


    ../../modules/system/default_pkgs.nix # refactor
    ../../modules/system/default_programs.nix # refactor
    ../../modules/system/font.nix # refactor
    #./hardware.nix
    ########### services
    #../../modules/system/services.nix # refactor
    ../../modules/system/services/dbus.nix
    ../../modules/system/services/device-manager.nix
    ../../modules/system/services/fingerprint.nix
    ../../modules/system/services/firmware-update.nix
    ../../modules/system/services/flatpak.nix
    ../../modules/system/services/hard-drive.nix
    ../../modules/system/services/mdns.nix
    ../../modules/system/services/openrgb.nix
    ../../modules/system/services/openssh.nix
    ../../modules/system/services/out-of-memory.nix
    ../../modules/system/services/printing.nix
    #../../modules/system/services/redshift.nix
    ../../modules/system/services/security.nix
    ../../modules/system/services/smartd.nix
    ../../modules/system/services/ssd.nix
    ../../modules/system/services/syncthing.nix
    ../../modules/system/services/tailscale.nix
    ../../modules/system/services/tumbler.nix
    ../../modules/system/services/udisk.nix
    #../../modules/system/services/yubikey.nix
    # virtualisation
    #../../modules/system/virtualisation/distrobox.nix
    #../../modules/system/virtualisation/docker.nix
    #../../modules/system/virtualisation/libvirtd.nix
    #../../modules/system/virtualisation/lxd.nix
    #../../modules/system/virtualisation/waydroid.nix
    # window-manager\
    ../../modules/system/display-manager/gdm.nix

    ../../modules/system/window-manager/default.nix
    ../../modules/system/window-manager/hyprland.nix
    #../../modules/system/window-manager/plasma5.nix
    #../../modules/system/window-manager/plasma6.nix
    ../../modules/system/window-manager/xfce.nix
    ../../modules/system/window-manager/plasma6.nix
    #LXQt
    #Enlightenment
    #budgie

  ];

  system.stateVersion = "23.11";

}
