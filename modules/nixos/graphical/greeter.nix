{ pkgs, config, ... }:
{
  services.greetd = {
    enable = config.reverb.profiles.graphical.enable;

    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session";
      };
    };
  };
}
