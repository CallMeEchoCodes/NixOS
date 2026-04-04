{ config, ... }:
{
  time = {
    timeZone = if config.reverb.profiles.server.enable then "UTC" else "Australia/Melbourne";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
    ];
  };
}
