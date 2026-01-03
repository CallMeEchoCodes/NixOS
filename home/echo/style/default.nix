{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./gtk.nix
    ./qt.nix
  ];

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = true;
  };
}
