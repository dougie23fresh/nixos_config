{
  distrobox = import ./distrobox.nix;
  docker = import ./docker.nix;
  libvirtd = import ./libvirtd.nix;
  lxd = import ./lxd.nix;
  waydroid = import ./waydroid.nix;
}
