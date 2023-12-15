{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.services.pipewire;
in
{
  options.dougieHost.services.pipewire = {
    enable = mkEnableOption "pipewire";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    environment.systemPackages = with pkgs;[
      pulsemixer
      pavucontrol
    ];
  };
}