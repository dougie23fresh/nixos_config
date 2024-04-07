#{  lib, config, pkgs, ... }:
{
  # sane
  hardware.sane = {
    enable = true;
    #extraBackends = with pkgs; [ hplipWithPlugin sane-airscan ];
    extraBackends = with pkgs; [
      sane-airscan
      epkowa
    ];
    disabledDefaultBackends = ["escl"];
  };
}
