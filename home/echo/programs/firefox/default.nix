{
  lib,
  config,
  pkgs,
  self,
  ...
}:
{
  catppuccin.firefox.enable = false; # i have my own catppucccin firefox color theme

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

        # disable the password
        "signon.rememberSignons" = false;

        # use system fonts
        "font.default.x-western" = "sans-serif";
        "font.name.monospace.x-western" = "monospace";
        "font.name.sans-serif.x-western" = "sans-serif";
        "font.name.serif.x-western" = "serif";

        # disable ai
        "browser.ml.enable" = false;
        "browser.ml.chat.enabled" = false; # very consistent naming thank you mozilla
        "browser.ml.chat.menu" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.ml.linkPreview.enabled" = false;

        # disable fullscreen notice
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;

        # super smooth scrolling (credit: betterfox/smoothfox)
        "apz.overscroll.enabled" = true;
        "general.smoothScroll" = true;
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
        "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
        "general.smoothScroll.currentVelocityWeighting" = "1";
        "general.smoothScroll.stopDecelerationWeighting" = "1";
        "mousewheel.default.delta_multiplier_y" = 100;

        # hardware accel
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;

        # webgpu
        "dom.webgpu.enabled" = true;
        "dom.webgpu.indirect-draw.enabled" = true;
        "dom.webgpu.workers.enabled" = true;

        "devtools.theme" = "dark";

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
          stylus
          bitwarden
        ];

        settings = {
          "FirefoxColor@mozilla.com" = {
            force = true;
            settings = {
              firstRunDone = true;
              theme = {
                colors = with (lib.importJSON "${config.catppuccin.sources.palette}/palette.json").mocha.colors; {
                  toolbar = mantle.rgb;
                  toolbar_text = text.rgb;
                  frame = mantle.rgb;
                  tab_background_text = text.rgb;
                  toolbar_field = base.rgb;
                  toolbar_field_text = text.rgb;
                  tab_line = mantle.rgb;
                  popup = base.rgb;
                  popup_text = text.rgb;
                  button_background_active = overlay0.rgb;
                  frame_inactive = crust.rgb;
                  icons_attention = pink.rgb;
                  icons = pink.rgb;
                  ntp_background = crust.rgb;
                  ntp_text = text.rgb;
                  popup_border = pink.rgb;
                  popup_highlight_text = text.rgb;
                  popup_highlight = overlay0.rgb;
                  sidebar_border = pink.rgb;
                  sidebar_highlight_text = crust.rgb;
                  sidebar_highlight = pink.rgb;
                  sidebar_text = text.rgb;
                  sidebar = base.rgb;
                  tab_background_separator = pink.rgb;
                  tab_loading = pink.rgb;
                  tab_selected = base.rgb;
                  tab_text = text.rgb;
                  toolbar_bottom_separator = base.rgb;
                  toolbar_field_border_focus = pink.rgb;
                  toolbar_field_border = base.rgb;
                  toolbar_field_focus = base.rgb;
                  toolbar_field_highlight_text = base.rgb;
                  toolbar_field_highlight = pink.rgb;
                  toolbar_field_separator = pink.rgb;
                  toolbar_vertical_separator = pink.rgb;
                };
                # well that was painful to write

                images = {
                  additional_backgrounds = [
                    "./bg-000.svg"
                  ];
                  custom_backgrounds = [ ];
                };
                title = "Catppuccin mocha pink";
              };
            };
          };
          "treestyletab@piro.sakura.ne.jp" = {
            settings = {
              force = true;
              # todo: store in plain text and decode at build time (this is just some css)
              chunkedUserStyleRules0 = self.lib.toBase64 ''
                tab-item {
                	box-shadow: 0 0 var(--tab-dropshadow-blur) rgba(0, 0, 0, 0.0) !important;
                }

                #tabbar-container #tabbar {
                    margin-left: 6px !important;
                }
              '';
            };
          };
        };
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
      DisableFeedbackCommands = true;

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

  xdg.mimeApps.defaultApplications = lib.attrsets.genAttrs [
    "text/html"
    "application/pdf"
    "x-www-browser"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/about"
    "x-scheme-handler/unknown"
  ] (f: "firefox.desktop");
}
