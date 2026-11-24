{ ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;

    allowBroken = false;
    allowUnsupportedSystem = false;
  };
}
