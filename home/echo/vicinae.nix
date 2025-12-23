{ inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    settings = {
      theme.name = "catppuccin-mocha";

      window = {
        opacity = 1;
      };
    };
  };
}
