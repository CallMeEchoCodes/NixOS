{
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
}
