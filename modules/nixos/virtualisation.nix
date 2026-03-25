{ ... }:
{
  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true; # TPM emulator
      };
    };

    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
}
