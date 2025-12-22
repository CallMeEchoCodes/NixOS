{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea [
      "catppuccin-theme"
      "minecraft-development"
    ])
  ];

  xdg.configFile = lib.mergeAttrsList (
    builtins.map
      (x: {
        "JetBrains/${
          (lib.importJSON (pkgs.jetbrains.idea + /${pkgs.jetbrains.idea.pname}/product-info.json))
          .dataDirectoryName
        }/options/${x}".source =
          ./${x};
      })
      [
        "colors.scheme.xml"
        "laf.xml"
        "ui.lnf.xml"
        "terminal-font.xml"
        "editor-font.xml"
        "editor.xml"
        "ide.general.xml"
        "linux/keymap.xml"
      ]
  );
}
