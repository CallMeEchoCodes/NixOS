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

    hardware.graphics.extraPackages = with pkgs; [
      # OpenCL
      rocmPackages.clr
      rocmPackages.clr.icd

      vulkan-loader
    ];
  };
}
