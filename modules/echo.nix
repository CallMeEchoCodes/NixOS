{ pkgs, inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.echo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    home = "/home/echo";
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "homemanager.bak";
    extraSpecialArgs = { inherit inputs; };

    users.echo = {
      imports = [
        ./home
      ];

      home.username = "echo";
      home.homeDirectory = "/home/echo";
    };
  };
}
