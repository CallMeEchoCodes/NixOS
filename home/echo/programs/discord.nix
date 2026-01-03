{ lib, ... }:
{
  programs.vesktop = {
    enable = true;

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
}
