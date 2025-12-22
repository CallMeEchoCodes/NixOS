{ lib, ... }:
{
  options.capabilities = {
    battery.enable = lib.mkEnableOption "Battery";
    audio.enable = lib.mkEnableOption "Audio";
    graphics.enable = lib.mkEnableOption "Graphics";
    touchpad.enable = lib.mkEnableOption "Touchpad";
  };
}
