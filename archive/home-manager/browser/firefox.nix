{ lib, config, pkgs, ... }:
with lib;
let 
  cfg = config.dougieHome.browser.firefox;
in
{
  options.dougieHome.browser.firefox = {
    enable = mkEnableOption "firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox.enable = true;
    programs.firefox.policies.CaptivePortal = false;
    programs.firefox.policies.DisableFirefoxAccounts = true;
    programs.firefox.policies.DisableFirefoxStudies = true;
    programs.firefox.policies.DisablePocket = true;
    programs.firefox.policies.DisableTelemetry = true;
    programs.firefox.policies.DontCheckDefaultBrowser = true;
    programs.firefox.policies.oDefaultBookmarks = true;
    programs.firefox.policies.PasswordManagerEnabled = true;
    #programs.firefox.FirefoxHome.Highlights = false;
    #programs.firefox.FirefoxHome.Pocket = false;
    #programs.firefox.FirefoxHome.Search = true;
    #programs.firefox.FirefoxHome.Snippets = false;
    #programs.firefox.FirefoxHome.TopSites = false;
    #programs.firefox.UserMessaging = {
    #  ExtensionRecommendations = false;
    #  SkipOnboarding = true;
    #};
    #programs.firefox.settings = {
    #  "browser.download.panel.shown" = true;
    #  "dom.security.https_only_mode" = true;
    #  "general.smoothScroll" = true;
    #  "gfx.webrender.enabled" = true;
    #  "layout.css.backdrop-filter.enabled" = true;
    #  "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
    #  "signon.rememberSignons" = false;
    #  "svg.context-properties.content.enabled" = true;
    #  # Don't allow websites to prevent use of right-click, or otherwise
    #  # messing with the context menu.
    #  "dom.event.contextmenu.enabled" = true;
    #  # Don't allow websites to prevent copy and paste. Disable
    #  # notifications of copy, paste, or cut functions. Stop webpage
    #  # knowing which part of the page had been selected.
    #  "dom.event.clipboardevents.enabled" = true;
    #  # Do not track from battery status.
    #  "dom.battery.enabled" = false;

    # # Show punycode. Help protect from character 'spoofing'.
    #  "network.IDN_show_punycode" = true;

    #  # Disable site reading installed plugins.
    #  "plugins.enumerable_names" = "";

    #  # Use Mozilla instead of Google here.
    #  "geo.provider.network.url" =
    #    "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

    #  # No speculative content when searching.
    #  "browser.urlbar.speculativeConnect.enabled" = false;

    #  # Sends data to servers when leaving pages.
    #  "beacon.enabled" = false;
    #  # Informs servers about links that get clicked on by the user.
    #  "browser.send_pings" = false;

    #  "browser.tabs.closeWindowWithLastTab" = false;

    #  # Don't call home on new tabs
    #  "browser.selfsupport.url" = "";
    #  "browser.aboutHomeSnippets.updateUrL" = "";
    #  "browser.startup.homepage_override.mstone" = "ignore";
    #  "browser.startup.homepage_override.buildID" = "";
    #  "startup.homepage_welcome_url" = "";
    #  "startup.homepage_welcome_url.additional" = "";
    #  "startup.homepage_override_url" = "";
    #  # Firefox experiments...
    #  "experiments.activeExperiment" = false;
    #  "experiments.enabled" = false;
    #  "experiments.supported" = false;
    #  "extensions.pocket.enabled" = false;
    #  "identity.fxaccounts.enabled" = false;

    #  # Privacy
    #  "privacy.donottrackheader.enabled" = true;
    #  "privacy.donottrackheader.value" = 1;
    #  "privacy.trackingprotection.enabled" = true;
    #  "privacy.trackingprotection.socialtracking.enabled" = true;
    #  "privacy.firstparty.isolate" = true;
    #  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    #  "toolkit.telemetry.enabled" = false;
    #  "toolkit.telemetry.unified" = false;
    #  "toolkit.telemetry.archive.enabled" = false;
    #  "browser.toolbars.bookmarks.visibility" = "never";

    #  # Cookies
    #  "network.cookie.cookieBehavior" = 1;

    #  # Perf
    #  "gfx.webrender.all" = true;
    #  "media.ffmpeg.vaapi.enabled" = true;
    #  "media.ffvpx.enabled" = false;
    #  "media.rdd-vpx.enabled" = false;
    #  "gfx.webrender.compositor.force-enabled" = true;
    #  "media.navigator.mediadatadecoder_vpx_enabled" = true;
    #  "webgl.force-enabled" = true;
    #  "layers.acceleration.force-enabled" = true;
    #  "layers.offmainthreadcomposition.enabled" = true;
    #  "layers.offmainthreadcomposition.async-animations" = true;
    #  "layers.async-video.enabled" = true;
    #  "html5.offmainthread" = true;

    #};

  };
}
