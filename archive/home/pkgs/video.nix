{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # video
    ffmpeg
    mpv
    vlc
    v4l-utils
  ];
}