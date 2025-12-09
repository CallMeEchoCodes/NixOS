{ pkgs, ... }:
{
  imports = [
    ./wayland.nix
    ./greeter.nix
  ];

  services = {
    libinput.enable = true;
    gpm.enable = true;
  };

  qt.enable = true;

  catppuccin = {
    cache.enable = true;

    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v22n.psf.gz";
    keyMap = "us";
  };
}
