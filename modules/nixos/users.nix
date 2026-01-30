{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../home
  ];

  users.users.echo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "nix"
      "audio"
      "video"
    ];

    home = "/home/echo";
    uid = 1000;
  };
}
