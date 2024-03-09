{  lib, config, pkgs, ... }:
{
  # pulseaudio
  hardware.pulseaudio.enable = false;

  # pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
