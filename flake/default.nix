{ inputs, ... }:
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

        config = {
          allowUnfree = true;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        buildInputs = with pkgs; [
          nixd
          nixfmt-rfc-style
        ];
      };
    };
}
