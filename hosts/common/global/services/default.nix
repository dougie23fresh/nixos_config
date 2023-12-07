{ inputs, outputs, ... }: {
  imports = [
    
    # Services
    ./avahi.nix
    ./battery.nix
    ./dbus.nix
    ./fwupd.nix
    ./gvfs.nix
    ./pipewire.nix
    ./printing.nix
    ./redshift.nix
    ./syncthing.nix
    ./tailscale.nix
    ./tumbler.nix
    ./yubikey.nix
  ];
}