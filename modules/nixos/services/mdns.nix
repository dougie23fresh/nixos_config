{#  lib, config, pkgs, ... }:
{
  # avahi
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
}
