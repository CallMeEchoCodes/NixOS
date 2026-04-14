{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.reverb.services.postgresql.enable = lib.mkEnableOption "Enable PostgreSQL";

  config = lib.mkIf config.reverb.services.postgresql.enable {
    services.postgresql = {
      enable = true;
      enableJIT = true;

      package = pkgs.postgresql_18;

      checkConfig = true;

      ensureUsers = [
        {
          name = "postgres";
          ensureClauses = {
            superuser = true;
            login = true;
            createrole = true;
            createdb = true;
            replication = true;
          };
        }
      ];

      settings = {
        max_connections = 20;
        superuser_reserved_connections = 3;
      };
    };
  };
}
