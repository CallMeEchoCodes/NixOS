{ lib, config, ... }:
{
  imports = [
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
    hardware = {
      enableRedistributableFirmware = true;

      graphics = lib.mkIf config.reverb.hardware.video {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
