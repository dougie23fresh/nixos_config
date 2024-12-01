{  lib, config, pkgs, ... }:
{
  # tailscale
  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [
    tailscale # The node agent for Tailscale, a mesh VPN built on WireGuard

  ];
}
