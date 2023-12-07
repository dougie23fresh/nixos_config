{ config, pkgs, ... }:

{
  hardware.pulseaudio = {
    enable = false;
    support32Bit = true;
  };
}