{
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.reverb.profiles.graphical.enable {
    home.packages = with inputs.nix-jetbrains-plugins.lib; [
      (buildIdeWithPlugins pkgs "idea" [
        "com.github.catppuccin.jetbrains"
        "com.github.catppuccin.jetbrains_icons"
        "com.demonwav.minecraft-dev"
        "GLSL"
      ])
      (buildIdeWithPlugins pkgs "pycharm" [
        "com.github.catppuccin.jetbrains"
        "com.github.catppuccin.jetbrains_icons"
      ])
      (buildIdeWithPlugins pkgs "clion" [
        "com.github.catppuccin.jetbrains"
        "com.github.catppuccin.jetbrains_icons"
      ])
      (buildIdeWithPlugins pkgs "rust-rover" [
        "com.github.catppuccin.jetbrains"
        "com.github.catppuccin.jetbrains_icons"
      ])
    ];
  };
}
