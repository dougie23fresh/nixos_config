{
  archives = import ./archives.nix;
  base = import ./base.nix;
  network = import ./network.nix;
  nixapp = import ./nixapp.nix;
  rust-motd = import ./rust-motd.nix;
}
