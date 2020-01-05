
{ config, options, ... }:

{

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "es";
    defaultLocale = "en_US.UTF-8";
  };

  environment.variables.EDITOR="vim";

}
