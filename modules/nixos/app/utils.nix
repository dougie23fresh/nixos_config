{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.utils;
in
{
  options.dougieHost.app.utils = {
    enable = mkEnableOption "utils";
  };

  config = mkIf cfg.enable {
		programs.git.enable = true;
		programs.thunar.enable = true;
		programs.thunar.plugins = with pkgs.xfce; [
			thunar-archive-plugin
			thunar-volman
			thunar-media-tags-plugin
		];
    environment.systemPackages = with pkgs; [
	  appimage-run
      flatpak
      git        
      (vivaldi.override{
		proprietaryCodecs = true;
		enableWidevine = true;
	  })
	  _7zz
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
	  fzf
	  killall
	  unzip
      file
      jq
      clac
	  libnotify
	  home-manager
	  acpi
      eza
      gcc
      cmake
      openssl
      cifs-utils
      nfs-utils
      p7zip
      samba
      unrar
      dig
    ];
  };
}
