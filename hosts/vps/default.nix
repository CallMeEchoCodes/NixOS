{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  reverb = {
    hardware = {
      cpu = "intel";
      gpu = null;

      bluetooth = false;
      wifi = false;

      audio = false;
      video = false;
    };

    profiles = {
      server.enable = true;
    };
  };

  system.stateVersion = "25.11";
  networking.hostName = "echosvps";
}
