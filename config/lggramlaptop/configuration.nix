{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./hardware.nix
    inputs.catppuccin.nixosModules.catppuccin
    outputs.nixosModules.hardware.bluetooth
    outputs.nixosModules.hardware.cpu-intel
    outputs.nixosModules.hardware.gpu-intel
    outputs.nixosModules.hardware.firmware
    outputs.nixosModules.hardware.keyboard-backlight
    outputs.nixosModules.hardware.logitech
    #outputs.nixosModules.hardware.scanner
    outputs.nixosModules.hardware.power-management
    outputs.nixosModules.hardware.sound


    outputs.nixosModules.users
    outputs.nixosModules.system # refactor
    outputs.nixosModules.fonts # refactor


    #outputs.nixosModules.system.default_pkgs.nix # refactor
    #outputs.nixosModules.system.default_programs.nix # refactor
    #outputs.nixosModules.system.font.nix # refactor
    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    outputs.nixosModules.services.clipboard
    outputs.nixosModules.services.dbus
    outputs.nixosModules.services.device-manager
    outputs.nixosModules.services.fingerprint
    outputs.nixosModules.services.firmware-update
    outputs.nixosModules.services.flatpak
    outputs.nixosModules.services.hard-drive
    outputs.nixosModules.services.mdns
    outputs.nixosModules.services.openrgb
    outputs.nixosModules.services.openssh
    outputs.nixosModules.services.out-of-memory
    outputs.nixosModules.services.printing
    #outputs.nixosModules..system.services.redshift
    outputs.nixosModules.services.security
    outputs.nixosModules.services.smartd
    outputs.nixosModules.services.ssd
    outputs.nixosModules.services.syncthing
    outputs.nixosModules.services.tailscale
    outputs.nixosModules.services.tumbler
    outputs.nixosModules.services.udisk
    #outputs.nixosModules.services.yubikey
    # virtualisation
    #outputs.nixosModules..system.virtualisation.distrobox
    #outputs.nixosModules..system.virtualisation.docker
    #outputs.nixosModules..system.virtualisation.libvirtd
    #outputs.nixosModules..system.virtualisation.lxd
    #outputs.nixosModules..system.virtualisation.waydroid
    # window-manager\
    #outputs.nixosModules..system.display-manager.gdm
    outputs.nixosModules.display-manager.sddm

    outputs.nixosModules.window-manager.xserver
    #outputs.nixosModules.window-manager.hyprland
    #outputs.nixosModules..system.window-manager.plasma5
    #outputs.nixosModules..system.window-manager.plasma6
    outputs.nixosModules.window-manager.xfce
    outputs.nixosModules.window-manager.plasma6
    outputs.nixosModules.window-manager.xdg
    #LXQt
    #Enlightenment
    #budgie
    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp
  ];

  catppuccin.flavour = "macchiato";
  system.stateVersion = "23.11";


}
