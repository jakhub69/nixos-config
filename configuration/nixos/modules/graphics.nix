{ pkgs, lib, ... }:

let
  pkgs32 = import pkgs.path {
    system = "i686-linux";
    config.allowUnfree = true;
  };
in
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
    ];
    extraPackages32 = with pkgs32; [
      mesa
      libva
      libvdpau
    ];
  };
}
