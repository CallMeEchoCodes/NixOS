{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.reverb.profiles.graphical.enable {
    environment = {
      systemPackages = with pkgs; [
        wl-clipboard
      ];

      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        _JAVA_AWT_WM_NONREPARENTING = "1";
        GDK_BACKEND = "wayland,x11";
        ANKI_WAYLAND = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_SESSION_TYPE = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
      };
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    xdg.portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];

      xdgOpenUsePortal = false;

      config = {
        common.default = [ "gtk" ];
        hyprland.default = [
          "gtk"
          "hyprland"
        ];
      };
    };
  };
}
