{ lib, ... }:
{
  options.capabilities = {
    battery.enable = lib.mkEnableOption "Battery";
    audio.enable = lib.mkEnableOption "Audio";
    graphics.enable = lib.mkEnableOption "Graphics";
    touchpad.enable = lib.mkEnableOption "Touchpad";
  };

  options.monitors = lib.mkOption {
    description = "The set of monitors expected to be plugged in.";

    type = lib.types.attrsOf (
      lib.types.submodule (
        { ... }:
        {
          options = {
            width = lib.mkOption {
              type = lib.types.int;
            };

            height = lib.mkOption {
              type = lib.types.int;
            };

            refreshRate = lib.mkOption {
              type = lib.types.float;
              default = 60.0;
            };

            offsetX = lib.mkOption {
              type = lib.types.int;
              default = 0;
            };

            offsetY = lib.mkOption {
              type = lib.types.int;
              default = 0;
            };

            scale = lib.mkOption {
              type = lib.types.float;
              default = 1;
            };
          };
        }
      )
    );
  };
}
