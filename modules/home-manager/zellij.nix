{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    settings = { theme = "gruvbox-dark"; };
  };
}
