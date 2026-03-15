{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user.name = "davegersh";
    settings.user.email = "davegershman465@gmail.com";
  };
}
