{ inputs, osConfig, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  programs.vicinae = {
    enable = osConfig.reverb.profiles.graphical.enable;

    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      launcher_window = {
        opacity = 1.0;
      };
    };
  };
}
