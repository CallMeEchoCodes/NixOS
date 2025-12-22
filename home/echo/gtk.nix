{ pkgs, ... }:
{
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
