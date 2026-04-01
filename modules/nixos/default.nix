{
  inputs,
  ...
}:
{
  imports = [
    ../common
    ./nixos-init.nix
    ./hardware
    ./virtualisation.nix
    inputs.nur.modules.nixos.default
    ./boot.nix
    ./users.nix
    ./graphical
    ./services.nix
    ./locale.nix
    ./shell.nix
  ];

  programs.dconf.enable = true;
}
