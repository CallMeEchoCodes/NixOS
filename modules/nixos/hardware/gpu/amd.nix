{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.reverb.hardware.gpu == "amd") {
    services.xserver.videoDrivers = [ "amdgpu" ];
    boot.kernelModules = [ "amdgpu" ];

    # OpenCL
    hardware.graphics.extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
    ];
  };
}
