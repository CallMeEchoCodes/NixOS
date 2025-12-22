{ config, ... }:
{
  services = {
    upower = {
      enable = config.capabilities.battery.enable;

      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;

      criticalPowerAction = "Hibernate";
    };

    gvfs.enable = true;
    udisks2.enable = true;

    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    pipewire = {
      enable = config.capabilities.audio.enable;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
      jack.enable = true;

      wireplumber.extraConfig.bluetoothEnhancements = {
        "monitor.bluez.properties" = {
          "bluez5.enable-hw-volume" = true;
        };
      };
    };
  };
}
