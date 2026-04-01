{ inputs, ... }:
{
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
