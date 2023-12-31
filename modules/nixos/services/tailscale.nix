{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.tailscale;
in
{
  options.dougieHost.services.tailscale = {
    enable = mkEnableOption "tailscale";
  };

  config = mkIf cfg.enable {
    services.tailscale.enable = true;
    environment.systemPackages = with pkgs; [ tailscale ];

  };
  
}