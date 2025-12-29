{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  home.shellAliases = {
    mkdir = "mkdir -pv";
    df = "df -h";

    ls = "eza";
    cat = "bat";
  };

  home.packages =
    with pkgs;
    [
      brightnessctl
    ]
    ++ (lib.optionals osConfig.reverb.hardware.battery [
      pkgs.acpi
    ]);

  programs = {
    fish = {
      enable = true;

      shellInit = ''
        set fish_greeting
      '';
    };

    git = {
      enable = true;

      signing = {
        key = "BEBCAB631F88D239";
        signByDefault = true;
      };

      settings = {
        user = {
          email = "romanbarrettsarpi" + "@" + "pm" + ".me";
          name = "CallMeEchoCodes";
        };

        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicprefix = true;
        };

        fetch.prune = true;
        push.autoSetupRemote = true;
        lfs.enable = true;

        init.defaultBranch = "main";
      };
    };

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;

      options = [ "--cmd cd" ];
    };

    bat.enable = true; # also enabled in nixos, you cant set bat settings in home manager, but it needs to be enabled for catppuccin to work

    starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        format = lib.concatStrings [
          "$directory"
          "$git_branch"
          "$character"
        ];

        character = {
          success_symbol = "[➜](green)";
          error_symbol = "[➜](red)";
          vicmd_symbol = "[➜](yellow)";
        };

        git_branch = {
          format = "[](peach)[[ ](bg:peach fg:base bold)$branch](bg:peach fg:base)[ ](peach)";
          ignore_branches = [
            "master"
            "main"
          ];
        };

        line_break = {
          disabled = true;
        };

        directory = {
          truncation_length = 6;
          truncate_to_repo = true;
          format = "[](pink)[$path](bg:pink fg:base)[ ](pink)";
        };
      };
    };

    eza = {
      enable = true;
      icons = "auto";

      extraOptions = [
        "--header"
        "--group"
        "--all"
        "--octal-permissions"
        "--color=auto"
      ];
    };
  };
}
