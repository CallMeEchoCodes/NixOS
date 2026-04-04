{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  programs.vesktop = {
    enable = osConfig.reverb.profiles.graphical.enable;
    package = pkgs.vesktop.overrideAttrs (old: {
      preBuild = ''
        cp -r ${pkgs.electron.dist} electron-dist
        chmod -R u+w electron-dist
      '';
      buildPhase = ''
        runHook preBuild

        pnpm build
        pnpm exec electron-builder \
          --dir \
          -c.asarUnpack="**/*.node" \
          -c.electronDist="electron-dist" \
          -c.electronVersion=${pkgs.electron.version}

        runHook postBuild
      '';
    });

    settings = {
      discordBranch = "canary";
      spellCheckLanguages = [
        "en-GB"
        "en-AU"
        "en"
      ];
      minimizeToTray = true;
      arRPC = true;
      hardwareAcceleration = false;
    };

    vencord = {
      themes = {
        font = ''
          :root {
            --font-code: monospace !important;
          }
        '';
      };

      settings = {
        enabledThemes = [ "font.css" ];
        plugins = (
          lib.mergeAttrsList [
            {
              FakeNitro = {
                enabled = true;
                enableEmojiBypass = true;
                enableStickerBypass = true;
                enableStreamQualityBypass = true;
                transformStickers = true;
                transformEmojis = true;
                transformCompoundSentence = true;
                emojiSize = 48;
                stickerSize = 160;
                hyperLinkText = "{{NAME}}";
                useHyperLinks = true;
                disableEmbedPermissionCheck = false;
              };
            }
            (lib.genAttrs
              [
                "AlwaysTrust"
                "BetterUploadButton"
                "BiggerStreamPreview"
                "BlurNSFW"
                "CallTimer"
                "ClearURLs"
                "CopyFileContents"
                "CrashHandler"
                "Decor"
                "DontRoundMyTimestamps"
                "ExpressionCloner"
                "FakeProfileThemes"
                "FavoriteEmojiFirst"
                "FixCodeblockGap"
                "FixYoutubeEmbeds"
                "FixSpotifyEmbeds"
                "GameActivityToggle"
                "LoadingQuotes"
                "MentionAvatars"
                "NoDevtoolsWarning"
                "NoOnboardingDelay"
                "NoReplyMention"
                "NormalizeMessageLinks"
                "NoTypingAnimation"
                "NoUnblockToJunp"
                "OpenInApp"
                "PermissionFreeWill"
                "PictureInPicture"
                "ReviewDB"
                "RoleColorEverywhere"
                "ShikiCodeblocks"
                "ThemeAttributes"
                "TypingIndicator"
                "TypingTweaks"
                "Unindent"
                "UserMessagesPronouns"
                "USRBG"
                "ViewRaw"
                "VoiceDownload"
                "WebKeybinds"
                "WebScreenShareFixes"
                "WhoReacted"
                "YoutubeAdblock"
              ]
              (x: {
                enabled = true;
              })
            )
          ]
        );
        themeLinks = [
          "https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css"
          "https://codeberg.org/ridge/Discord-Adblock/raw/branch/main/discord-adblock.css"
          "https://raw.githubusercontent.com/Tnixc/discord-css/refs/heads/main/quickCss.css"
        ];
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/discord" = "vesktop.desktop";
  };
}
