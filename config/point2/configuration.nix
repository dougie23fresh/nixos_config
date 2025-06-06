{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  pkgs-unstable,
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
    #outputs.nixosModules.services.technitium-dns-server

    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp
    outputs.nixosModules.base-apps.rust-motd

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
    #server = "https://acme-staging-v02.api.letsencrypt.org/directory";
  };
  
  #config.sops.secrets.cloudflare_token.path;

  services.guacamole-server.enable = true;
  services.guacamole-server.host = "127.0.0.1";
  services.guacamole-server.port = 4822;
  services.guacamole-server.userMappingXml = "/home/melvin/user-mapping.xml";
  services.guacamole-server.logbackXml = "/home/melvin/logback.xml";

  services.guacamole-client.enable = true;
  services.guacamole-client.enableWebserver = true;
  services.guacamole-client.settings = {
    guacd-port = 4822;
    guacd-hostname = "127.0.0.1";
    # auth-provider = "net.sourceforge.guacamole.net.basic.BasicFileAuthenticationProvider";
    # basic-user-mapping = "/etc/guacamole/user-mapping.xml";
  };
  services.gotify.enable = true;
  services.gotify.environment.GOTIFY_SERVER_PORT = 8085;
  #services.gotify.package = pkgs-unstable.gotify-server;
  #services.gotify.environment = {
  #  GOTIFY_DATABASE_DIALECT = "sqlite3";
  ##  GOTIFY_SERVER_PORT = 8085;
  #  GOTIFY_DEFAULTUSER_NAME="admin";
  #  GOTIFY_DEFAULTUSER_PASS="admin";
  #  GOTIFY_REGISTRATION=true;
  #};
  
  services.caddy.enable = true;
  services.caddy.virtualHosts."vw.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.85:7277
      '';
  };
  services.caddy.virtualHosts."haos.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.85:8123
      '';
  };
  services.caddy.virtualHosts."guac.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.95:8087
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
  services.caddy.virtualHosts."gotify.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.3:8085
      '';
  };
  services.caddy.virtualHosts."actual.dougie23fresh.com" = {
    useACMEHost  = "dougie23fresh.com";
    extraConfig = ''
        reverse_proxy 10.1.1.85:5006
      '';
  };

  #services.kasmweb.enable = true;
  #services.kasmweb.listenPort = 8447;

  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman
    podman-tui   # Terminal mgmt UI for Podman
    passt    # For Pasta rootless networking
  ];
  users.groups.podman = {
    name = "podman";
  };
  users.users.melvin.extraGroups = ["acme" "podman"];

  virtualisation.podman.enable = true;
  virtualisation.podman.autoPrune.enable = true;
  virtualisation.podman.dockerCompat = true;
  #virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  

  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers.dockge = {
    image = "louislam/dockge:1";
    autoStart = true;
    volumes = [
    "/var/run/podman/podman.sock:/var/run/docker.sock"
    "/data:/app/data"
    "/opt/stacks:/opt/stacks"
    ];
    log-driver = "journald";
    ports = [ "5001:5001" ];
    environment = {
      DOCKGE_STACKS_DIR = "/opt/stacks";
    };
  };
  virtualisation.oci-containers.containers.gitea = {
    image = "gitea/gitea:latest";
    autoStart = true;
    volumes = [
      "/data/gitea:/data"
      "/etc/timezone:/etc/timezone:ro"
      "/etc/localtime:/etc/localtime:ro"
    ];
    ports = [ "3000:3000" "222:22" ];
    environment = {
      USER_UID = "1000";
      USER_GID = "1000";
      #htt
    };
  };
  virtualisation.oci-containers.containers.dashy = {
    image = "lissy93/dashy";
    autoStart = true;
    volumes = [ "/data/dashy:/app/user-data/" ];
    ports = [ "4000:8080" ];
  };
  #
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
