{  pkgs, ... }:
{
  hardware.enableAllFirmware  = true;
  # pulseaudio
  ##sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
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
    pamixer       # pulseaudio sound mixer
    pavucontrol  # pulseaudio volume control
  ];
}
