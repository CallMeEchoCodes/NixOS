{ self, pkgs, ... }:
{
  home.packages = with pkgs; [
    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative
  ];

  programs.quickshell = {
    enable = true;
    systemd.enable = true;

    activeConfig = "${self}/modules/home/quickshell";

    package = (
      pkgs.runCommand "quickshell-wrapped"
        {
          nativeBuildInputs = [ pkgs.makeWrapper ];
          meta.mainProgram = pkgs.quickshell.meta.mainProgram;
        }
        ''
          mkdir -p $out/bin
          makeWrapper ${pkgs.quickshell}/bin/quickshell $out/bin/quickshell \
            --prefix QSG_RHI_BACKEND : "vulkan"
        ''
    );
  };
}
