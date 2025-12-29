{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  reverb = {
    hardware = {
      gpu = "amd";

      bluetooth = false;
      wifi = false;
    };

    monitors = {
      DP-1 = {
        width = 1920;
        height = 1080;

        refreshRate = 144.0;
      };

      HDMI-A-1 = {
        width = 1920;
        height = 1080;

        offsetX = -1920;
      };
    };
  };

  # This stops my GPU from repeatedly crashing.
  services.udev.extraRules = ''
    SUBSYSTEM=="drm", KERNEL=="card1", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

  system.stateVersion = "25.11";
  networking.hostName = "echosdesktop";
}
