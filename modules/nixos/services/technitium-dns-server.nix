{  pkgs, ... }:
{
  services.technitium-dns-server.enable = true;
  # services.technitium-dns-server.package = pkgs.technitium-dns-server;
  services.technitium-dns-server.package = pkgsun.technitium-dns-server;
}
