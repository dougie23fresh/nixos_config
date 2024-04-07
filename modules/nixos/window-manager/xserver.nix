#{  pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
  services.xserver.xkb.options = "caps:escape";
  services.xserver.excludePackages = [ pkgs.xterm ];
  #services.xserver.libinput.enable = true;
}
