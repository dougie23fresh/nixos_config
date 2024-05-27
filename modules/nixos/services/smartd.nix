#{  lib, config, pkgs, ... }:
{
  # smartd
  services.smartd.enable = true;
  #services.smartd.devices = [{ device = "/dev/sda"; }];
}
