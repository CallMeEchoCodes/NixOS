{
  self,
  self',
  inputs,
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
    };

    users.echo = ./echo;
  };
}
