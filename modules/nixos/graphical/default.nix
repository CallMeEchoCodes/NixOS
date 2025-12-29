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

  environment.sessionVariables = {
    LD_LIBRARY_PATH = map (pkg: "${pkg}/lib") (
      with pkgs;
      [
        # required for lwjgl games
        glfw
        libpulseaudio
        libGL
        openal
        stdenv.cc.cc

        udev # oshi

        xorg.libX11
        xorg.libXext
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXxf86vm
      ]
    );
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

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      renderdoc
      libglvnd
      glfw
    ];
  };

  programs.kdeconnect.enable = true;

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
