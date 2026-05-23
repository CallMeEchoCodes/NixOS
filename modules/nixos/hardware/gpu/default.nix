{ lib, config, ... }:
{
  imports = [
    ./amd.nix
    ./intel.nix
    # https://youtu.be/MShbP3OpASA?t=2996
  ];

  options.reverb.hardware.gpu = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "amd"
        "intel"
      ]
    );

    default = null;
  };

  config = lib.mkIf (config.reverb.hardware.gpu != null) {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
