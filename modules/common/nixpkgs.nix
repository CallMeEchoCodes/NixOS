{ ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      problems.handlers = {
        "gtk+".broken = "warn"; # TEMPORARY: remove when onlyoffice is fixed!
      };
    };
  };
}
