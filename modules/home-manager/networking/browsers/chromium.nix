{  pkgs, ... }:
{
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    #"cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    #"nngceckbapebfimnlniiiahkandclblb" # bitwarden
    #"pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    #"mlmoighangjfhiookjppplipefbbnaoo" # half-bold
    {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # Ublock Origin
    {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
    {id = "pcmpcfapbekmbjjkdalcgopdkipoggdi";} # markdownload
    {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
  ];
  home.packages = with pkgs; [
    chromium
  ];
}
