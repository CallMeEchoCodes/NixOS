{ inputs, ... }:

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
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = [ "eDP-1,1920x1080,0x0,1" ];

      input = {
        sensitivity = 0.5;
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod SHIFT, mouse:272, resizewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind = [
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"

        "$mod SHIFT, M, exit"

        "$mod, RETURN, exec, kitty"
        "$mod, R, exec, vicinae toggle"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
      ]
      ++ builtins.concatLists (
        builtins.genList (
          i:
          let
            workspace = i + 1;
          in
          [
            "$mod, ${toString workspace}, workspace, ${toString workspace}"
            "$mod SHIFT, ${toString workspace}, movetoworkspace, ${toString workspace}"
          ]
        ) 9
      );
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "romanbarrettsarpi@pm.me";
        name = "CallMeEchoCodes";
      };

      init.defaultBranch = "main";
    };
  };

  catppuccin = {
    accent = "pink";
    flavor = "mocha";
  };

  home.stateVersion = "25.11";
}
