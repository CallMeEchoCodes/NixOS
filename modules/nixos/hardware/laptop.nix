{ lib, config, ... }:
{
  options.reverb.hardware = {
    battery = lib.mkEnableOption "Battery";
    touchpad = lib.mkEnableOption "Touchpad";
  };

  config = {
    powerManagement.enable = config.reverb.hardware.battery;

    services = {
      acpid.enable = config.reverb.hardware.battery;
      tlp.enable = config.reverb.hardware.battery;
      thermald.enable = config.reverb.hardware.battery && (config.reverb.hardware.cpu == "intel");

      upower = {
        enable = config.reverb.hardware.battery;

        percentageLow = 20;
        percentageCritical = 5;
        percentageAction = 3;

        criticalPowerAction = "Hibernate";
      };
    };
  };
}
