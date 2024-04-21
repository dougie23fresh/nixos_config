home.packages = with pkgs; [
    librewolf-wayland
    #vivaldi
    brave
    (vivaldi.override{
      proprietaryCodecs = true;
      enableWidevine = true;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
    microsoft-edge
    chromium
  ];
