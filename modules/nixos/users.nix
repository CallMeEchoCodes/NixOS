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
    ];

    home = "/home/echo";
    uid = 1000;
  };
}
