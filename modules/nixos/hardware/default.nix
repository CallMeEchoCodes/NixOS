{ lib, config, ... }:
{
  imports = [
    ./cpu
    ./gpu
    ./bluetooth.nix
    ./wifi.nix
    ./disc.nix
    ./laptop.nix
    ./audio.nix
  ];

  options.reverb.hardware = {
    video = lib.mkEnableOption "Video" // {
      default = true;
    };
  };

  config = {
    services.fwupd.enable = true;

    hardware = {
      enableRedistributableFirmware = true;
      xpadneo.enable = config.reverb.hardware.video;

      graphics = lib.mkIf config.reverb.hardware.video {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
