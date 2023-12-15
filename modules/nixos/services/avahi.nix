{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.avahi;
in
{
  options.dougieHost.services.avahi = {
    enable = mkDefault false "avahi";
  };

  config = mkIf cfg.enable {
    services.avahi.enable = true;
    services.avahi.nssmdns = true;
    #services.avahi.publish.enable = true;
    #services.avahi.publish.addresses = true;
    #services.avahi.publish.domain = true;
    #services.avahi.publish.hinfo = true;
    #services.avahi.publish.userServices = true;
    #services.avahi.publish.workstation = true;
  };
}

