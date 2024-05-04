{  pkgs, ... }:
{
  # tailscale
  services.tailscale.enable = true;
  #useRoutingFeatures = "client";
  #extraUpFlags = "--accept-routes";
  environment.systemPackages = with pkgs; [
    tailscale # The node agent for Tailscale, a mesh VPN built on WireGuard

  ];
}
