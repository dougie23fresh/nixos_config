{ inputs, outputs, ... }:

{
  imports = [
    ./avahi.nix
    ./battery.nix
    ./dbus.nix
    ./fwupd.nix
    ./gvfs.nix
    ./fstrim.nix
    ./pipewire.nix
    ./printing.nix
    ./redshift.nix
    ./syncthing.nix
    ./tailscale.nix
    ./tumbler.nix
    ./yubikey.nix
    ./earlyoom.nix

  ];
}