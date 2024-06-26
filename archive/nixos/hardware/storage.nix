{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.storage;
in
{
  options.dougieHost.hardware.storage = {
    enable = mkEnableOption "storage";
  };

  config = mkIf cfg.enable {
    programs.fuse.userAllowOther = true;
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