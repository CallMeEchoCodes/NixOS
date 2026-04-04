{ inputs, osConfig, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ./gtk.nix
    ./qt.nix
  ];

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = osConfig.reverb.profiles.graphical.enable;
  };
}
