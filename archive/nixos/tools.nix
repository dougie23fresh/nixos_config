{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.tools;
  my-python-packages = ps: with ps; [
    requests
    ipython
  ];
in
{
  options.dougieHost.tools = {
    enable = mkEnableOption "tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      #(python311.withPackages my-python-packages)
      #python311Packages.ipython
      (pkgs.writeScriptBin "sct2" ''
      #!/bin/sh
      killall wlsunset &> /dev/null;
      if [ $# -e 1 ]; then
        temphigh=$(( $1 +1 ))
        templow =$1
        wlsunset -t $templow -T $temphigh &> /dev/null &
      else
        killall wlsunset &> /dev/null;
      fi
      '')
      go-sct
      fzf
      killall
      unzip
      unrar
      file
      jq
      clac
      wget
      curl
      git
      cmatrix
      lolcat
      neofetch
      htop
      btop
      libvirt
      polkit_gnome
      lm_sensors
      
      #libverto # Asynchronous event loop abstraction library
      #libnotify # Minimalistic libnotify wrapper
      home-manager
      w3m
      
      imagemagick	
      fontconfig
      freetype
      wget
      
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
      v4l-utils
      ydotool
      toybox
    ];
  };
}
