{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./neovim
    ./quickshell
    ./discord.nix
    ./jetbrains.nix
    ./obs.nix
    ./spotify.nix
    ./terminal.nix
    ./vicinae.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
        jdk25
      ];
    })

    home-manager

    mpv
    audacity
    pwvucontrol

    renderdoc
    blockbench

    keepassxc # i switched to bitwarden but there is a decent chance i missed stuff so this is still here
    bitwarden-desktop

    # aseprite # build failure (https://github.com/NixOS/nixpkgs/issues/475832), disabled for now

    zenity
  ];
}
