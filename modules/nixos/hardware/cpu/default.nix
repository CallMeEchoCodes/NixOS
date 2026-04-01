{ lib, ... }:
{
  imports = [
    # ./amd.nix # i dont own any AMD cpus
    ./intel.nix
  ];

  options.reverb.hardware.cpu = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "amd"
        "intel"
      ]
    );

    default = null;
  };
}
