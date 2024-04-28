
{
  programs.firefox = {
    enable = true;
    policies = {
      CaptivePortal = false;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      oDefaultBookmarks = true;
      PasswordManagerEnabled = true;
    };
    profiles = {
      default = {
        id = 0;
        #extensions = [
        #  addons.bitwarden
        #];
        settings = {
          "app.normandy.first_run" = false;
          "app.shield.optoutstudies.enabled" = false;

          # disable updates (pretty pointless with nix)
          "app.update.channel" = "default";
          "browser.link.open_newwindow" = true;

          "browser.shell.checkDefaultBrowser" = false;
          "extensions.webcompat.enable_picture_in_picture_overrides" = true;
          "extensions.webcompat.enable_shims" = true;
          "extensions.webcompat.perform_injections" = true;
          "extensions.webcompat.perform_ua_overrides" = true;

          "privacy.donottrackheader.enabled" = true;

          # Yubikey
          "security.webauth.u2f" = true;
          "security.webauth.webauthn" = true;
          "security.webauth.webauthn_enable_softtoken" = true;
          "security.webauth.webauthn_enable_usbtoken" = true;
        };
      };
    };
  };
}
