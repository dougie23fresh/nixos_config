{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHost.app.chromium;
in
{
  options.dougieHost.app.chromium = {
    enable = mkEnableOption "chromium";
  };

  config = mkIf cfg.enable {
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
  };
}
