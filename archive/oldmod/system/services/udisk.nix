 {  lib, config, pkgs, ... }:
{
  # udisk2
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
}
