{
  self,
  self',
  inputs,
  system,
  ...
}:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "homemanager.bak";
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
      inherit self';
      inherit system;
    };

    users.echo = ./echo;
  };
}
