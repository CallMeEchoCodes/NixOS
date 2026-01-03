{ inputs, ... }:
{
  imports = [
    inputs.nur.modules.homeManager.default
    ./direnv.nix
    ./shell.nix
    ./wayland.nix
    ./style
    ./programs
  ];

  xdg.userDirs.enable = true;

  home.stateVersion = "25.11";
}
