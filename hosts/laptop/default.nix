{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  capabilities = {
    battery.enable = true;
    touchpad.enable = true;
    wireless.enable = true;
    audio.enable = true;
    graphics.enable = true;
  };

  monitors = {
    eDP-1 = {
      width = 1920;
      height = 1080;
    };
  };

  boot.kernelParams = [
    # Force use of the thinkpad_acpi driver for backlight control.
    # This allows the backlight save/load systemd service to work.
    "acpi_backlight=native"
  ];

  services = {
    fstrim.enable = true;
    fprintd.enable = true;
  };

  hardware = {
    trackpoint = {
      enable = true;
      emulateWheel = true;
    };

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

  system.stateVersion = "25.11";
  networking.hostName = "echoslaptop";
}
