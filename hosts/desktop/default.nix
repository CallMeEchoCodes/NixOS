{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  capabilities = {
    audio.enable = true;
    graphics.enable = true;
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

  services = {
    fstrim.enable = true;

    # This stops my GPU from repeatedly crashing.
    udev.extraRules = ''
      SUBSYSTEM=="drm", KERNEL=="card1", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
    '';
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [ mesa ];
    };
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

  system.stateVersion = "25.11";
  networking.hostName = "echosdesktop";
}
