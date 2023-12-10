{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # network
    tailscale
    tailscale-systray
  ];
}