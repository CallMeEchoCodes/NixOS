{
  inputs,
  ...
}:
{
  imports = [
    ../hosts
    ./lib.nix
  ];

  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;

        overlays = [
          inputs.nix-vscode-extensions.overlays.default
        ];

        config = {
          allowUnfree = true;
        };
      };

      imports = [ ../packages ];

      devShells.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs; [
          nixd
          nixfmt-rfc-style
        ];
      };
    };
}
