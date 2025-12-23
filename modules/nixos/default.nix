{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../common
    inputs.nur.modules.nixos.default
    inputs.home-manager.nixosModules.home-manager
    ../../home
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./graphical
    ./wireless.nix
    ./services.nix
  ];

  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_AU.UTF-8";

  services.fwupd.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    bat = {
      enable = true;
      settings = {
        "style" = "plain";
      };
    };
  };

  environment.systemPackages =
    with pkgs;
    [
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
      fzf

      zip
      unzip
      zstd

      cacert
    ]
    ++ (lib.optionals config.capabilities.battery.enable (
      with pkgs;
      [
        acpi
        brightnessctl
      ]
    ))
    ++ lib.optional config.capabilities.audio.enable pkgs.pwvucontrol;
}
