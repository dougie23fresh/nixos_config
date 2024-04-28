{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  catppuccin.flavour = "macchiato";
  imports = [
    ./hardware.nix
    outputs.nixosModules.systemhardware.cpu-intel
    outputs.nixosModules.systemhardware.gpu-intel
    outputs.nixosModules.system.hardware.bluetooth
    outputs.nixosModules.system.hardware.firmware
    outputs.nixosModules.system.hardware.keyboard-backlight
    outputs.nixosModules.system.hardware.logitech
    #outputs.nixosModules..system.hardware.sscanner
    outputs.nixosModules.system.hardware.sound
    outputs.nixosModules.system.hardware.power-management

    outputs.nixosModules.system.systems.nix # refactor
    outputs.nixosModules.system.users
    #outputs.nixosModules..system.laptop.nix # refactor


    outputs.nixosModules.system.default_pkgs.nix # refactor
    outputs.nixosModules.system.default_programs.nix # refactor
    outputs.nixosModules.system.font.nix # refactor
    #..hardware
    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    outputs.nixosModules.system.services.dbus
    outputs.nixosModules.system.services.device-manager
    outputs.nixosModules.system.services.fingerprint
    outputs.nixosModules.system.services.firmware-update
    outputs.nixosModules.system.services.flatpak
    outputs.nixosModules.system.services.hard-drive
    outputs.nixosModules.system.services.mdns
    outputs.nixosModules.system.services.openrgb
    outputs.nixosModules.system.services.openssh
    outputs.nixosModules.system.services.out-of-memory
    outputs.nixosModules.system.services.printing
    #outputs.nixosModules..system.services.redshift
    outputs.nixosModules.system.services.security
    outputs.nixosModules.system.services.smartd
    outputs.nixosModules.system.services.ssd
    outputs.nixosModules.system.services.syncthing
    outputs.nixosModules.system.services.tailscale
    outputs.nixosModules.system.services.tumbler
    outputs.nixosModules.system.services.udisk
    #outputs.nixosModules..system.services.yubikey
    # virtualisation
    #outputs.nixosModules..system.virtualisation.distrobox
    #outputs.nixosModules..system.virtualisation.docker
    #outputs.nixosModules..system.virtualisation.libvirtd
    #outputs.nixosModules..system.virtualisation.lxd
    #outputs.nixosModules..system.virtualisation.waydroid
    # window-manager\
    #outputs.nixosModules..system.display-manager.gdm
    outputs.nixosModules.system.display-manager.sddm

    outputs.nixosModules.system.window-manager.default
    outputs.nixosModules.system.window-manager.hyprland
    #outputs.nixosModules..system.window-manager.plasma5
    #outputs.nixosModules..system.window-manager.plasma6
    outputs.nixosModules.system.window-manager.xfce
    outputs.nixosModules.system.window-manager.plasma6
    #LXQt
    #Enlightenment
    #budgie
    outputs.nixosModules.system.base-apps.archives
    outputs.nixosModules.system.base-apps.base
    outputs.nixosModules.system.base-apps.network
    outputs.nixosModules.system.base-apps.nixapp

  ];

  system.stateVersion = "23.11";


}
