{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [
    "fuse"
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.udisks2.enable = true;
  security.polkit.enable = true;


  # Finds identical files and deduplicates them. Just `nix-store --optimise` on a timer.
  nix.optimise = {
    automatic = true;
    # Only runs daily - preferred over auto-optimise-store, which runs every
    # rebuild and makes rebuilds take longer.
    dates = [ "daily" ];
  };

  # Deletes old stuff from the store that's now unreachable.
  # Just `nix-collect-garbage` / `nix-store --gc`) on a timer.
  nix.gc = {
    automatic = true;
    persistent = true; # If system is powered off when timer finishes, do it next time the system power on
    dates = "weekly";
    options = "--delete-older-than 14d"; # Delete old generations
  };
}
