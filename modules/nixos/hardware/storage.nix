{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.storage;
in
{
  options.dougieHost.hardware.storage = {
    enable = mkDefault false "storage";
  };

  config = mkIf cfg.enable {
    boot.supportedFilesystems = [ 
      ntfs
      btrfs
      cifs
      exfat
      ext
      nfs
      vfat
    ];
  };
}