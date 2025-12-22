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
    audio.enable = true;
    graphics.enable = true;
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

  home-manager.users.echo = {
    wayland.windowManager.hyprland.settings = {
      monitor = [ "eDP-1,1920x1080,0x0,1" ];
    };
  };

  system.stateVersion = "25.11";
  networking.hostName = "echoslaptop";
}
