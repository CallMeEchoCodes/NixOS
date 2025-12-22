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

    source = config.lib.file.mkOutOfStoreSymlink ./.;
    target = "quickshell";
  };
}
