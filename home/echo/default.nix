{
  inputs,
  pkgs,
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
    packages = with pkgs; [
      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
          jdk25
        ];
      })

      mpv
      audacity
      pwvucontrol

      renderdoc
      blockbench

      keepassxc # i switched to bitwarden but there is a decent chance i missed stuff so this is still here
      bitwarden-desktop

      zenity
    ];

    stateVersion = "25.11";
  };
}
