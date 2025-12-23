{ ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home = {
    sessionVariables = {
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
}
