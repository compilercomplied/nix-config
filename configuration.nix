
{ config, pkgs, options, ... }:

{

  imports = [
    ./host/hardware.nix
    ./host/configuration.nix
    ./common/system.nix
    ./common/configuration.nix
    ./common/pkgs.nix
  ];

  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  system.stateVersion = "19.03";

}
