{ pkgs, ... }: 
{
  programs.firefox = {
    enable = true;
    #profiles = {};
  };
  #programs.chromium
  home.packages = with pkgs; [ 
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