{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  networking.interfaces.enp2s0.useDHCP = false;
  networking.interfaces.enp2s0.ipv4.addresses = [{
    address = "10.1.1.3";
    prefixLength = 24;
  }];
  networking.defaultGateway  = "10.1.1.1";
  networking.nameservers  = [ "1.1.1.1" ];
  networking.firewall.enable = false;

  imports = [
    ./hardware.nix
    #inputs.catppuccin.nixosModules.catppuccin
    inputs.sops-nix.nixosModules.sops
    #sops.defaultSopsFile = ./secrets/secrets.yaml;
    #sops.defaultSopsFormat = "yaml";
    outputs.nixosModules.hardware.cpu-intel
    outputs.nixosModules.hardware.gpu-intel
    outputs.nixosModules.hardware.firmware

    outputs.nixosModules.users
    outputs.nixosModules.system # refactor
    outputs.nixosModules.fonts # refactor

    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    outputs.nixosModules.services.dbus
    outputs.nixosModules.services.device-manager
    outputs.nixosModules.services.fingerprint
    outputs.nixosModules.services.firmware-update
    outputs.nixosModules.services.hard-drive
    outputs.nixosModules.services.mdns
    outputs.nixosModules.services.openssh
    outputs.nixosModules.services.out-of-memory
    outputs.nixosModules.services.security
    outputs.nixosModules.services.smartd
    outputs.nixosModules.services.ssd
    outputs.nixosModules.services.syncthing
    outputs.nixosModules.services.tailscale
    outputs.nixosModules.services.tumbler

    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp

  ];
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/melvin/.config/sops/age/keys.txt";
  sops.secrets.cloudflare_token = {};
  sops.templates.acme-credentials.content = ''
    CLOUDFLARE_EMAIL=melvin.douglas@gmail.com
    CLOUDFLARE_DNS_API_TOKEN=${config.sops.placeholder.cloudflare_token}
  '';
  #sops.secrets.cloudflare_token.owner = "caddy";
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "melvin.douglas@gmail.com";
  security.acme.certs."dougie23fresh.com" = {
    domain = "dougie23fresh.com";
    extraDomainNames = [ "*.dougie23fresh.com" ];
    dnsResolver = "1.1.1.1:53";
    dnsProvider = "cloudflare";
    credentialsFile = config.sops.templates.acme-credentials.path;
    server = "https://acme-staging-v02.api.letsencrypt.org/directory";
  };
  users.users.melvin.extraGroups = ["acme"];
  #config.sops.secrets.cloudflare_token.path;
  services.caddy.enable = true;
  services.caddy.virtualHosts."vw.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.85:7277
      '';
  };
  services.caddy.virtualHosts."dns.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.2:5380
      '';
  };
  services.caddy.virtualHosts."dougie23fresh.com" = {
    useACMEHost = "dougie23fresh.com";
    extraConfig = ''
        respond "Hello, world!"
      '';
  };
  services.caddy.virtualHosts."localhost" = {
    useACMEHost = "dougie23fresh.com";
    extraConfig = ''
        respond "Hello, world!"
      '';
  };
  #services.caddy.virtualHosts."vw.dougie23fresh.com".extraConfig = ''
  #    tls {
  #      dns cloudflare {env.CLOUDFLARE_API_TOKEN}
  #    }
  #    reverse_proxy 10.1.1.77:7277
  #  '';
  #catppuccin.flavour = "macchiato";
  #cloudflare_token
  system.stateVersion = "23.11";


}
