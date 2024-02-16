{ inputs, outputs, ... }:

{
  imports = [
    ./avahi.nix
    ./battery.nix
    ./dbus.nix
    ./earlyoom.nix
    ./fstrim.nix
    ./fwupd.nix
    ./gvfs.nix
    ./openssh.nix
    ./pipewire.nix
    ./printing.nix
    ./redshift.nix
    ./syncthing.nix
    ./tailscale.nix
    ./tumbler.nix
    ./udev.nix
    ./udisks2.nix
    ./xdg-portal.nix
    ./yubikey.nix

  ];
}