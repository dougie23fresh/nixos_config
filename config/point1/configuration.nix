{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  networking.interfaces.enp2s0.useDHCP = false;
    networking.interfaces.enp2s0.ipv4.addresses = [{
      address = "10.1.1.2";
      prefixLength = 24;
    }];
    networking.defaultGateway  = "10.1.1.1";
    networking.nameservers  = [ "1.1.1.1" ];

  imports = [
    ./hardware.nix

    outputs.nixosModules.hardware.cpu-intel
    outputs.nixosModules.hardware.gpu-intel
    outputs.nixosModules.hardware.firmware

    outputs.nixosModules.users
    outputs.nixosModules.system # refactor
    outputs.nixosModules.fonts # refactor

    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    #outputs.nixosModules.services.dbus
    #outputs.nixosModules.services.device-manager
    #outputs.nixosModules.services.fingerprint
    outputs.nixosModules.services.firmware-update
    #outputs.nixosModules.services.flatpak
    outputs.nixosModules.services.hard-drive
    outputs.nixosModules.services.mdns
    #outputs.nixosModules.services.openrgb
    outputs.nixosModules.services.openssh
    outputs.nixosModules.services.out-of-memory
    #outputs.nixosModules.services.printing
    #outputs.nixosModules..system.services.redshift
    outputs.nixosModules.services.security
    outputs.nixosModules.services.smartd
    outputs.nixosModules.services.ssd
    outputs.nixosModules.services.syncthing
    outputs.nixosModules.services.tailscale
    outputs.nixosModules.services.technitium-dns-server
    #outputs.nixosModules.services.tumbler
    #outputs.nixosModules.services.udisk

    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp
    outputs.nixosModules.base-apps.rust-motd
  ];

  system.stateVersion = "23.11";


}
