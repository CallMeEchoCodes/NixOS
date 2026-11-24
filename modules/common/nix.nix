{ pkgs, ... }:
{
  nix = {
    # fork of cppnix, many cool new features (also faster)
    package = pkgs.lixPackageSets.stable.lix;

    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    channel.enable = false;

    settings = {
      min-free = 5 * 1024 * 1024 * 1024;
      max-free = 20 * 1024 * 1024 * 1024;

      auto-optimise-store = true;

      connect-timeout = 50000;
      http3 = true;

      allowed-users = [ "@wheel" ];
      trusted-users = [ "@wheel" ];

      warn-dirty = false;
      keep-going = true;

      auto-allocate-uids = true;
      use-cgroups = true;

      max-jobs = "auto";

      # ALWAYS ask before accepting a configuration
      accept-flake-config = false;

      # direnv stuff
      keep-derivations = true;
      keep-outputs = true;

      experimental-features = [
        "nix-command"
        "flakes"

        "cgroups"
        "auto-allocate-uids"
      ];

      substituters = [
        "https://nix-community.cachix.org"
        "https://vicinae.cachix.org"
        "https://catppuccin.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
      ];

      use-xdg-base-directories = true;
    };
  };
}
