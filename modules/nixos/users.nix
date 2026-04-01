{
  inputs,
  config,
  lib,
  ...
}:
let
  filterExistingGroups = groups: lib.filter (group: lib.hasAttr group config.users.groups) groups;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../home
  ];

  users = {
    # mutableUsers = false;

    users.echo = {
      isNormalUser = true;
      extraGroups = filterExistingGroups [
        "wheel"
        "nix"
        "audio"
        "pipewire"
        "video"
        "input"
        "network"
        "networkmanager"
        "libvirtd"
      ];

      home = "/home/echo";
      uid = 1000;
    };
  };
}
