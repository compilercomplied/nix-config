
{ config, options, ... }:

{

  console.font = "Lat2-Terminus16";
  console.keyMap = "es";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  environment.variables.EDITOR="vim";

}
