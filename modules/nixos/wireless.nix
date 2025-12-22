{ config, ... }:
{
  networking.networkmanager.enable = config.capabilities.wireless.enable;

  hardware.bluetooth = {
    enable = config.capabilities.wireless.enable;

    powerOnBoot = true;
    settings = {
      General.Experimental = true;
      Policy.AutoEnable = true;
    };
  };

  services.blueman.enable = config.capabilities.wireless.enable;
}
