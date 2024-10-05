{  inputs, pkgs, ... }:
{
  services.technitium-dns-server.enable = true;
  # services.technitium-dns-server.package = pkgs.technitium-dns-server;
  services.technitium-dns-server.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.technitium-dns-server;
}
