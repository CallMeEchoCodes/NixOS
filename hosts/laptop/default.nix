{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  reverb = {
    hardware = {
      gpu = "intel";

      battery = true;
      touchpad = true;
    };

    monitors = {
      eDP-1 = {
        width = 1920;
        height = 1080;
      };
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
  };

  system.stateVersion = "25.11";
  networking.hostName = "echoslaptop";
}
