{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware/pulseaudio.nix
      ./hardware/opengl.nix
      ./hardware/logitech.nix
      # ./hardware/acceleration-intel.nix
    ];
}
