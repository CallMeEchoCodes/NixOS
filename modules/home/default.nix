{ pkgs, inputs, ... }:

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
    ./quickshell
  ];

  qt = {
    enable = true;
    style = {
      name = "kvantum";
    };
  };

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  home.stateVersion = "25.11";
}
