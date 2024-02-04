{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.nvidia;
in
{
  options.dougieHost.hardware.nvidia = {
    enable = mkEnableOption "nvidia";
  };

  config = mkIf cfg.enable {
    #export __NV_PRIME_RENDER_OFFLOAD=1
    #export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    #export __GLX_VENDOR_LIBRARY_NAME=nvidia
    #export __VK_LAYER_NV_optimus=NVIDIA_only
    environment.systemPackages = with pkgs; [
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      nvidia-vaapi-driver
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      libvdpau-va-gl
      nvidia-offload
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layers
      vulkan-tools
      libva-utils
      cudatoolkit
      nvidia-thrust
    ];
    programs.hyprland.nvidiaPatches = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.prime = {
      offload.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0"; 
      sync.enable = true;
    };
    hardware.nvidia.nvidiaSettings = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.nvidiaPersistenced = true;
    hardware.nvidia.powerManagement = {
      enable = true;
      finegrained = true;
    };

  };
}


  

    