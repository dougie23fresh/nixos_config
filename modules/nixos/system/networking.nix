{ lib, config, pkgs, ...}:
with lib;
let 
  cfg = config.dougieHost.system.networking;
in
{
  options.dougieHost.system.networking = {
    enable = mkEnableOption "Whether or not to enable networking support";
    hostName = mkOption {
      type = types.str;
      default = "nixos";
    };
  };

  config = mkIf cfg.enable {
    #dougienix.user.extraGroups = [ "networkmanager" ];
    networking = {
      hostName = cfg.hostName;
      networkmanager = {
        enable = true;
        # appendNameservers = [ "1.1.1.1" "8.8.8.8" ];
        # Prevent fragmentation and reassembly, which can improve network performance
        connectionConfig = {
          "ethernet.mtu" = 1462;
          "wifi.mtu" = 1462;
        };
      };
      timeServers = [
        "0.nixos.pool.ntp.org"
        "1.nixos.pool.ntp.org"
        "2.nixos.pool.ntp.org"
        "3.nixos.pool.ntp.org"
        "time.google.com"
        "time2.google.com"
        "time3.google.com"
        "time4.google.com"
      ];
    };
    # Install network time protocol
    environment.systemPackages = with pkgs; [
      ntp
    ];
    # Wifi network monitor connector
    services.dbus.packages = [ pkgs.miraclecast ];
  };
}