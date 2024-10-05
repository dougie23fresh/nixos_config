 {  lib, config, pkgs, ... }:
{
  hardware.sane.enable = true;
  users.users.melvin.extraGroups = [ "scanner" "lp" ];
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.udev.packages = [ pkgs.sane-airscan ];
  services.ipp-usb.enable=true;
  environment.systemPackages = with pkgs; [
    libsForQt5.skanlite
  ];
}
