{
  description = "Echo's personal NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";

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

    catppuccin.url = "github:catppuccin/nix";
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];
      imports = [ ./flake ];
    };

  # outputs =
  #   inputs@{
  #     self,
  #     nixpkgs,
  #     flake-parts,
  #     ...
  #   }:
  #   let
  #     system = "x86_64-linux";
  #     pkgs = import nixpkgs {
  #       inherit system;
  #     };
  #     specialArgs = {
  #       inherit inputs;
  #       inherit system;
  #       inherit self;
  #     };
  #   in
  #   {
  #     imports = [
  #       ./modules/flake
  #     ];

  #     nixosConfigurations = {
  #       laptop = nixpkgs.lib.nixosSystem {
  #         inherit system;
  #         inherit specialArgs;

  #         modules = [
  #           ./hosts/laptop
  #         ];
  #       };
  #     };
  #   };
}
