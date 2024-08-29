{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "davegersh";
    userEmail = "davegershman465@gmail.com";
  };


  home.packages = with pkgs; [
    gitui
  ];
}
