{ config, pkgs, ... }:
{
  services = {
    upower = {
      enable = config.capabilities.battery.enable;

      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;

      criticalPowerAction = "Hibernate";
    };

    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    pipewire = {
      enable = config.capabilities.audio.enable;
      pulse.enable = true;

      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          "bluez5.enable-hw-volume" = true;
        };
      };
    };
  };
}
