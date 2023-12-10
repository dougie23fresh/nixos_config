# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/global
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "msi-gs70-stealth""; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowUnfreePredicate = (pkg: builtins.elem (builtins.parseDrvName pkg.name).name [ "steam" ]);
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.hardware.bolt.enable = true;
  # Lid settings
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.melvin = {
    isNormalUser = true;
    description = "melvin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };
  # environment.systemPackages = with pkgs; [];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ibm-plex
    fira-code
    fira-code-symbols
  ];

  environment.variables = {
    VDPAU_DRIVER = "va_gl";
  };



  services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.opengl.extraPackages = with pkgs; [vaapiVdpau];

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true; # Provides `nvidia-offload` command.
    };
    # Bus ID of the Intel GPU.
    intelBusId = lib.mkDefault "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU.
    nvidiaBusId = lib.mkDefault "PCI:1:0:0";
  };


  system.stateVersion = "23.11"; # Did you read the comment?

}
#------------------------
#powerManagement.cpuFreqGovernor = lib.mkDefault "powersave"
#services.power-profiles-daemon.enable

# Hard disk protection if the laptop falls:
#  services.hdapsd.enable = lib.mkDefault true;


