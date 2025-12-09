{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/echo.nix
    ../../modules/core
    ../../modules/graphical
    ../../modules/wireless.nix
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        # ocl has some weird ca cert issue. no idea how to fix it. dont really need it anyway.
        # intel-ocl
        intel-vaapi-driver
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    powertop
  ];

  services = {
    upower = {
      enable = true;

      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;

      criticalPowerAction = "PowerOff";
    };
  };

  home-manager.users.echo = {
    wayland.windowManager.hyprland.settings = {
      monitor = [ "eDP-1,1920x1080,0x0,1" ];
    };
  };

  networking.hostName = "echoslaptop";
}
