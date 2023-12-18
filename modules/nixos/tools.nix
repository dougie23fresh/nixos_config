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
    ];
  };
}
