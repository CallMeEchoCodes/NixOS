{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  # fish enables this by default and it makes switch unbearably slow
  documentation.man.generateCaches = false;

  environment.systemPackages = with pkgs; [
    wget
    curl
    trash-cli

    # waow nix is super minimal by default
    killall
    file
    coreutils
    gnused
    rsync
    tree
    ripgrep
    fzf

    zip
    unzip
    zstd

    cacert
  ];

  programs = {
    git.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    bat = {
      enable = true;
      settings = {
        "style" = "plain";
      };
    };
  };
}
