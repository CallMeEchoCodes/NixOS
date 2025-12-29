{
  inputs,
  ...
}:
{
  imports = [
    ../common
    ./hardware
    inputs.nur.modules.nixos.default
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./graphical
    ./services.nix
    ./locale.nix
    ./shell.nix
  ];

  services.fwupd.enable = true;
}
