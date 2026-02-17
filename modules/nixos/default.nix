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

  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.qemu = {
    swtpm.enable = true;
  };
  programs.virt-manager.enable = true;
}
