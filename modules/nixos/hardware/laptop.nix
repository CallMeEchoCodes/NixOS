{ lib, config, ... }:
{
  options.reverb.hardware = {
    battery = lib.mkEnableOption "Battery";
    touchpad = lib.mkEnableOption "Touchpad";
  };

  config = {
    services.upower = {
      enable = config.reverb.hardware.battery;

      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;

      criticalPowerAction = "Hibernate";
    };
  };
}
