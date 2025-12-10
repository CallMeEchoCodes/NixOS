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
  services.hyprpolkitagent.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  home.stateVersion = "25.11";
}
