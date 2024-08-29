{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      opener.text = [{run = "hx $@"; block = true;}];
    };
  };
}