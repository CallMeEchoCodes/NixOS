{
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  config = lib.mkIf osConfig.reverb.profiles.graphical.enable {
    catppuccin.cursors = {
      enable = true;
      accent = "dark";
    };
    
    catppuccin.hyprland.enable = false;

    home.pointerCursor = {
      enable = true;
      size = 24;
      dotIcons.enable = false;
      gtk.enable = true;

      x11.enable = false;
    };

    home.packages = with pkgs; [
      wl-clipboard
      screenshooter
      hyprpicker
      nautilus
    ];

    services.hyprpolkitagent.enable = true;
    services.kdeconnect.enable = true;

    xdg.mimeApps.enable = true;
    xdg.mimeApps.defaultApplications = lib.attrsets.genAttrs [
      "inode/directory"
      "application/x-gnome-saved-search"
    ] (f: "org.gnome.Nautilus.desktop");

    # TODO: quickshell notis
    services.dunst.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;

      systemd.enable = true;

      configType = "lua";
      extraConfig =
        let
          monitors = lib.strings.concatStringsSep "\n" (
            lib.attrsets.mapAttrsToList (
              name: monitor: with monitor; ''
                monitors["${name}"] = {
                  width = ${toString width},
                  height = ${toString height},
                  primary = ${if primary then "true" else "false"},
                  refresh_rate = ${toString refreshRate},
                  offset = {
                    x = ${toString offsetX},
                    y = ${toString offsetY}
                  },
                  scale = ${toString scale}
                }
              ''
            ) osConfig.reverb.monitors
          );
          primaryMonitor = builtins.elemAt (builtins.attrNames (
            lib.attrsets.filterAttrs (name: value: value.primary) osConfig.reverb.monitors
          )) 0;
        in
        ''
          local primary_monitor = "${primaryMonitor}"
          
	  local monitors = {}
	  ${monitors}

	  local touchpad = ${if osConfig.reverb.hardware.touchpad then "true" else "false"}

          ${builtins.readFile ./hyprland.lua}
        '';
    };
  };
}

