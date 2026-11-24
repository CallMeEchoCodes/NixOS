{ config, ... }:
{
  time = {
    timeZone = if config.reverb.profiles.server.enable then "UTC" else "Australia/Melbourne";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocales = [
      "en_GB.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "C.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
      # C is used by some apps to mean english
      # https://wiki.archlinux.org/title/Locale#LANGUAGE:_fallback_locales
      LANGUAGE = "en_AU:en_GB:en_US:en:C";
    };
  };
}
