{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      isDefault = true;

      containers = { };
      containersForce = true;

      userChrome = builtins.readFile ./userChrome.css;

      settings = {
        "extensions.autoDisableScopes" = true; # install extensions automatically
        "browser.preferences.defaultPerformanceSettings.enabled" = true;

        "browser.useDownloadDir" = false; # ask where to save downloads
        "browser.tabs.warnOnClose" = false;

        # use system fonts
        "font.default.x-western" = "sans-serif";
        "font.name.monospace.x-western" = "monospace";
        "font.name.sans-serif.x-western" = "sans-serif";
        "font.name.serif.x-western" = "serif";

        "general.smoothScroll" = true;

        "intl.accept_languages" = "en-au,en-us,en";
        "intl.regional_prefs.use_os_locales" = true;

        "network.IDN_show_punycode" = true;

        "widget.gtk.overlay-scrollbars.enabled" = true;

        # fuck off google
        "browser.safebrowsing.enabled" = false;
        "browser.safebrowsing.provider.google4.dataSharing" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # enable userChrome.css
      };

      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
      };

      extensions = {
        # Yes, I want to override settings, there weren't any before anyway.
        force = true;

        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tree-style-tab
          firefox-color # required for catppuccin
        ];
      };
    };

    policies = {
      # disable mozilla crap
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = true;
      };
      GenerativeAI = {
        # ew
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };

      # privacy
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";

      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
    };
  };

  catppuccin.firefox.enable = true;
}
