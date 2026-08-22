{
  osConfig,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./firefox
    ./quickshell
    ./discord.nix
    ./jetbrains.nix
    ./obs.nix
    ./spotify.nix
    ./terminal.nix
    ./vicinae.nix
    ./vscode.nix
    ./hyprland
  ];

  config = lib.mkIf osConfig.reverb.profiles.graphical.enable {
    home.packages = with pkgs; [
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
      # bitwarden-desktop # disabled as the electron version it uses is deprecated.

      # aseprite

      zenity

      pnpm
      nodejs

      rgp # radeon graphics profiler

      (python3.withPackages (
        python-pkgs: with python-pkgs; [
          tkinter
        ]
      ))

      imhex

      wineWow64Packages.waylandFull

      obsidian

      onlyoffice-desktopeditors
      krita
      blender

      firebird-emu
    ];
  };
}
