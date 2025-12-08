{ pkgs, ... }:
{
  imports = [
    ./wayland.nix
  ];

  services = {
    libinput.enable = true;
    gpm.enable = true;
  };

  catppuccin = {
    cache.enable = true;

    accent = "pink";
    flavor = "mocha";

    tty.enable = true;
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v22n.psf.gz";
    keyMap = "us";
  };
}
