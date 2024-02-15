{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.tools;
in
{
  options.dougieHost.tools = {
    enable = mkEnableOption "tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python310
      python310Packages.ipython
      fzf
      killall
      unzip
      file
      jq
      clac
      wget
      curl
      git
      #libverto # Asynchronous event loop abstraction library
      #libnotify # Minimalistic libnotify wrapper
      home-manager
      w3m
      neofetch
      imagemagick	
      fontconfig
      freetype
      wget
      htop
      usbutils
      pciutils
      iputils
      inetutils
      fetchutils
      coreutils
      dmidecode
      util-linux
      wezterm
      nano
      kitty
      alacritty
      acpi
      eza
      libnotify
      gcc
      cmake
      openssl
      cifs-utils
      nfs-utils
      p7zip
      samba
      unrar
      dig
      dogdns # Modern Unix `dig`
      httpie # Terminal HTTP client
      iperf3 # Terminal network benchmarking
      mtr # Modern Unix `traceroute`
      netdiscover # Modern Unix `arp`
      speedtest-go # Terminal speedtest
    ];
  };
}
