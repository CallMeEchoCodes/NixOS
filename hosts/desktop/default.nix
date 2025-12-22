{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  capabilities = {
    audio.enable = true;
    graphics.enable = true;
  };

  services = {
    fstrim.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
    };
  };

  boot.initrd.kernelModules = [ "amdgpu" ];

  # This stops my GPU from repeatedly crashing.
  services.udev.extraRules = ''
    SUBSYSTEM=="drm", KERNEL=="card1", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

  home-manager.users.echo = {
    wayland.windowManager.hyprland.settings = {
      monitor = [
        "DP-1,1920x1080@144,1920x0,1"
        "HDMI-A-1,preferred,0x0,1"
      ];
    };
  };

  system.stateVersion = "25.11";
  networking.hostName = "echosdesktop";
}
