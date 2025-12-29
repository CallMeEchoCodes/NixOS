{
  lib,
  osConfig,
  self',
  pkgs,
  ...
}:
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

  home.packages = with pkgs; [
    wl-clipboard
    self'.packages.screenshooter
    aseprite
    nautilus
  ];

  xdg.mimeApps.defaultApplications = lib.attrsets.genAttrs [
    "inode/directory"
    "application/x-gnome-saved-search"
  ] (f: "org.gnome.Nautilus.desktop");

  # TODO: quickshell notis
  services.dunst.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
    };

    settings = {
      "$mod" = "SUPER";

      monitor = lib.attrsets.mapAttrsToList (
        name: monitor:
        with monitor;
        "${name},${toString width}x${toString height}@${toString refreshRate},${toString offsetX}x${toString offsetY},1"
      ) osConfig.reverb.monitors;

      input = {
        kb_layout = "us";

        follow_mouse = true;
        float_switch_override_focus = true;

        sensitivity = if osConfig.reverb.hardware.touchpad then 0.5 else 2.0;
        accel_profile = if osConfig.reverb.hardware.touchpad then "adaptive" else "flat";

        # unnatural scroll
        touchpad.natural_scroll = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      xwayland = {
        use_nearest_neighbor = true;
        force_zero_scaling = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;

        animate_mouse_windowdragging = true;
        animate_manual_resizes = true;

        enable_anr_dialog = false;
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

        "$mod SHIFT, S, exec, ${self'.packages.screenshooter}/bin/screenshooter"

        "$mod SHIFT, M, exit"

        "$mod, RETURN, exec, kitty"
        "$mod, R, exec, vicinae toggle"
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

      windowrule = [
        "noblur, title:windowkill"
        "float,title:UNDERTALE"
        "noinitialfocus,class:^jetbrains-.*$,floating:1,title:^$|^\\s$|^win\\d+$"
      ];

      layerrule = [
        "ignorezero, vicinae"
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
