{ ... }:
{
  services = {
    gvfs.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;
    };

    dbus = {
      enable = true;
      implementation = "broker";
    };
  };
}
