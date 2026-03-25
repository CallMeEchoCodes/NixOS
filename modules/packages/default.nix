{ ... }:
{
  nixpkgs.overlays = [
    (
      self: super:
      let
        pkgs = self.pkgs;
      in
      {
        screenshooter = pkgs.callPackage ./screenshooter { };
        compressvideo = pkgs.callPackage ./compressvideo { };
      }
    )
  ];
}
