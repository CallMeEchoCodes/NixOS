{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nur.modules.nixos.default
    inputs.catppuccin.nixosModules.catppuccin
    ./boot.nix
    ./services.nix
    ./security.nix
    ./nix.nix
    ./fonts.nix
  ];

  programs.fish = {
    enable = true;
  };
  # fish enables this by default and it makes builds unbearably slow
  documentation.man.generateCaches = false;

  time.timeZone = "Australia/Melbourne";

  i18n.defaultLocale = "en_AU.UTF-8";

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    trash-cli

    # waow nix is super minimal by default
    killall
    file
    coreutils
    gnused
    rsync
    tree

    zip
    unzip

    nixfmt-rfc-style
    nixd

    neovim
    kitty

    home-manager

    cacert
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.11";
}
