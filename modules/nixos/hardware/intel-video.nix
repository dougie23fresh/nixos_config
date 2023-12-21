hardware.opengl = {
      enable = true;
      driSupport = true;
    };


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
    environment.systemPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      libva-utils
    ];
    hardware.opengl = {
      enable = true;
      driSupport = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
        intel-compute-runtime
      ];
    };
  };
}