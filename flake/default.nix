inputs:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  util = import ./util.nix (inputs // { lib = nixpkgs.lib; });

  mkNixOSConfiguration =
    name:
    (lib.nixosSystem {
      specialArgs = {
        inherit inputs util;
      };

      modules = [
        ../hosts/${name}
        ../modules/nixos
        ../modules/packages
      ];
    });

  systems = [ "x86_64-linux" ];
  genSystemAttrs = fn: lib.attrsets.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});
in
{
  nixosConfigurations = {
    laptop = (mkNixOSConfiguration "laptop");
    desktop = (mkNixOSConfiguration "desktop");
  };

  devShells = genSystemAttrs (pkgs: {
    default = pkgs.mkShellNoCC {
      buildInputs = with pkgs; [
        nixd
        nixfmt
      ];
    };
  });
}
