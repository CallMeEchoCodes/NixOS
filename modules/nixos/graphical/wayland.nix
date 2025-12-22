{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard

    (pkgs.writeShellApplication {
      name = "screenshooter";
      runtimeInputs = [
        slurp
        grim
        hyprpicker # used to freeze the screen, very hacky
        wl-clipboard
        xdg-user-dirs
        coreutils
      ];
      text = builtins.readFile ./screenshooter.sh;
    })
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    xdgOpenUsePortal = true;

    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };
  };
}
