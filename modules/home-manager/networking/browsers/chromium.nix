{
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    #"mlmoighangjfhiookjppplipefbbnaoo" # half-bold
  ];
  home.packages = with pkgs; [
    chromium
  ];
}
