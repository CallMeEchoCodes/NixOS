{ config, lib, ... }:
{
  options.reverb.hardware = {
    wifi = lib.mkEnableOption "Wi-Fi" // {
      default = true;
    };
  };

  config = lib.mkIf config.reverb.hardware.wifi {
    hardware.wirelessRegulatoryDatabase = true;

    networking = {
      networkmanager = {
        enable = true;

        wifi = {
          backend = "iwd";
          powersave = true;
        };
      };
    };
  };
}
