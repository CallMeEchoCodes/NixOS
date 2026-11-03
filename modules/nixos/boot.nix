{
  pkgs,
  ...
}:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;

        bootCounting.enable = true;
        memtest86.enable = true;

        # sophie-proofing
        editor = false;
      };

      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    tmp = {
      cleanOnBoot = true;
    };
  };
}
