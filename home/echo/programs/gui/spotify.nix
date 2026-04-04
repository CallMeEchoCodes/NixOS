{
  pkgs,
  inputs,
  osConfig,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = osConfig.reverb.profiles.graphical.enable;

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";

      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        copyToClipboard
        hidePodcasts
        adblock
        volumePercentage
        aiBandBlocker
      ];
    };
}
