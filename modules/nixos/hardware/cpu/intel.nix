{ lib, config, ... }:
{
  config = lib.mkIf (config.reverb.hardware.cpu == "intel") {
    hardware.cpu.intel.updateMicrocode = true;

    boot = {
      kernelModules = [ "kvm-intel" ];
      kernelParams = [ "i915.fastboot=1" ];
    };
  };
}
