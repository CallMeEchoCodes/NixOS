{ pkgs, ... }:
{
  packages = {
    screenshooter = pkgs.callPackage ./screenshooter { };
  };
}
