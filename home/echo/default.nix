{ ... }:
{
  imports = [
    ./direnv.nix
    ./shell.nix
    ./style
    ./programs
  ];

  xdg.userDirs = {
    enable = true;
    setSessionVariables = true;
  };

  home.stateVersion = "25.11";
}
