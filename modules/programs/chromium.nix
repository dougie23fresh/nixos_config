chromium = {
    enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "nngceckbapebfimnlniiiahkandclblb" # bitwarden
        "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
        "mlmoighangjfhiookjppplipefbbnaoo" # half-bold
      ];
      defaultSearchProviderEnabled = true;
      defaultSearchProviderSearchURL = "{google:baseURL}search?q=%s&{google:originalQueryForSuggestion}{google:prefetchSource}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}";
      defaultSearchProviderSuggestURL = "{google:baseURL}search?output=chrome&q={searchTerms}";
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = false;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "en-US" ];
      };
    };
