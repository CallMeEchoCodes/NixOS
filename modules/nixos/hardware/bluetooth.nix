{ config, lib, ... }:
{
  options.reverb.hardware = {
    bluetooth = lib.mkEnableOption "Bluetooth" // {
      default = true;
    };
  };

  config = lib.mkIf config.reverb.hardware.bluetooth {
    hardware.bluetooth = {
      enable = true;

      powerOnBoot = true;
      settings = {
        General.Experimental = true;
        Policy.AutoEnable = true;
      };
    };

    services.blueman.enable = true;
  };
}
