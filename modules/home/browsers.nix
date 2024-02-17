{ inputs, outputs, ... }:
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
  
  home.packages = [ 
    pkgs.librewolf-wayland
    pkgs.vivaldi
    pkgs.brave
  ];
}