{ ... }:
{
  services = {
    gvfs.enable = true;
    udisks2.enable = true;

    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
