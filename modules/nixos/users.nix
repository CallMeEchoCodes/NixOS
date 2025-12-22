{ pkgs, ... }:
{
  programs.fish.enable = true;

  # fish enables this by default and it makes builds unbearably slow
  documentation.man.generateCaches = false;

  users.users.echo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "nix"
    ];
    shell = pkgs.fish;
    home = "/home/echo";
    uid = 1000;
  };
}
