## My Nixos Config

This repo contains my entire config that is used to build my NixOS system!

It currently contains the configs for my Framework 13 laptop (`/hosts/fw`).

To use my config, just type the following command (with flakes enabled on your system):
```
sudo nixos-rebuild switch --flake .#[hostname]
```
Replace `[hostname]` with either one of the configurations located in the `flake.nix` file. Right now it's just `fw`.