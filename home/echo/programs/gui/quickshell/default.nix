{
  config,
  ...
}:
{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile.quickshell = {
    enable = true;

    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/NixOS/home/echo/programs/quickshell";
    target = "quickshell";
  };
}
