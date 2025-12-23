{ inputs, ... }:
{
  nix = {
    channel.enable = false;
    settings = {
      warn-dirty = false;

      auto-optimise-store = true;

      max-jobs = "auto";

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://nix-community.cachix.org"
        "https://vicinae.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      ];

      use-xdg-base-directories = true;
    };

  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
    };

    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
  };
}
