{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.reverb.hardware.gpu == "intel") {
    services.xserver.videoDrivers = [ "modesetting" ];

    hardware.graphics.extraPackages = with pkgs; [
      intel-media-driver # vaapi impl for most hw accel
      vpl-gpu-rt # hw accel for media conversion

      intel-compute-runtime # opencl
    ];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
}
