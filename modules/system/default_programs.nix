{  lib, config, pkgs, ... }:
{
  ########
  # programs
  ########
  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
    "mlmoighangjfhiookjppplipefbbnaoo" # half-bold
  ];
  programs.chromium.defaultSearchProviderEnabled = true;
  programs.chromium.defaultSearchProviderSearchURL = "{google:baseURL}search?q=%s&{google:originalQueryForSuggestion}{google:prefetchSource}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}";
  programs.chromium.defaultSearchProviderSuggestURL = "{google:baseURL}search?output=chrome&q={searchTerms}";
  programs.chromium.extraOpts = {
    "BrowserSignin" = 0;
    "SyncDisabled" = true;
    "PasswordManagerEnabled" = false;
    "SpellcheckEnabled" = true;
    "SpellcheckLanguage" = [ "en-US" ];
  };
  programs.dconf.enable = true;
  programs.dconf.enable = true;
  programs.system-config-printer.enable = true;
  programs.fuse.userAllowOther = true;
  programs.partition-manager.enable = true;
  programs.adb.enable = true;
  programs.nix-ld.enable = true;
  programs.gamemode.enable = true;
  programs.zsh.enable = true;

  #programs.seahorse.enable = true;
  # programs.java.enable = false;
}