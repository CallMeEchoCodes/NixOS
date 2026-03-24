{
  description = "Echo's personal NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-jetbrains-plugins.url = "github:nix-community/nix-jetbrains-plugins";

    catppuccin.url = "github:catppuccin/nix";
    vicinae.url = "github:vicinaehq/vicinae";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      util = import ./util.nix (inputs // { lib = nixpkgs.lib; });
      mkNixOSSystem =
        name:
        (nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit util;
            inherit system;
            inherit inputs;
          };

          modules = [
            ./hosts/${name}
            ./modules/nixos
            ./modules/packages
          ];
        });
    in
    {
      nixosConfigurations = {
        laptop = (mkNixOSSystem "laptop");
        desktop = (mkNixOSSystem "desktop");
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs; [
          nixd
          nixfmt
        ];
      };
    };
}
