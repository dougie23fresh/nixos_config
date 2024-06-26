{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.browser.chromium;
in
{
  options.dougieHome.browser.chromium = {
    enable = mkEnableOption "chromium";
  };

  config = mkIf cfg.enable {
    programs.chromium.enable = true;
    programs.chromium.extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "pcmpcfapbekmbjjkdalcgopdkipoggdi" # markdownload
      #"mlmoighangjfhiookjppplipefbbnaoo" # half-bold
    ];
    # = {
    #  "AutofillAddressEnabled" = false;
    #  "AutofillCreditCardEnabled" = false;
    #  "BuiltInDnsClientEnabled" = false;
    #  "DeviceMetricsReportingEnabled" = true;
    #  "ReportDeviceCrashReportInfo" = false;
    #  "PasswordManagerEnabled" = false;
    #  "SpellcheckEnabled" = true;
    #  "SpellcheckLanguage" = [
    #    "en-US"
    #  ];
    #};
  };
}
