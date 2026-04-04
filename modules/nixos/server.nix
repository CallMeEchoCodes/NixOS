{
  pkgs,
  lib,
  config,
  ...
}:
let
  force = o: lib.mapAttrs (_: lib.mkForce) o;
in
{
  config = lib.mkIf config.reverb.profiles.server.enable {
    environment.systemPackages = with pkgs; [
      kitty.terminfo
    ];

    fonts = force {
      packages = [ ];
      fontDir.enable = false;
      fontconfig.enable = false;
    };

    xdg = force {
      sounds.enable = false;
      mime.enable = false;
      menus.enable = false;
      icons.enable = false;
      autostart.enable = false;
    };

    systemd = {
      enableEmergencyMode = false;

      settings.Manager = {
        RuntimeWatchdogSec = "20s";
        RebootWatchdogSec = "30s";
      };

      sleep.settings.Sleep = {
        AllowSuspend = false;
        AllowHibernation = false;
      };
    };
  };
}
