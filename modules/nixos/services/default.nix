{
  clipboard = import ./clipboard.nix;
  dbus = import ./dbus.nix;
  device-manager = import ./device-manager.nix;
  fingerprint = import ./fingerprint.nix;
  firmware-update = import ./firmware-update.nix;
  flatpak = import ./flatpak.nix;
  hard-drive = import ./hard-drive.nix;
  mdns = import ./mdns.nix;
  openrgb = import ./openrgb.nix;
  openssh = import ./openssh.nix;
  out-of-memory = import ./out-of-memory.nix;
  printing = import ./printing.nix;
  redshift = import ./redshift.nix;
  security = import ./security.nix;
  smartd = import ./smartd.nix;
  ssd = import ./ssd.nix;
  syncthing = import ./syncthing.nix;
  tailscale = import ./tailscale.nix;
  tumbler = import ./tumbler.nix;
  udisk = import ./udisk.nix;
  yubikey = import ./yubikey.nix;
  gitea = import ./gitea.nix;
  nginx = import ./nginx.nix;
  ntfy-sh = import ./ntfy-sh.nix;
  restic = import ./restic.nix;
  technitium-dns-server = import ./technitium-dns-server.nix;

}
