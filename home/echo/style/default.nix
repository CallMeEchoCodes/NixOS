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

    autoEnable = osConfig.reverb.profiles.graphical.enable;
    enable = osConfig.reverb.profiles.graphical.enable;
  };
}
