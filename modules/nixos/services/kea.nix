{  pkgs, ... }:
{
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = [ "br0" ];
      };
      lease-database = {
        name = "/var/lib/kea/dhcp4.leases";
        persist = true;
        type = "memfile";
      };
      option-data = [
        {
          name = "domain-name-servers";
          data = "10.1.1.2, 10.1.1.3";
          always-send = true;
        }
        {
          name = "routers";
          data = "10.1.1.1";
        }
        {
          name = "domain-name";
          data = "dougie23fresh.com";
        }
      ];

      rebind-timer = 2000;
      renew-timer = 1000;
      valid-lifetime = 4000;

      subnet4 = [
        {
          id = "lan";
          pools = [
            {
              pool = "10.1.1.100 - 10.1.1.230";
            }
          ];
          subnet = "10.1.1.0/24";
          reservations = [
            {
              hw-address = settings.mac-nixos;
              ip-address = settings.ip-nixos;
            }
            {
              hw-address = settings.mac-raspberrypi;
              ip-address = settings.ip-raspberrypi;
            }
          ];
        }
      ];
    };
  };
}
