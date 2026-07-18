{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  reverb = {
    hardware = {
      cpu = "intel";
      gpu = "intel";

      battery = true;
      bluetooth = true;
      touchpad = true;
    };

    monitors = {
      eDP-1 = {
        width = 1920;
        height = 1080;

        primary = true;
      };
    };

    profiles = {
      graphical.enable = true;
    };

    features = {
      virtualisation.enable = false;
    };
  };

  boot.kernelParams = [
    # Force use of the thinkpad_acpi driver for backlight control.
    # This allows the backlight save/load systemd service to work.
    "acpi_backlight=native"
  ];

  services = {
    fprintd.enable = true;
    # throttled.enable = true; # seems to be broken
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
