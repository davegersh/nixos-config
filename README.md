## My Nixos Config

This repo contains my entire config that is used to build my NixOS system!

It currently contains the configs for both my main desktop pc (`/hosts/pc`) and my Surface Pro 8 laptop (`/hosts/sp8`).

To use my config, just type the following command (with flakes enabled on your system):
```
sudo nixos-rebuild switch --flake .#[hostname]
```
Replace `[hostname]` with either one of the configurations located in the `flake.nix` file. Right now it's just `pc` and `sp8`.