# needed to allow automatic importing of all files in the nixos directory

{ lib, ... }:
{
  imports = [
    ./audio.nix
    ./fonts.nix
    ./ld.nix
    ./python.nix
    ./network.nix
    ./hyprland.nix
    ./greetd.nix
    ./bluetooth.nix
    ./niri.nix
  ];
}
