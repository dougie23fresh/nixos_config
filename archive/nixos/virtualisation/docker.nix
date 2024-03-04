{ config, lib, pkgs, username, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    autoPrune.enable = true;
  };
  users.users.${username}.extraGroups = [ "docker" ];
}