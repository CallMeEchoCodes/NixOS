{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with inputs.nix-jetbrains-plugins.lib.${pkgs.stdenv.hostPlatform.system}; [
    (buildIdeWithPlugins pkgs.jetbrains "idea" [
      "com.github.catppuccin.jetbrains"
      "com.demonwav.minecraft-dev"
      "com.github.catppuccin.jetbrains_icons"
      "GLSL"
      "com.intellij.plugins.xwinkeymap"
    ])
  ];

  xdg.configFile =
    let
      dataDirName = (
        (lib.importJSON (pkgs.jetbrains.idea + /${pkgs.jetbrains.idea.pname}/product-info.json))
        .dataDirectoryName
      );
    in
    lib.mergeAttrsList (
      map
        (x: {
          "JetBrains/${dataDirName}/options/${x}".source = ./${x};
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
