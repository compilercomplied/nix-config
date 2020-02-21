
{ config, options, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR="vim";

}
