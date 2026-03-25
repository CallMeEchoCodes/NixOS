{
  inputs,
  ...
}:
{
  imports = [
    ../common
    ./hardware
    ./virtualisation.nix
    inputs.nur.modules.nixos.default
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./graphical
    ./services.nix
    ./locale.nix
    ./shell.nix
  ];

  programs.dconf.enable = true;
}
