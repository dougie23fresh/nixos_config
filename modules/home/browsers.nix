{ inputs, outputs, pkgs, ... }:
{
  ###############
  # browser
  ###############
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    #"mlmoighangjfhiookjppplipefbbnaoo" # half-bold
  ];

  programs.firefox.enable = true;
  programs.firefox.policies.CaptivePortal = false;
  programs.firefox.policies.DisableFirefoxAccounts = true;
  programs.firefox.policies.DisableFirefoxStudies = true;
  programs.firefox.policies.DisablePocket = true;
  programs.firefox.policies.DisableTelemetry = true;
  programs.firefox.policies.DontCheckDefaultBrowser = true;
  programs.firefox.policies.oDefaultBookmarks = true;
  programs.firefox.policies.PasswordManagerEnabled = true;
  
   home.packages = with pkgs; [ 
    librewolf-wayland
    vivaldi
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
}