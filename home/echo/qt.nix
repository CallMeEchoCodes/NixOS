{ pkgs, ... }:
{
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme = {
      package = with pkgs; [
        darkly
        darkly-qt5

        libsForQt5.qt5ct
        kdePackages.qt6ct
      ];
    };

    platformTheme.name = "qtct";
  };

  catppuccin.kvantum.enable = true;
  home = {
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
}
