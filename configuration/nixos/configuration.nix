{ config, pkgs, lib, ... }:
{
  imports = [
    ../hardware-configuration.nix
    ./modules/system.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/graphics.nix
    ./modules/audio.nix
    ./modules/gaming.nix
    ./modules/packages.nix
  ];
  system.stateVersion = "25.05";
}
