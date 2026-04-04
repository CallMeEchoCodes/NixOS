{ ... }:
{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;

    allowSFTP = true;

    openFirewall = true;
    ports = [ 22 ];

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AuthenticationMethods = "publickey";
      PubkeyAuthentication = "yes";
      ChallengeResponseAuthentication = "no";

      UsePAM = false;
      UseDns = false;
      X11Forwarding = false;

      ClientAliveCountMax = 5;
      ClientAliveInterval = 60;
    };
  };
}
