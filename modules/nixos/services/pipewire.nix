{ config, pkgs, ... }:

{
  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}

{ config, lib, ... }:
let
  cfg = config.sconfig.pipewire;
in
{
  options.sconfig.pipewire = lib.mkEnableOption "Enable Pipewire";

  config = lib.mkIf cfg {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}