{ lib, osConfig, ... }:
{
  catppuccin.cursors = {
    enable = true;
    accent = "dark";
  };

  home.pointerCursor = {
    enable = true;
    size = 24;
    dotIcons.enable = false;
    gtk.enable = true;

    x11.enable = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
    };

    settings = {
      "$mod" = "SUPER";

      input = {
        kb_layout = "us";

        follow_mouse = true;
        float_switch_override_focus = true;

        sensitivity = lib.mkIf osConfig.capabilities.touchpad.enable 0.5;
        accel_profile = lib.mkIf osConfig.capabilities.touchpad.enable "adaptive";

        # unnatural scroll
        touchpad.natural_scroll = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      ecosystem.no_donation_nag = true;

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

      general = {
        gaps_out = 20;

        border_size = 0;
        "col.active_border" = "0x00000000";
        "col.inactive_border" = "0x00000000";
      };

      decoration = {
        rounding = 10;

        shadow = {
          enabled = true;
          range = 15;
          render_power = 3;
          ignore_window = true;
          color = "0x33000000";
        };
      };

      layerrule = [
        "ignorealpha 0, vicinae"
        "noanim, vicinae"
      ];

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "noBezier, 0.1, 0.9, 0.1, 1"
        ];

        animation = [
          "windows, 1, 10, myBezier, popin 40%"

          "windowsOut, 1, 20, myBezier, popin 60%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slide"
        ];
      };
    };

  };
}
