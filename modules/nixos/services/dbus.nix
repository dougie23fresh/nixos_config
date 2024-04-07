#{ pkgs, ... }:
{
  # dbus
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
    dconf
    gcr
    udisks2
  ];
}
