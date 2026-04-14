{
  config,
  lib,
  ...
}:
{
  options.reverb.services.reposilite.enable = lib.mkEnableOption "Enable Reposilite";

  config = {
    reverb.services.postgresql.enable = true;

    services = {
      reposilite = {
        enable = true;
        database = {
          type = "postgresql";
        };
      };

      postgresql = {
        ensureDatabases = [ config.services.reposilite.database.dbname ];
        ensureUsers = lib.singleton {
          name = config.services.reposilite.database.user;
        };
      };
    };
  };
}
