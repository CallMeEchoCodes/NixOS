{ lib, ... }:
{
  catppuccin.fish.enable = true;

  home.shellAliases = {
    mkdir = "mkdir -pv";
    df = "df -h";

    ls = "eza";
  };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
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

  catppuccin.starship.enable = true;

  programs.eza = {
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

  catppuccin.eza.enable = true;
}
