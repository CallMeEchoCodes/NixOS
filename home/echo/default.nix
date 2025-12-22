{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nur.modules.homeManager.default
    ./discord.nix
    ./direnv.nix
    ./vicinae.nix
    ./vscode.nix
    ./firefox
    ./neovim
    ./shell.nix
    ./terminal.nix
    ./wayland.nix
    ./gtk.nix
    ./qt.nix
    ./quickshell
    ./jetbrains
  ];

  services.hyprpolkitagent.enable = true;

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  home = {
    stateVersion = "25.11";
  };
}
