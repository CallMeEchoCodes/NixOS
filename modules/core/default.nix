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

  services.fwupd.enable = true;

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
    ripgrep

    zip
    unzip
    zstd

    nixfmt
    nixd

    home-manager

    cacert
    qtcreator
    kdePackages.qtdeclarative
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.11";
}
