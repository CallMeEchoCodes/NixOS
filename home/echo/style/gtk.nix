{ pkgs, config, ... }:
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
        accents = [ config.catppuccin.accent ];
        variant = config.catppuccin.flavor;
      };
    };

    font = {
      name = "Inter";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;

      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;

      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
    };
  };
}
