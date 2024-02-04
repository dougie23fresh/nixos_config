{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.hardware.intel-video;
in
{
  options.dougieHost.hardware.intel-video = {
    enable = mkEnableOption "intel-video";
  };

  config = mkIf cfg.enable {
    #boot.kernelParams = [ "intel_pstate=ondemand" ];
    # hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    hardware.opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-compute-runtime
        vulkan-loader
        vulkan-validation-layers
        #vulkan-extension-layers
        vulkan-tools
        libva-utils
        amdvlk
        intel-gmmlib
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        intel-ocl
      ];
    };
  };
}