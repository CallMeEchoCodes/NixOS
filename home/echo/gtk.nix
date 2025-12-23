{ pkgs, ... }:
{
  home.sessionVariables.GTK_USE_PORTAL = "1";

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        size = "standard";
        accents = [ "pink" ];
        variant = "mocha";
      };
    };

    font = {
      name = "Inter";
      size = 11;
    };
  };
}
