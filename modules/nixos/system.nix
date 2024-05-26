{ lib, inputs, pkgs, config, hostname, ... }:
{
  ########
  # System
  ########
  # Boot
  #boot.binfmt.registrations.appimage = {
  #  wrapInterpreterInShell = false;
  #  interpreter = "${pkgs.appimage-run}/bin/appimage-run";
  #  recognitionType = "magic";
  #  offset = 0;
  ##  mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
  #  magicOrExtension = ''\x7fELF....AI\x02'';
  #};
  boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # boot.kernelPackages = pkgs.linuxPackages_lqx
  boot.loader.systemd-boot.enable = true;
  # we use Git for version control, so we don't need to keep too many generations.
  boot.loader.systemd-boot.configurationLimit = 10;
  # pick the highest resolution for systemd-boot's console.
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [
    "exfat"
    "ntfs"
    "btrfs"
    "cifs"
    "ext"
    "nfs"
    "vfat"
  ];
  boot.kernelModules = ["tcp_bbr"];
  boot.kernel.sysctl = {
    # The Magic SysRq key is a key combo that allows users connected to the
    # system console of a Linux kernel to perform some low-level commands.
    # Disable it, since we don't need it, and is a potential security concern.
    #"kernel.sysrq" = 0;

    ## TCP hardening
    # Prevent bogus ICMP errors from filling up logs.
    #"net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    # Reverse path filtering causes the kernel to do source validation of
    # packets received from all interfaces. This can mitigate IP spoofing.
    #"net.ipv4.conf.default.rp_filter" = 1;
    #"net.ipv4.conf.all.rp_filter" = 1;
    # Do not accept IP source route packets (we're not a router)
    #"net.ipv4.conf.all.accept_source_route" = 0;
    #"net.ipv6.conf.all.accept_source_route" = 0;
    # Don't send ICMP redirects (again, we're not a router)
    #"net.ipv4.conf.all.send_redirects" = 0;
    #"net.ipv4.conf.default.send_redirects" = 0;
    # Refuse ICMP redirects (MITM mitigations)
    #"net.ipv4.conf.all.accept_redirects" = 0;
    #"net.ipv4.conf.default.accept_redirects" = 0;
    #"net.ipv4.conf.all.secure_redirects" = 0;
    #"net.ipv4.conf.default.secure_redirects" = 0;
    #"net.ipv6.conf.all.accept_redirects" = 0;
    #"net.ipv6.conf.default.accept_redirects" = 0;
    # Protects against SYN flood attacks
    #"net.ipv4.tcp_syncookies" = 1;
    # Incomplete protection again TIME-WAIT assassination
    #"net.ipv4.tcp_rfc1337" = 1;

    ## TCP optimization
    # TCP Fast Open is a TCP extension that reduces network latency by packing
    # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
    # both incoming and outgoing connections:
    "net.ipv4.tcp_fastopen" = 3;
    # Bufferbloat mitigations + slight improvement in throughput & latency
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";
  };

  # console
  console.keyMap = "us";

  #catppuccin.flavour = "frappe";
  # locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # location
  location.provider = "manual";
  location.latitude = 26.006409;
  location.longitude = -90.229664;
  # Multithreading
  security.allowSimultaneousMultithreading = true;
  # networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  # appendNameservers = [ "1.1.1.1" "8.8.8.8" ];
  # Prevent fragmentation and reassembly, which can improve network performanceconnectionConfig = {"ethernet.mtu" = 1462;"wifi.mtu" = 1462;};
  networking.timeServers = [
    "0.nixos.pool.ntp.org"
    "1.nixos.pool.ntp.org"
    "2.nixos.pool.ntp.org"
    "3.nixos.pool.ntp.org"
    "time.google.com"
    "time2.google.com"
    "time3.google.com"
    "time4.google.com"
  ];
  # nixSettings

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  #nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  # Set the nixPath to include the unstable nixpkgs from the flake inputs
  #nix.nixPath = [
  #  "nixpkgs=${inputs.nixpkgs-unstable}/nixpkgs"
    # "/etc/nixos/path"
  #];
  # Use lib.mapAttrs' to create environment.etc entries for the nix path
  #environment.etc = let
  #  nixpkgsUnstablePath = "${inputs.nixpkgs-unstable}/nixpkgs";
  #in
  #  lib.mapAttrs'
  #  (name: value: {
  #    name = "nix/path/${name}";
  #    value.source =
  #      if name == "nixpkgs"
  #      then nixpkgsUnstablePath
  #      else value.flake;
  #  })
  #  config.nix.registry;

  nixpkgs.config.allowUnfree = true;
  #nix.gc = {
  #  automatic = true;
  #  dates = "weekly";
  #  options = "--delete-older-than 7d";
  #};
  nix.settings = {
    warn-dirty = false;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://nix-gaming.cachix.org?priority=10"
      "https://nix-community.cachix.org?priority=20"
      "https://cache.lix.systems?priority=20"
      "https://hyprland.cachix.org"
      "https://helix.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://cache.nixos.org"

    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

    ];
  };
  # sound
  sound.enable = true;
  # security
  security.polkit.enable = true;
  security.rtkit.enable = true;

  # time
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;
}
