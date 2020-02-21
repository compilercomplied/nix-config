
{ config, pkgs, lib, options, ... }:

{

  imports = [
    ./common/configuration.nix
    ./common/system.nix
    ./hosts/box/configuration.nix
    ./hosts/box/hardware.nix
    ./hosts/box/packages.nix
  ];

  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  system.stateVersion = "19.03";

}
