{ config, pkgs, ... }:

{
   
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    excludePackages = [ pkgs.xterm ];
    libinput.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}