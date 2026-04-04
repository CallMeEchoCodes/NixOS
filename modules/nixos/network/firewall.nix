{ config, ... }:
{
  networking = {
    nftables.enable = true;
    firewall = {
      enable = true;

      allowPing = config.reverb.profiles.server.enable;

      logReversePathDrops = true;
      logRefusedConnections = false;
      checkReversePath = false;
    };
  };
}
