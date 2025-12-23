{
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
    ./spotify.nix
  ];

  services.hyprpolkitagent.enable = true;

  catppuccin = {
    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  xdg.userDirs.enable = true;

  services.kdeconnect.enable = true;

  home = {
    stateVersion = "25.11";
  };
}
