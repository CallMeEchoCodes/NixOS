{ pkgs, ... }:
{
  imports = [
    ./gui
    ./neovim
  ];

  home.packages = with pkgs; [
    home-manager
  ];
}
