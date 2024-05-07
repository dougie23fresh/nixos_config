{  pkgs, ... }:
{
  home.packages = with pkgs; [
    brave

  ];
  programs.brave.enable = true;
  programs.brave.extensions = [
    #"cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    #"nngceckbapebfimnlniiiahkandclblb" # bitwarden
    #"pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    #"mlmoighangjfhiookjppplipefbbnaoo" # half-bold
    {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # Ublock Origin
    {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
    {id = "pcmpcfapbekmbjjkdalcgopdkipoggdi";} # markdownload
    {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
  ];
}
