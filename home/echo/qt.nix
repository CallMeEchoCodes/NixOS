{ pkgs, ... }:
{
  qt = {
    enable = true;

    style.package = with pkgs; [
      darkly
      darkly-qt5

      libsForQt5.qt5ct
      kdePackages.qt6ct
    ];

    platformTheme = {
      name = "qtct";
    };
  };

  catppuccin.kvantum.enable = false;

  home = {
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
}
