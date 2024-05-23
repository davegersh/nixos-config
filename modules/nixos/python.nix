{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python312
    poetry
  ];
}
