{ config, lib, ... }:
{
  options.reverb.features.virtualisation.enable = lib.mkEnableOption "Virtualisation" // {
    default = true;
  };

  config = lib.mkIf config.reverb.features.virtualisation.enable {
    virtualisation = {
      libvirtd = {
        enable = true;

        qemu = {
          swtpm.enable = true; # TPM emulator
        };
      };

      spiceUSBRedirection.enable = true;

      docker.enable = true;
    };

    programs.virt-manager.enable = true;
  };
}
