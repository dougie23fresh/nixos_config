{  pkgs, ... }:
{
  home.packages = with pkgs; [
    (vivaldi.override{
      proprietaryCodecs = true;
      enableWidevine = true;
      #commandLineArgs = "--disable-features=AllowQt";
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
    #--disable-features=AllowQt
  ];
}
