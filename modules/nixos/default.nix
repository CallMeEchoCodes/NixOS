{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../common
    inputs.nur.modules.nixos.default
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./graphical
    ./wireless.nix
    ./services.nix
    ./locale.nix
    ./shell.nix
  ];

  services.fwupd.enable = true;
}
