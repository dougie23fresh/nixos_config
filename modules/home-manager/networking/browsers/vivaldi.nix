{  pkgs, ... }:
{
  home.packages = with pkgs; [
    (vivaldi.override{
      proprietaryCodecs = true;
      enableWidevine = true;
      commandLineArgs = "--enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform=wayland  --disable-features=AllowQt";
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
    #--disable-features=AllowQt
  ];
}
