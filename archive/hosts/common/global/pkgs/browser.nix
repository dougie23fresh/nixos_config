{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    (vivaldi.override{
      proprietaryCodecs = true;
      enableWidevine = true;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
    microsoft-edge
    chromium
  ];
}