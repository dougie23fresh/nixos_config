{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  networking.firewall.enable = false;
  imports = [
    ./hardware.nix
    inputs.catppuccin.nixosModules.catppuccin
    outputs.nixosModules.hardware.bluetooth
    outputs.nixosModules.hardware.cpu-intel
    outputs.nixosModules.hardware.gpu-intel
    outputs.nixosModules.hardware.firmware
    outputs.nixosModules.hardware.keyboard-backlight
    outputs.nixosModules.hardware.logitech
    #outputs.nixosModules.hardware.scanner
    outputs.nixosModules.hardware.power-management
    outputs.nixosModules.hardware.sounds


    outputs.nixosModules.users
    outputs.nixosModules.system # refactor
    outputs.nixosModules.fonts # refactor


    #outputs.nixosModules.system.default_pkgs.nix # refactor
    #outputs.nixosModules.system.default_programs.nix # refactor
    #outputs.nixosModules.system.font.nix # refactor
    ########### services
    #outputs.nixosModules..system.services.nix # refactor
    outputs.nixosModules.services.clipboard
    outputs.nixosModules.services.dbus
    outputs.nixosModules.services.device-manager
    outputs.nixosModules.services.fingerprint
    outputs.nixosModules.services.firmware-update
    outputs.nixosModules.services.flatpak
    outputs.nixosModules.services.hard-drive
    outputs.nixosModules.services.mdns
    outputs.nixosModules.services.openrgb
    outputs.nixosModules.services.openssh
    outputs.nixosModules.services.out-of-memory
    outputs.nixosModules.services.printing
    #outputs.nixosModules..system.services.redshift
    outputs.nixosModules.services.security
    outputs.nixosModules.services.smartd
    outputs.nixosModules.services.ssd
    outputs.nixosModules.services.syncthing
    outputs.nixosModules.services.tailscale
    outputs.nixosModules.services.tumbler
    outputs.nixosModules.services.udisk
    #outputs.nixosModules.services.yubikey
    # virtualisation
    #outputs.nixosModules..system.virtualisation.distrobox
    #outputs.nixosModules..system.virtualisation.docker
    #outputs.nixosModules..system.virtualisation.libvirtd
    #outputs.nixosModules..system.virtualisation.lxd
    #outputs.nixosModules..system.virtualisation.waydroid
    # window-manager\
    #outputs.nixosModules..system.display-manager.gdm
    outputs.nixosModules.display-manager.sddm

    outputs.nixosModules.window-manager.xserver
    #outputs.nixosModules.window-manager.hyprland
    outputs.nixosModules.window-manager.labwc
    outputs.nixosModules.window-manager.cosmic
    #outputs.nixosModules..system.window-manager.plasma5
    #outputs.nixosModules..system.window-manager.plasma6
    outputs.nixosModules.window-manager.xfce
    outputs.nixosModules.window-manager.plasma6
    outputs.nixosModules.window-manager.xdg
    outputs.nixosModules.window-manager.wayfire
    #LXQt
    #Enlightenment
    #budgie
    outputs.nixosModules.base-apps.archives
    outputs.nixosModules.base-apps.base
    outputs.nixosModules.base-apps.network
    outputs.nixosModules.base-apps.nixapp
  ];
  services.udev.extraRules = ''
    # keyboard disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="062a", ATTR{idProduct}=="4101", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="3434", ATTR{idProduct}=="0430", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="04d9", ATTR{idProduct}=="a1cd", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="25a7", ATTR{idProduct}=="fa70", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="258a", ATTR{idProduct}=="0150", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="1997", ATTR{idProduct}=="2466", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="05e3", ATTR{idProduct}=="0612", ATTR{power/autosuspend}="-1"
    # mouse disable autosuspand
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c548", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c52b ", ATTR{power/autosuspend}="-1"
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c539 ", ATTR{power/autosuspend}="-1"
  '';

  #catppuccin.flavor = "macchiato";
  
  system.stateVersion = "23.11";
  hardware.sane.enable = true;
  users.users.melvin.extraGroups = [ "scanner" "lp" ];
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.udev.packages = [ pkgs.sane-airscan ];
  services.ipp-usb.enable=true;
  environment.systemPackages = with pkgs; [
    libsForQt5.skanlite
    #opera
    floorp
    librewolf
    tangram
    moonlight-qt
    virt-viewer
    vesktop
    tgpt
    oterm
    #elia
    tenere
  ];
}
