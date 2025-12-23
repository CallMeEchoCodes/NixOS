{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    ./wayland.nix
    ./greeter.nix
    ./fonts.nix
    ./security.nix
  ];

  services = {
    libinput.enable = true;
    gpm.enable = true;
  };

  qt.enable = true;

  catppuccin = {
    cache.enable = true;

    accent = "pink";
    flavor = "mocha";

    enable = true;
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v22n.psf.gz";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        jdk8
        jdk17
        jdk21
        jdk25
      ];
    })

    nautilus
    keepassxc

    hunspell
    hunspellDicts.en_AU
    hunspellDicts.en_GB-ise

    mpv
    audacity
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
